
public class B extends Thread{
	A a;
	B(A a){
		this.a=a;
	}
	public void run() {
		a.S=new Sting("hello world");
	}
}
