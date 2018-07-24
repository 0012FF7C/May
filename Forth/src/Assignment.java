
import java.io.*;
import java.net.*;
import java.util.*;

import Node.*;
import Node.Data.StaticNode;


public class Assignment {

	public static void main(String[] args) throws IOException, InterruptedException {
		File f = new File(args[2]);
		BufferedReader br = new BufferedReader(new FileReader(f));
		ArrayList al = new ArrayList();
		String str ;
		str= br.readLine();
		while(true) {
			str= br.readLine();
			if(str==null)
				break;
			String Name = Node.get(str, 0);
			int cost = Integer.parseInt(Node.get(str, 1));
			int port = Integer.parseInt(Node.get(str, 2));
			StaticNode n = new StaticNode(Name,cost,port);
			al.add(n);
		}
		
		Node n = new Node(args[0],Integer.parseInt(args[1]),al);
		
		Node.responser.start();
		Node.heart.start();
		Thread.sleep(1000);
		Node.RunningSteady=true;
		Node.dijkstra.start();
		Thread.sleep(6000);
		Node.pinter.start();
		
	}

}
