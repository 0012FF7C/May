package Node;
import java.net.*;
import java.io.*;
import java.util.*;

import Node.Data.StaticNode;
import Node.Thread.Djikstra;
import Node.Thread.Heart;
import Node.Thread.Printer;
import Node.Thread.Responser;
public class Node {
	public static DatagramSocket 	Servicer;
	public static String			name;
	public static int           	port;
	public static ArrayList StaticNodes;
	public static ArrayList ShortestPaths;
	public static Printer 	pinter;
	public static Djikstra	dijkstra;
	public static Responser 	responser;
	public static Heart  		heart;
	public static ArrayList Configs;
	public static ArrayList Reach;
	public static boolean RunningSteady;
	
	public static DatagramPacket CreateMessage(String Head, String Body,int port) throws UnknownHostException{
		String content = Head+" ";
		content += Body;
		int len = content.length();
		String data = Integer.toString(len)+" "+content;
		
		byte[] b = data.getBytes();
		InetAddress ia = InetAddress.getByName("127.0.0.1");
		DatagramPacket ans = new DatagramPacket(b,b.length,ia,port);
		
		return ans;
	}
	
	public static String getPacketContent(DatagramPacket dp) {
		String s = new String(dp.getData());
		for(int i=0;i<s.length();i++) {
			if(s.charAt(i)==' ') {
				int len = Integer.parseInt(s.substring(0, i));
				return s.substring(i+1,i+1+len);
			}
		}
		return null;
		
	}

	public static String getHead(String s ) {
		for(int i=0;i<s.length();i++) {
			if(s.charAt(i)==' ') {
				return s.substring(0,i);
			}
		}
		return null;
		
	}
	
	public static String getBody(String s ) {
		for(int i=0;i<s.length();i++) {
			if(s.charAt(i)==' ') {
				return s.substring(i+1,s.length());
			}
		}
		return null;
	}

	public static int getLen(String s) {
		int num = -1;
		for(int i=0;i<s.length();i++) {
			if(s.charAt(i)==' ') {
				num++;
			}
		}
		return num+1;
	}
	public static String get(String s, int index ) {
		int beg = 0;
		int end = 0;
		int num = -1;
		for(int i=0;i<s.length();i++) {
			if(s.charAt(i)==' ') {
				num++;
				beg=end;
				end=i;
				if(num==index) {
					if(num==0)
						return s.substring(beg, end);
					else
						return s.substring(beg+1, end);
				}
			}
		}
		return s.substring(end+1, s.length());
	}
	public static String StaticNodeToString(StaticNode n) {
		String ans = new String();
		ans+=n.Name;
		ans+=" ";
		ans+=n.Path;
		ans+=" ";
		ans+=Integer.toString(n.port);
		ans+=" ";
		ans+=Integer.toString(n.cost);
		return ans;
	}

	public static StaticNode StringToStaticNode(String s) {
		StaticNode n = new StaticNode(get(s,0),Integer.parseInt(get(s,3)),Integer.parseInt(get(s,2)));
		n.Path=get(s,1);
		return n;
	}
	@SuppressWarnings("rawtypes")
	public Node(String name , int port, ArrayList Configs) throws IOException {
		RunningSteady=false;
		this.name=name;
		this.port=port;
		this.Configs=Configs;
		
		pinter = new Printer();
		dijkstra = new Djikstra();
		responser = new Responser();
		heart = new Heart();
		
		Servicer = new DatagramSocket(port);
		
		System.out.println("Node "+name+" Initiated");
		StaticNodes = new ArrayList();
		Node.ShortestPaths = new ArrayList();
		Iterator it = Configs.iterator();
		Heart.ResponseStaticNodes = new HashMap();
		while(it.hasNext()) {
			StaticNode n = (StaticNode)it.next();
			DatagramPacket dp = Node.CreateMessage("Online", name, n.port);
			Servicer.send(dp);
		}
	}
	public static boolean AlreadyExist(StaticNode n1) {
		for(int i=0;i<Node.ShortestPaths.size();i++) {
			StaticNode n = (StaticNode)ShortestPaths.get(i);
			if(n.Name.equals(n1.Name))
				return true;
		}
		return false;
	}
	public static int getPort(String str) {
		for(int i=0;i<StaticNodes.size();i++) {
			StaticNode n = (StaticNode)StaticNodes.get(i);
			if(n.Name.equals(str)) {
				return n.port;
			}
		}
		return 3000;
	}
	public static String ArrayListToString(ArrayList al) {
		Iterator it = al.iterator();
		String str = new String();
		while(it.hasNext()) {
			StaticNode n = (StaticNode)it.next();
			str+="{";
			str+=Node.StaticNodeToString(n);
			str+="}";
		}
		return str;
	}
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static ArrayList StringToArratlist(String s) {
		ArrayList al = new ArrayList();
		int beg = 0;
		int end = 0;
		for(int i=0;i<s.length();i++) {
			if(s.charAt(i)=='{') {
				beg=i+1;
			}
			if(s.charAt(i)=='}') {
				end = i;
				String str = s.substring(beg, end);
				StaticNode n = Node.StringToStaticNode(str);
				al.add(n);
			}
		}
		return al;
	}
	public static int getCostTo(String name) {
		Iterator it = StaticNodes.iterator();
		while(it.hasNext()) {
			StaticNode n = (StaticNode)it.next();
			if(n.Name.equals(name)) {
				return n.cost;
			}
		}
		return 0;
	}
	public static void main(String [] args) throws IOException {
//		ArrayList al = new ArrayList();
//		StaticNode n1 = new StaticNode("A",5,3000);
//		n1.Path=new String("EDFFDE");
//		StaticNode n2 = new StaticNode("B",2,2000);
//		al.add(n1);
//		al.add(n2);
//		String str = Node.ArrayListToString(al);
//		System.out.println(str);
//
//		al =StringToArratlist(str) ;
//		System.out.println(al);
		
		DatagramSocket d = new DatagramSocket(3000);
		DatagramPacket dp = Node.CreateMessage("Request", "ABCDEEDCBA 100", 2000);
		d.send(dp);
	}
}
