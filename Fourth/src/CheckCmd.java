import java.net.*;

import java.io.*;
import java.util.*;
import Node.*;
import Node.Data.*;

public class CheckCmd {
	public static DatagramSocket 	Servicer1;
	
//	public CheckCmd() throws SocketException {
//		
//	}
	public static void main(String[] args) throws IOException  {

		Servicer1 = new DatagramSocket(3000);
		new Thread() {
            public void run() {
        		byte [] b  =new byte [1024];
        		DatagramPacket 	dp	 = new DatagramPacket(b,b.length);
				String 			data ;
				String			body ; 
				
				while(true) {
					try {
	            		
						Servicer1.receive(dp);
						Thread.sleep(1000);
						if(dp!=null) {
							data = Node.getPacketContent(dp);
							
							body = Node.getBody(data);
							ArrayList SPs = Node.StringToArratlist(body);
							if(SPs.size()==0) {
								System.out.println("Path is not end of operation");
							}else {
								for(int i = 0 ; i < SPs.size() ; i++) {
									Neibour N  = ((Neibour)SPs.get(i));
									System.out.print("least-cost path to node ");
									System.out.print(  N.Name + ":"  );
									System.out.print(  N.Path + " "  );
									System.out.print("and the cost is ");
									System.out.println(  N.cost );
								}
							}
							
							System.out.println("****************************************************************");
							//System.out.println( body);
						}
	            		
					} catch (IOException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
            }
        }.start();//开启线程
        
		byte [] b1  =new byte [1024];
		DatagramPacket 	dp1	 = new DatagramPacket(b1,b1.length);
		while(true) {
			Scanner input = new Scanner(System.in);
			System.out.println("please input which point you want to check：");
			String cmd = input.nextLine();//输入一个整数
			if(cmd.equals("A")) {
				dp1 = Node.CreateMessage("CheckCmd", " ",2000);
			}else if(cmd.equals("B")) {
				dp1 = Node.CreateMessage("CheckCmd", " ",2001);
			}else if(cmd.equals("C")) {
				dp1 = Node.CreateMessage("CheckCmd", " ",2002);
			}else if(cmd.equals("D")) {
				dp1 = Node.CreateMessage("CheckCmd", " ",2003);
			}else if(cmd.equals("E")) {
				dp1 = Node.CreateMessage("CheckCmd", " ",2004);
			}else if(cmd.equals("F")) {
				dp1 = Node.CreateMessage("CheckCmd", " ",2005);
			}
			
//			
//			
//			PortA=2000
//					PortB=2001
//					PortC=2002
//					PortD=2003
//					PortE=2004
//					PortF=2005
			Servicer1.send(dp1);
	
		}
			
	

	}
}
