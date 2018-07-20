package Node.Thread;
import java.net.*;
import java.io.*;
import java.util.*;
public class Djikstra extends Thread{
	ArrayList Neibours;
	ArrayList ShortestPath;
	public Djikstra(ArrayList Neibours, ArrayList ShortestPath){
		this.Neibours=Neibours;
		this.ShortestPath=ShortestPath;
	}
	public void run() {
		
	}
}
