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
		while(true) {

			synchronized(HashMap.class) {
				for(int i = 0 ; i < Node.ShortestPaths.size() ; i++) {
					StaticNode N  = ((StaticNode)Node.ShortestPaths.get(i));
					System.out.print("least-cost path to node ");
					System.out.print(  N.Name + ":"  );
					System.out.print(  N.Path + " "  );
					System.out.print("and the cost is ");
					System.out.println(  N.cost );
				}
				System.out.println("****************************************************************");

			}
			
			try {
				Thread.sleep(20000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
