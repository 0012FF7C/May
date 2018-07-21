package Node;
import java.net.*;
import java.io.*;
import java.util.*;

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
	
	public static String ConfigFilePath;
	
	public static int ResponseNum;
	volatile public static HashMap<String,Integer> ResponseNeibours;
	
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
		int num = 0;
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
					return s.substring(beg, end);
				}
			}
		}
		return null;
	}
	public static void main(String [] args) {
		String s = new String("fjdksah 123 5798 75634");
		System.out.println(get(s,0));
	}
}
