package Node.Thread;
import java.net.*;


import Node.Data.Neibour;
import Node.*;
import java.io.*;
import java.util.*;
import Node.Data.*;
import Node.Thread.*;
public class Responser extends Thread{
	
	@SuppressWarnings("unchecked")
	public void run() {
		byte [] b  =new byte [1024];
		
		DatagramPacket 	dp	 = new DatagramPacket(b,b.length);
		String 			data ;
		String			body ; 
		String 			head ;
		@SuppressWarnings("rawtypes")
		Iterator 		it;
		@SuppressWarnings("unused")
		boolean         flg;
		while(true) {
			try {
				Node.Servicer.receive(dp);
				data=Node.getPacketContent(dp);
				head=Node.getHead(data);
				body=Node.getBody(data);
				it = Node.Neibours.iterator();
				if(head.equals("Online")) {
					Node.ResponseNeibours.put(body, 0);
					System.out.println("Node Online: " + body);
					it = Node.Configs.iterator();
					while(it.hasNext()) {
						Neibour n = (Neibour)it.next();
						if(n.Name.equals(body) ){
							Node.Neibours.add(n);
							break;
						}
					}
					DatagramPacket  Data= Node.CreateMessage("Ack", Node.name, dp.getPort());
					Node.Servicer.send(Data);
					continue;
				}
				if(head.equals("Offline")) {
					
					continue;
				}
				if(head.equals("Shutdown")) {
					
					continue;
				}
				if(head.equals("Check")) {
					DatagramPacket  Data= Node.CreateMessage("Response", Node.name, dp.getPort());
					Node.Servicer.send(Data);
					continue;
				}
				if(head.equals("Response")) {
					int values=(int) Node.ResponseNeibours.get(body);
					values++;
					Node.ResponseNeibours.put(body, values);
					continue;
				}
				if(head.equals("Ack")) {
					Node.ResponseNeibours.put(body, 0);
					System.out.println("Node Online Ack: " + body);
					it = Node.Configs.iterator();
					while(it.hasNext()) {
						Neibour n = (Neibour)it.next();
						if(n.Name.equals(body) ){
							Node.Neibours.add(n);
							break;
						}
					}
					continue;
				}
			} catch (IOException e)   {
				
				e.printStackTrace();
			}
			
		}
	}
}
