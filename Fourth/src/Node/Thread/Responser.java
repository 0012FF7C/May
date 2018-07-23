package Node.Thread;
import java.net.*;


import Node.Data.Neibour;
import Node.*;
import java.io.*;
import java.util.*;
import Node.Data.*;
import Node.Thread.*;
public class Responser extends Thread{
	
	@SuppressWarnings("unchecked")
	public void run() {
		byte [] b  =new byte [1024];
		
		DatagramPacket 	dp	 = new DatagramPacket(b,b.length);
		String 			data ;
		String			body ; 
		String 			head ;
		@SuppressWarnings("rawtypes")
		Iterator 		it;
		@SuppressWarnings("unused")
		boolean         flg;
		while(true) {
			try {
				Node.Servicer.receive(dp);
				data=Node.getPacketContent(dp);
				head=Node.getHead(data);
				body=Node.getBody(data);
				it = Node.Neibours.iterator();
				
				if(head.equals("Online")) {
					synchronized(HashMap.class) {
						Node.ResponseNeibours.put(body, 1);
					}
					System.out.println("Main : Node Online: " + body);
					it = Node.Configs.iterator();
					while(it.hasNext()) {
						Neibour n = (Neibour)it.next();
						if(n.Name.equals(body) ){
							Node.Neibours.add(n);
							break;
						}
					}
					DatagramPacket  Data= Node.CreateMessage("Ack", Node.name, dp.getPort());
					Node.Servicer.send(Data);
					continue;
				}
				if(head.equals("Offline")) {
					
					continue;
				}
				if(head.equals("ShutDown")) {
					String NodeName = Node.get(body,0);
					DatagramPacket d;
					String s = NodeName+" "+Integer.toString(Integer.parseInt(Node.get(body,1))-1);
					it = Node.ShortesetPaths.iterator();
					boolean flg1 = false;
					while(it.hasNext()) {
						Neibour temp = (Neibour)it.next();
						if(temp.Name.equals(NodeName)) {
							it.remove();
							flg1=true;
						}
					}
					if(flg1) {
						Djikstra d1 = new  Djikstra();
						System.out.println("Main : Node Shut down =="+NodeName+"== Dijkstra restart");
						d1.start();
						it = Node.Neibours.iterator();
						while(it.hasNext()) {
							Neibour temp = (Neibour)it.next();
							d = Node.CreateMessage("ShutDown", s, temp.port);
						}
					}
					
					continue;
				}
				if(head.equals("Check")) {
					DatagramPacket  Data= Node.CreateMessage("Response", Node.name, dp.getPort());
					Node.Servicer.send(Data);
					continue;
				}
				if(head.equals("Response")) {
					synchronized(HashMap.class) {
						int values=(int) Node.ResponseNeibours.get(body);
						values++;
						Node.ResponseNeibours.put(body, values);
						continue;
					}
				}
				if(head.equals("Ack")) {
					System.out.println("Main : Online Ack "+body);
					synchronized(HashMap.class) {
						Node.ResponseNeibours.put(body, 1);
					}
					it = Node.Configs.iterator();
					while(it.hasNext()) {
						Neibour n = (Neibour)it.next();
						if(n.Name.equals(body) ){
							Node.Neibours.add(n);
							break;
						}
					}
					continue;
				}
				if(head.equals("Request")) {
					String nextNode = body.substring(1, 2);//例如"BBCA 200"
					int cost;
					if(nextNode.equals(Node.name)) {//到达目的地开始返回数据
						nextNode=body.substring(2, 3); //拿出C
						cost = Integer.parseInt(Node.get(body, 1));//得到cost
						String route = Node.get(body, 0).substring(2, Node.get(body, 0).length());
						String Path = Node.get(body, 0);
						Path=Path.substring(1, Path.length());//"BCA"
						String temp = new String();
						for(int i=0;i<Path.length();i++) {
							temp=Path.charAt(i)+temp;
						}//倒转
						Path=temp;
						ArrayList al = new ArrayList();
						it = Node.Neibours.iterator();
						while(it.hasNext()) {//深复制
							Neibour n = (Neibour) it.next();
							Neibour n1 = new Neibour(n.Name,n.cost,n.port);
							boolean flg1 = true;
							for(int i = 0; i<Path.length();i++) {
								if(Path.substring(i,i+1).equals(n1.Name))
									flg1=false;
							}
							if(flg1)
								al.add(n1);
							
						}
						it = al.iterator();//cost赋值完成 Path赋值完成
						while(it.hasNext()) {
							Neibour n = (Neibour) it.next();
							n.cost+=cost;
							n.Path=Path;
							n.Path+=n.Name;
							
						}
						String DATA = route+" "+Node.ArrayListToString(al);
						DatagramPacket d = Node.CreateMessage("NodeNeibour", DATA, Node.getPort(nextNode));
						Node.Servicer.send(d);
						
					}
					else {//否则转发例如“BCDDCBA 200” 收到的时候字符串第一位是本节点的名称。
						cost = Integer.parseInt(Node.get(body, 1));
						String Transmit = Node.get(body, 0);
						Transmit=Transmit.substring(1, Transmit.length());
						cost += Node.getCostTo(nextNode);
						Transmit+=" ";
						Transmit+=Integer.toString(cost);
						DatagramPacket d = Node.CreateMessage("Request",Transmit,Node.getPort(nextNode));
						Node.Servicer.send(d);
						
					}
					
				}
				if(head.equals("NodeNeibour")) {
					if(Node.get(body, 0).equals(Node.name)) {//数据包已经到达目的地
						//System.out.println(Node.name+" Answer Reached"+body);
						Iterator it2 = Node.Reach.iterator();
						ArrayList al = Node.StringToArratlist(body);
						it = al.iterator();
						boolean flg1;
						while(it.hasNext()) {
							Neibour n = (Neibour)it.next();
							while(it2.hasNext()) {
								Neibour n2 = (Neibour)it2.next();
								if(n.Name.equals(n2.Name)&&n2.cost>n.cost) {
										n2=n;
								}
							}
						}
						synchronized(Node.Reach) {//更新Reach 使用程序锁
							flg1=true;
							for(int i=0;i<al.size();i++) {
								Neibour NewNode = (Neibour)al.get(i);
								for(int j=0;j<Node.Reach.size();j++) {
									Neibour OldOne = (Neibour)Node.Reach.get(j);
									if(NewNode.Name.equals(OldOne.Name)&&NewNode.cost<OldOne.cost) {
										OldOne.cost=NewNode.cost;
										OldOne.Path=NewNode.Path;
										flg1=false;
									}
								}
								if(flg1) {
									Node.Reach.add(NewNode);
								}
							}
//							for(int i=0;i<Node.Reach.size();i++) {
//								Neibour n = (Neibour)Node.Reach.get(i);
//								System.out.println(n.Name+" "+n.Path+" "+n.cost);
//							}
							
						}
					}
					else {//否则转发
						String nextNode = body.substring(1,2);
						String DATA = body.substring(1,body.length());
						DatagramPacket d = Node.CreateMessage("NodeNeibour",DATA,Node.getPort(nextNode));
						Node.Servicer.send(d);
						//System.out.println(Node.name+" NodeNeibour Transmitted "+DATA);
					}
				}
			} catch (IOException e)   {
				
				e.printStackTrace();
			}
			
		}
	}
}
