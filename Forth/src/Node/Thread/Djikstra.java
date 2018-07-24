package Node.Thread;
import java.net.*;
import java.io.*;
import java.util.*;
import Node.Node;
import Node.Data.StaticNode;
public class Djikstra extends Thread{
	
	@SuppressWarnings({ "unchecked", "rawtypes", "unused" })
	public void run() {
		System.out.println("Djikstra: Running......");
		int MinCost;
		StaticNode temp = null;
		Node.Reach=new ArrayList();
		Iterator it = Node.StaticNodes.iterator();
		while(it.hasNext()) {//…Ó∂»∏¥÷∆
			StaticNode n = (StaticNode)it.next();
			StaticNode n1 = new StaticNode(n.Name,n.cost,n.port);
			Node.Reach.add(n1);
		}
		DatagramPacket dp;
		
		it= Node.Reach.iterator();
		while(it.hasNext()) {
			StaticNode n = (StaticNode)it.next();
			n.Path=new String();
			n.Path+=Node.name;
			n.Path+=n.Name; 
		}
	
		while(true) {
			synchronized(Node.Reach) {
				MinCost=999;
				temp=null;
				for(int i=0;i<Node.Reach.size();i++) {
					StaticNode n = (StaticNode)Node.Reach.get(i);
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
					for(int i=0;i<Node.ShortestPaths.size();i++) {
						StaticNode n = (StaticNode)Node.ShortestPaths.get(i);
						System.out.println(Node.name+" to "+n.Name+" "+n.Path+" \t"+n.cost);
					}
					System.out.println("*********************************");
					break;
				}
				Node.ShortestPaths.add(temp);
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
