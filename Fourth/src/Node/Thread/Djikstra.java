package Node.Thread;
import java.net.*;
import java.io.*;
import java.util.*;
import Node.Node;
import Node.Data.Neibour;
public class Djikstra extends Thread{
	
	@SuppressWarnings({ "unchecked", "rawtypes", "unused" })
	public void run() {
		System.out.println("Djikstra: Running......");
		int MinCost;
		Neibour temp = null;
		Node.Reach=new ArrayList();
		Iterator it = Node.Neibours.iterator();
		while(it.hasNext()) {//…Ó∂»∏¥÷∆
			Neibour n = (Neibour)it.next();
			Neibour n1 = new Neibour(n.Name,n.cost,n.port);
			Node.Reach.add(n1);
		}
		DatagramPacket dp;
		Node.DjiSignal=false;
		
		it= Node.Reach.iterator();
		while(it.hasNext()) {
			Neibour n = (Neibour)it.next();
			n.Path=new String();
			n.Path+=Node.name;
			n.Path+=n.Name; 
		}
	
		while(true) {
			synchronized(Node.Reach) {
				MinCost=999;
				temp=null;
				for(int i=0;i<Node.Reach.size();i++) {
					Neibour n = (Neibour)Node.Reach.get(i);
					if(MinCost>=n.cost&&!Node.AlreadyExist(n)) {
						MinCost=n.cost;
						temp=n;
					}
				}
				if(temp==null) {
					System.out.println("Djikstra: finished Now Outputing");
					System.out.println("");
					System.out.println("*********************************");
					System.out.println("Djikstra: Shortest Paths");
					for(int i=0;i<Node.ShortesetPaths.size();i++) {
						Neibour n = (Neibour)Node.ShortesetPaths.get(i);
						System.out.println(Node.name+" to "+n.Name+" "+n.Path+" \t"+n.cost);
					}
					System.out.println("*********************************");
					break;
				}
				Node.ShortesetPaths.add(temp);
			}
			String str1 = temp.Path;
			for(int i=str1.length()-1;i>=0;i--) {
				str1+=str1.charAt(i);
			}
			try {
				DatagramPacket d = Node.CreateMessage("Request", str1+" 0", Node.port);
				Node.Servicer.send(d);
				Thread.sleep(1000);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			};
			
		}
		
	}
}
