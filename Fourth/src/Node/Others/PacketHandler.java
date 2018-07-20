package Node.Others;
import java.net.*;
import java.io.*;
import java.util.*;
public class PacketHandler {
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
	
	public static void main(String[] args) throws UnknownHostException {//创建packet的例子。
		
		DatagramPacket ds = CreateMessage("Online", "DotName",3000);//创建一个向3000端口发送的上线消息。
		
		
		String data = getPacketContent(ds);//解包函数
		
		System.out.println(data);
		System.out.println(getHead(data));//得到消息头
		System.out.println(getBody(data));//得到消息体
		
	}
}
