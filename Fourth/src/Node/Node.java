package Node;
import java.net.*;
import java.io.*;
import java.util.*;

import Node.Data.Neibour;
import Node.Thread.Djikstra;
import Node.Thread.Heart;
import Node.Thread.Printer;
import Node.Thread.Responser;
public class Node {
	public static DatagramSocket 	Servicer;
	public static String			name;
	public static int           	port;
	public static ArrayList Neibours;
	public static ArrayList ShortesetPaths;
	public static Printer 	pinter;
	public static Djikstra	dijkstra;
	public static Responser 	responser;
	public static Heart  		heart;
	public static ArrayList Configs;
	public static int ResponseNum;
	public static ArrayList Reach;
	volatile public static HashMap ResponseNeibours;
	public static boolean used;
	
	public static DatagramPacket CreateMessage(String kind, String Messege,int port) throws UnknownHostException{
		String content = kind+" ";
		content += Messege;
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
	public static String NeibourToString(Neibour n) {
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

	public static Neibour StringToNeibour(String s) {
		Neibour n = new Neibour(get(s,0),Integer.parseInt(get(s,2)),Integer.parseInt(get(s,3)));
		n.Path=get(s,1);
		return n;
	}
	@SuppressWarnings("rawtypes")
	public Node(String name , int port, ArrayList Configs) throws IOException {
		this.name=name;
		this.port=port;
		this.Configs=Configs;
		
		pinter = new Printer();
		dijkstra = new Djikstra();
		responser = new Responser();
		heart = new Heart();
		
		Servicer = new DatagramSocket(port);
		
		System.out.println("Node "+name+" Initiated");
		Neibours = new ArrayList();
		Node.ShortesetPaths = new ArrayList();
		Iterator it = Configs.iterator();
		Node.ResponseNeibours = new HashMap();
		while(it.hasNext()) {
			Neibour n = (Neibour)it.next();
			DatagramPacket dp = Node.CreateMessage("Online", name, n.port);
			Servicer.send(dp);
		}
	}
	public static boolean AlreadyExist(Neibour n1) {
		for(int i=0;i<Node.ShortesetPaths.size();i++) {
			Neibour n = (Neibour)ShortesetPaths.get(i);
			if(n.Name.equals(n1.Name))
				return true;
		}
		return false;
	}
	public static int getPort(String str) {
		for(int i=0;i<Neibours.size();i++) {
			Neibour n = (Neibour)Neibours.get(i);
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
			Neibour n = (Neibour)it.next();
			str+="{";
			str+=Node.NeibourToString(n);
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
				Neibour n = Node.StringToNeibour(str);
				al.add(n);
			}
		}
		return al;
	}
	public static int getCostTo(String name) {
		Iterator it = Neibours.iterator();
		while(it.hasNext()) {
			Neibour n = (Neibour)it.next();
			if(n.Name.equals(name)) {
				return n.cost;
			}
		}
		return 0;
	}
	public static void main(String [] args) {
		ArrayList al = new ArrayList();
		Neibour n1 = new Neibour("A",5,3000);
		n1.Path=new String("EDFFDE");
		Neibour n2 = new Neibour("B",2,2000);
		al.add(n1);
		al.add(n2);
		String str = Node.ArrayListToString(al);
		System.out.println(str);

		al =StringToArratlist(str) ;
		System.out.println(al);
		
	}
}
