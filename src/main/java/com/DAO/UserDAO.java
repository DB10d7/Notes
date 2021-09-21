package com.DAO;
import java.sql.*;
import com.entites.*;
public class UserDAO {

	private Connection conn;
	private User user;
	public UserDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean userRegister(User user) {
		
		
		boolean f=false;
		try {
			String qu="insert into user(name,email,password) values(?,?,?)";
			PreparedStatement ps=conn.prepareStatement(qu);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			
			ps.executeUpdate();
			f=true;
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return f;
	}
	
	public User getLogin(String email, String pass) {
		try {
			String que="select * from user where email=? and password=?";
			PreparedStatement pst=conn.prepareStatement(que);	
			pst.setString(1, email);
			pst.setString(2, pass);
			ResultSet rs= pst.executeQuery();
			
			if(rs.next()) {
				user = new User(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4));
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
