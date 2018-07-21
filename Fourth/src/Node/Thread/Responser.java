package Node.Thread;
import java.net.*;


import Node.Data.Neibour;
import Node.*;
import java.io.*;
import java.util.*;
import Node.Data.*;
import Node.Thread.*;
public class Responser extends Thread{
	
	public void run() {
		byte [] b  =new byte [1024];
		
		DatagramPacket 	dp	 = new DatagramPacket(b,b.length);
		String 			data ;
		String			body ; 
		String 			head ;
		Iterator 		it;
		
		while(true) {
			try {
				Node.Servicer.receive(dp);
				data=Node.getPacketContent(dp);
				head=Node.getHead(data);
				body=Node.getBody(data);
				
				if(head.equals("Online")) {
					it = Node.Neibours.iterator();
					while(it.hasNext()) {
						System.out.println();
					}
					continue;
				}
				if(head.equals("Offline")) {
					
					continue;
				}
				if(head.equals("Shutdown")) {
					
					continue;
				}
				if(head.equals("Check")) {
					DatagramPacket  Data= Node.CreateMessage("Response", Node.name, Node.port);
					Node.Servicer.send(Data);
					continue;
				}
				if(head.equals("Response")) {
					int values=Node.ResponseNeibours.get(body);
					values++;
					Node.ResponseNeibours.put(body, values);
					continue;
				}
			} catch (IOException e)   {
				
				e.printStackTrace();
			}
			
		}
	}
}
