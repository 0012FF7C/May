package Node.Thread;
import java.net.*;

import java.io.*;
import java.util.*;
import Node.*;
import Node.Data.*;
public class Heart extends Thread{
	volatile public static HashMap ResponseStaticNodes;
	
	@SuppressWarnings("unchecked")
	public void run() {
		
		DatagramPacket Data;
		try {
			while(true) {

				synchronized(HashMap.class) {
					for(int i=0;i<Node.StaticNodes.size();i++) {
						StaticNode n = (StaticNode)Node.StaticNodes.get(i);
						ResponseStaticNodes.put(n.Name, 0);
					}
				}
				int cnt = 5;
				while(cnt>0) {
					for(int i=0;i<Node.StaticNodes.size();i++) {
						StaticNode n = (StaticNode)Node.StaticNodes.get(i);
						
						if(cnt==3) {
							ResponseStaticNodes.put(n.Name, 0);
						}
						Data = Node.CreateMessage("Check", Node.name, n.port);
						
						Node.Servicer.send(Data);
						cnt--;
					}
					Thread.sleep(2000);
				}
				
				Set set = ResponseStaticNodes.keySet();
				Iterator it = set.iterator();
				Iterator it2=Node.StaticNodes.iterator();
				while(it.hasNext()) {
					String str = (String)it.next();
					int count = (int)ResponseStaticNodes.get(str);
	
	
					for(int i = 0;i < Node.StaticNodes.size();i++) {
						StaticNode n1 =(StaticNode)Node.StaticNodes.get(i);
						if((n1.Name.equals(str))&&count==0) {
							System.out.println("Node is dead "+str);
							while(it2.hasNext()) {
								StaticNode n2 = (StaticNode)it2.next();
								if(n2.Name.equals(str)) {
									it2.remove();
									break;
								}
							}
							it.remove();
							
							for(int j=0;j< Node.StaticNodes.size();j++) {
								StaticNode temp = (StaticNode)Node.StaticNodes.get(j);
								Data = Node.CreateMessage("ShutDown", str+" 6", temp.port);
								Node.Servicer.send(Data);
							}
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
