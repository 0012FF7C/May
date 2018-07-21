package Node.Thread;
import java.net.*;
import java.io.*;
import java.util.*;
import Node.*;
import Node.Data.*;
public class Printer extends Thread{
	
	//最短路径中记录的是port 需要将Port解析为节点的名称
	public void run() {//睡眠30秒后输出最短路径数组中的内容
		//注意调用ArrayList的类锁
		for(int i = 0 ; i < Node.ShortesetPaths.size() ; i++) {
			System.out.print("least-cost path to node B: AB and the cost is 2.0");
			System.out.print(  ((Neibour)Node.ShortesetPaths.get(i)).Name + ":"  );
			System.out.print(  ((Neibour)Node.ShortesetPaths.get(i)).Path + " "  );
			System.out.print("and the cost is ");
			System.out.println(  ((Neibour)Node.ShortesetPaths.get(i)).cost );
		}
	}
}
