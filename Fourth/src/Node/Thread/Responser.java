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
				
				if(Node.getHead(data).equals("Online")) {
					it = Node.Neibours.iterator();
					while(it.hasNext()) {
						System.out.println();
					}
					continue;
				}
				if(Node.getHead(data).equals("Offline")) {
					
					continue;
				}
				if(Node.getHead(data).equals("Shutdown")) {
					
					continue;
				}
				if(Node.getHead(data).equals("Check")) {
					
					continue;
				}
				if(Node.getHead(data).equals("Response")) {
					
					continue;
				}
			} catch (IOException e)   {
				
				e.printStackTrace();
			}
			
		}
	}
}
