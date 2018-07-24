package Node.Data;
import java.net.*;
import java.io.*;
import java.util.*;

import Node.Thread.Printer;
public class StaticNode {
	
	
	public int 			port;
	public String 		Path;
	public String 		Name;
	public int 			cost;
	
	
	public StaticNode(String name, int cost,int  port) {
		this.Name=name;
		this.cost=cost;
		this.port=port;
	}
}
