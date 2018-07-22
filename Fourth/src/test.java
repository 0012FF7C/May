import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.SocketException;

public class test {

	public static void main(String[] args) throws IOException {
		DatagramSocket ds = new DatagramSocket(3000);
		byte [] b = new byte [1024];
		DatagramPacket dp = new DatagramPacket(b,b.length);
		while(true) {
			ds.receive(dp);
			System.out.println(Node.Node.getPacketContent(dp));
		}
	}

}
