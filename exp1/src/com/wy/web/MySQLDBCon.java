package com.wy.web;

import java.sql.Connection;
import java.sql.DriverManager;

/**建立数据库连接**/

public class MySQLDBCon {
	private static Connection conn=null;
	public static Connection getCon(){
		try{ 
			Class.forName("com.mysql.cj.jdbc.Driver");
			String user="root";
			String pwd="qw123456";
			String url="jdbc:mysql://localhost:3306/users?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC";
			conn=DriverManager.getConnection(url,user,pwd);
		}catch(Exception e){
			e.printStackTrace();
		}
		return conn;
	}
}
