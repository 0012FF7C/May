package Node.Thread;
import java.net.*;
import java.io.*;
import java.util.*;
import Node.Node;
import Node.Data.Neibour;
public class Djikstra extends Thread{
	
	@SuppressWarnings({ "unchecked", "rawtypes", "unused" })
	public void run() {
		int MinCost;
		Neibour temp = null;
		Node.Reach = (ArrayList) Node.Neibours.clone();
		DatagramPacket dp;
		Iterator it;
		
		
		it= Node.Neibours.iterator();
		while(it.hasNext()) {
			Neibour n = (Neibour)it.next();
			n.Path=new String();
			n.Path+=Node.name;
			n.Path+=n.Name;
		}
	
		while(true) {
			MinCost=999;
			temp=null;
			for(int i=0;i<Node.Reach.size();i++) {
				Neibour n = (Neibour)Node.Reach.get(i);
				if(MinCost>=n.cost&&!Node.AlreadyExist(n)) {
					MinCost=n.cost;
					temp=n;
				}
			}
			if(temp==null)
				continue;
			String str1 = temp.Path;
			String str2 = new String();
			
			for(int i=0;i<str1.length();i++) {
				str2 = str1.charAt(i)+str2;
			}
			String str = str1+str2;
			str= str.substring(1,str.length());
			try {
				String temp1 = new String();
				temp1+=str.charAt(0);
				str+=" ";
				str +=Node.getCostTo(temp1);
				dp=Node.CreateMessage("Request", str, Node.getPort(temp1));
				Node.Servicer.send(dp);
				Thread.sleep(5000);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}
		
	}
}
