
public class test {
	A a;
	B b;
	test(){
		b=new B(a);
	}
	public static void main(String[] args) {
		test t=new test();
		t.b.start();
		System.out.println(t.a.S);

	}

}
