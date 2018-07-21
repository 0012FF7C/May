package Node.Data;
import java.net.*;
import java.io.*;
import java.util.*;

import Node.Thread.Printer;
public class Neibour {
	public int port;
	public String Path;
	public String Name;
	public int cost;
	Printer printer;
	public Neibour(String name, int cost,int  port) {
		this.Name=name;
		this.cost=cost;
		this.port=port;
	}
}
