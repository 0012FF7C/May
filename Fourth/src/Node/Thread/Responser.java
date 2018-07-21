package Node.Thread;
import java.net.*;

import Node.Data.Neibour;
import Node.Others.*;
import java.io.*;
import java.util.*;
public class Responser extends Thread{
	DatagramSocket ds;
	ArrayList Neibours;
	ArrayList ShortesetPaths;
	public Responser(DatagramSocket ds,	ArrayList Neibours,ArrayList ShortesetPaths) {
		this.ds=ds;
		this.Neibours=Neibours;
		this.ShortesetPaths=ShortesetPaths;
	}
	public void run() {
		byte [] b  =new byte [1024];
		DatagramPacket dp= new DatagramPacket(b,b.length);
		String data ;
		String body ; 
		String head ;
		Iterator it;
		while(true) {
			try {
				ds.receive(dp);
				data=Node.Others.PacketHandler.getPacketContent(dp);
				head=Node.Others.PacketHandler.getHead(data);
				body=Node.Others.PacketHandler.getBody(data);
				
				if(Node.Others.PacketHandler.getHead(data).equals("Online")) {
					it = Neibours.iterator();
					while(it.hasNext()) {
						System.out.println();
					}
					continue;
				}
				if(Node.Others.PacketHandler.getHead(data).equals("Offline")) {
					
					continue;
				}
				if(Node.Others.PacketHandler.getHead(data).equals("Shutdown")) {
					
					continue;
				}
				if(Node.Others.PacketHandler.getHead(data).equals("Check")) {
					
					continue;
				}
				if(Node.Others.PacketHandler.getHead(data).equals("Response")) {
					
					continue;
				}
			} catch (IOException e) {
				
				e.printStackTrace();
			}
			
		}
	}
}
