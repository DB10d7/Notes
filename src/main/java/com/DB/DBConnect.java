package com.DB;
import java.sql.*;
public class DBConnect {

	private static Connection conn;
	public static Connection getConnection() {
		
		try {
			if(conn==null) {
				Class.forName("com.mysql.jdbc.Driver");
				conn=DriverManager.getConnection("jdbc:mysql://uhh4giryyv2a3ka9:TBgi0GiJ9FHrf7WwqmH9@bz3cealx25kcege6tkew-mysql.services.clever-cloud.com:3306/bz3cealx25kcege6tkew","uhh4giryyv2a3ka9","TBgi0GiJ9FHrf7WwqmH9");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
}
