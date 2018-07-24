package Node.Thread;
import java.net.*;


import Node.Data.StaticNode;
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
						Heart.ResponseNeibours.put(body, 1);
					}
					System.out.println("Main : Node Online: " + body);
					it = Node.Configs.iterator();
					while(it.hasNext()) {
						StaticNode n = (StaticNode)it.next();
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
					String NodeName = body;
					DatagramPacket d;
					it = Node.Neibours.iterator();
					boolean flg1 = false;
					while(it.hasNext()) {
						StaticNode temp = (StaticNode)it.next();
						if(temp.Name.equals(NodeName)) {
							it.remove();
							flg1=true;
						}
					}
					it = Node.ShortestPaths.iterator();
					while(it.hasNext()) {
						StaticNode temp = (StaticNode)it.next();
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
							StaticNode temp = (StaticNode)it.next();
							d = Node.CreateMessage("ShutDown", NodeName, temp.port);
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
						int values=(int) Heart.ResponseNeibours.get(body);
						values++;
						Heart.ResponseNeibours.put(body, values);
						continue;
					}
				}
				if(head.equals("Ack")) {
					System.out.println("Main : Online Ack "+body);
					synchronized(HashMap.class) {
						Heart.ResponseNeibours.put(body, 1);
					}
					it = Node.Configs.iterator();
					while(it.hasNext()) {
						StaticNode n = (StaticNode)it.next();
						if(n.Name.equals(body) ){
							if(Node.RunningSteady) {
								Djikstra d1 = new Djikstra();
								d1.start();
							}
							Node.Neibours.add(n);
							break;
						}
					}
					continue;
				}
				if(head.equals("Request")) {
					String nextNode = body.substring(1, 2);//����"BBCA 200"
					int cost;
					if(nextNode.equals(Node.name)) {//����Ŀ�ĵؿ�ʼ��������
						nextNode=body.substring(2, 3); //�ó�C
						cost = Integer.parseInt(Node.get(body, 1));//�õ�cost
						String route = Node.get(body, 0).substring(2, Node.get(body, 0).length());
						String Path = Node.get(body, 0);
						Path=Path.substring(1, Path.length());//"BCA"
						String temp = new String();
						for(int i=0;i<Path.length();i++) {
							temp=Path.charAt(i)+temp;
						}//��ת
						Path=temp;
						ArrayList al = new ArrayList();
						it = Node.Neibours.iterator();
						while(it.hasNext()) {//���
							StaticNode n = (StaticNode) it.next();
							StaticNode n1 = new StaticNode(n.Name,n.cost,n.port);
							boolean flg1 = true;
							for(int i = 0; i<Path.length();i++) {
								if(Path.substring(i,i+1).equals(n1.Name))
									flg1=false;
							}
							if(flg1)
								al.add(n1);
							
						}
						it = al.iterator();//cost��ֵ��� Path��ֵ���
						while(it.hasNext()) {
							StaticNode n = (StaticNode) it.next();
							n.cost+=cost;
							n.Path=Path;
							n.Path+=n.Name;
							
						}
						String DATA = route+" "+Node.ArrayListToString(al);
						DatagramPacket d = Node.CreateMessage("NodeStaticNode", DATA, Node.getPort(nextNode));
						Node.Servicer.send(d);
						
					}
					else {//����ת�����硰BCDDCBA 200�� �յ���ʱ���ַ�����һλ�Ǳ��ڵ�����ơ�
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
				if(head.equals("NodeStaticNode")) {
					if(Node.get(body, 0).equals(Node.name)) {//���ݰ��Ѿ�����Ŀ�ĵ�
						//System.out.println(Node.name+" Answer Reached"+body);
						Iterator it2 = Node.Reach.iterator();
						ArrayList al = Node.StringToArratlist(body);
						it = al.iterator();
						boolean flg1;
						while(it.hasNext()) {
							StaticNode n = (StaticNode)it.next();
							while(it2.hasNext()) {
								StaticNode n2 = (StaticNode)it2.next();
								if(n.Name.equals(n2.Name)&&n2.cost>n.cost) {
										n2=n;
								}
							}
						}
						if(al.size()==0)
							System.out.println("Reach : Lost Occured");
						synchronized(Node.Reach) {//����Reach ʹ�ó�����
							
							for(int i=0;i<al.size();i++) {
								flg1=true;
								StaticNode NewNode = (StaticNode)al.get(i);
								for(int j=0;j<Node.Reach.size();j++) {
									StaticNode OldOne = (StaticNode)Node.Reach.get(j);
									if(NewNode.Name.equals(OldOne.Name)&&NewNode.cost<=OldOne.cost) {
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
//								StaticNode n = (StaticNode)Node.Reach.get(i);
//								System.out.println(n.Name+" "+n.Path+" "+n.cost);
//							}
							
						}
					}
					else {//����ת��
						String nextNode = body.substring(1,2);
						String DATA = body.substring(1,body.length());
						DatagramPacket d = Node.CreateMessage("NodeStaticNode",DATA,Node.getPort(nextNode));
						Node.Servicer.send(d);
						//System.out.println(Node.name+" NodeStaticNode Transmitted "+DATA);
					}
				}
				if(head.equals("CheckCmd")) {
					String retMessage = Node.ArrayListToString(Node.ShortestPaths);
					DatagramPacket  Data= Node.CreateMessage("ReCheckCmd", retMessage, dp.getPort());
					//System.out.println("wo shoudaoi le cmd");
					Node.Servicer.send(Data);
					continue;
				}
				
				
			} catch (IOException e)   {
				
				e.printStackTrace();
			}
			
		}
	}
}
