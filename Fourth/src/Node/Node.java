package Node;
import java.net.*;
import java.io.*;
import java.util.*;

import Node.Thread.Djikstra;
import Node.Thread.Heart;
import Node.Thread.Printer;
import Node.Thread.Responser;
public class Node {
	DatagramSocket Servicer;
	String name;
	int port;

	ArrayList Neibours;
	ArrayList ShortesetPaths;
	
	Printer pinter;
	Djikstra dijkstra;
	Responser responser;
	Heart heart;
}
