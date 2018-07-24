package Node.Thread;
import java.net.*;

import java.io.*;
import java.util.*;
import Node.*;
import Node.Data.*;
public class Heart extends Thread{


	volatile public static HashMap ResponseNeibours;

	
	@SuppressWarnings("unchecked")
	public void run() {
		
		DatagramPacket Data;
		try {
			while(true) {

				synchronized(HashMap.class) {
					for(int i=0;i<Node.Neibours.size();i++) {
						StaticNode n = (StaticNode)Node.Neibours.get(i);
						ResponseNeibours.put(n.Name, 0);
					}
				}
				int cnt = 5;
				while(cnt>0) {
					for(int i=0;i<Node.Neibours.size();i++) {
						StaticNode n = (StaticNode)Node.Neibours.get(i);
						
						if(cnt==3) {
							ResponseNeibours.put(n.Name, 0);
						}
						Data = Node.CreateMessage("Check", Node.name, n.port);
						
						Node.Servicer.send(Data);
						cnt--;
					}
					Thread.sleep(2000);
				}
				
				Set set = ResponseNeibours.keySet();
				Iterator it = set.iterator();
				Iterator it2=Node.Neibours.iterator();
				while(it.hasNext()) {
					String str = (String)it.next();
					int count = (int)ResponseNeibours.get(str);
	
	
					for(int i = 0;i < Node.Neibours.size();i++) {
						StaticNode n1 =(StaticNode)Node.Neibours.get(i);
						if((n1.Name.equals(str))&&count==0) {
							System.out.println("Checker : Node is dead "+str);
							while(it2.hasNext()) {
								StaticNode n2 = (StaticNode)it2.next();
								if(n2.Name.equals(str)) {
									it2.remove();
									break;
								}
							}
							it.remove();
							
							Data = Node.CreateMessage("ShutDown", str, Node.port);
							Node.Servicer.send(Data);
						}
					}
				
				}
				
			  
			}
			 
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
