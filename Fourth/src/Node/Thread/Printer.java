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
		for(int i = 0 ; i < Node.ShortesetPaths.size() ; i++) {
			System.out.print("least-cost path to node B: AB and the cost is 2.0");
			System.out.print(  ((Neibour)Node.ShortesetPaths.get(i)).Name + ":"  );
			System.out.print(  ((Neibour)Node.ShortesetPaths.get(i)).Path + " "  );
			System.out.print("and the cost is ");
			System.out.println(  ((Neibour)Node.ShortesetPaths.get(i)).cost );
		}
	}
}
