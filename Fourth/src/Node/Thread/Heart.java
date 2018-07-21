package Node.Thread;
import java.net.*;

import java.io.*;
import java.util.*;
import Node.*;
import Node.Data.*;
public class Heart extends Thread{
	
	public void run() {
		
		DatagramPacket Data;
		try {
			int cnt = 3;
			while(cnt>0) {
				for(int i=0;i<Node.Neibours.size();i++) {
					Neibour n = (Neibour)Node.Neibours.get(i);
					Node.ResponseNeibours.put(n.Name, 0);
					Data = Node.CreateMessage("Check", "", n.port);
					Node.Servicer.send(Data);
					cnt--;
				}
				Thread.sleep(250);
			}
			
			Set set = Node.ResponseNeibours.keySet();
			Iterator it = set.iterator();
			while(it.hasNext()) {
				String str = (String)it.next();
				int count = (int)Node.ResponseNeibours.get(str);
			

				for(int i = 0;i < Node.Neibours.size();i++) {
					Neibour n1 =(Neibour)Node.Neibours.get(i);
					if(n1.Name.equals(str)) {
						it.remove();
					}else {
						Data = Node.CreateMessage("ShutDown", str+" 6", n1.port);
						Node.Servicer.send(Data);
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
