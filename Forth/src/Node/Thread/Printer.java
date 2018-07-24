package Node.Thread;
import java.net.*;
import java.io.*;
import java.util.*;
import Node.*;
import Node.Data.*;
public class Printer extends Thread{
	
	//���·���м�¼����port ��Ҫ��Port����Ϊ�ڵ������
	public void run() {//˯��30���������·�������е�����
		//ע�����ArrayList������
		while(true) {
			System.out.println("Printer : ");
			System.out.println("****************************************************************");
			for(int i = 0 ; i < Node.ShortestPaths.size() ; i++) {
				StaticNode N  = ((StaticNode)Node.ShortestPaths.get(i));
				System.out.print("least-cost path to node ");
				System.out.print(  N.Name + ":"  );
				System.out.print(  N.Path + " "  );
				System.out.print("and the cost is ");
				System.out.println(  N.cost );
			}
			System.out.println("****************************************************************");
			try {
				Thread.sleep(20000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
