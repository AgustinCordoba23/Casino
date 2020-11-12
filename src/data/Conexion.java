package data;

import java.sql.*;

public class Conexion {

	private static Conexion instancia;
	
	//private String driver="com.mysql.jdbc.Driver";
	//private String driver="com.mysql.cj.jdbc.Driver";
	
	/*//datos para workbench local
	private String host="localhost";
	private String port="3306";
	private String user="root";
	private String password="agustin23";
	private String db="casino_asam"; */
	
	//layershift (agustincor..)
	//ademas tiene configurado el file opt/tomcat/temp/mydb.cfg en el panel
	private String driver="com.mysql.jdbc.Driver";
	private String host = "node236314-casino.phx.enscaled.us";
	private String user= "root";
	private String password ="QLLeva82460";
	private String db = "casino";
	
	/*// reclaim-cloud (mariselpass..)
	private String driver="com.mysql.cj.jdbc.Driver";
	private String host = "node4530-casino.us.reclaim.cloud";
	private String user= "root";
	private String password ="VATnyf09184";
	private String db = "casino"; */
	
	private int conectados=0;
	private Connection conn=null; 
	
	private Conexion() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static Conexion getInstancia() {
		if (instancia == null) {
			instancia = new Conexion();
		}
		return instancia;
	}
	
	public Connection getConn() {
		try {
			if(conn==null || conn.isClosed()) {
				//conn=DriverManager.getConnection("jdbc:mysql://"+host+":"+port+"/"+db, user, password);
				conn=DriverManager.getConnection("jdbc:mysql://"+host+"/"+db, user, password);
				conectados=0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		conectados++;
		return conn;
	}
	
	public void releaseConn() {
		conectados--;
		try {
			if (conectados<=0) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}