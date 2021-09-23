package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.entites.Notes;
import com.entites.User;


public class NotesDAO {

	private Connection conn;
	private User user;
	private Notes note;
	public NotesDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	

	public boolean addNotes(String title,String body,String author,int userId) {

		boolean f = false;
		try {
			String qu = "insert into notes(title,body,author,userId) values(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(qu);
			ps.setString(1, title);
			ps.setString(2, body);
			ps.setString(3, author);
			ps.setInt(4, userId);

			int i=ps.executeUpdate();
			if(i==1) {
				f = true;	
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	
	public ArrayList<Notes> getData(int userId){
		
		ArrayList<Notes> list= new ArrayList<Notes>();
		
		
		try {
			
			String que="select * from notes where userId=? order by notesId DESC";
			PreparedStatement ps = conn.prepareStatement(que);
			ps.setInt(1, userId);
			
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				note=new Notes();
				note.setId(rs.getInt(1));
				note.setTitle(rs.getString(2));
				note.setBody(rs.getString(3));
				note.setnDate(rs.getTimestamp(5));
				list.add(note);
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		return list;
		
	}
	
	
	
	public Notes getDataById(int notesId) {
		try {
			
			String que="select * from notes where notesId=? ";
			PreparedStatement ps = conn.prepareStatement(que);
			ps.setInt(1, notesId);
			
			ResultSet rs= ps.executeQuery();
			if(rs.next()) {
				note=new Notes();
				note.setId(rs.getInt(1));
				note.setTitle(rs.getString(2));
				note.setBody(rs.getString(3));
				
				
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return note;
		
	}
	public boolean notesEdit(int notesId,String title,String body) {

		boolean f = false;
		try {
			String qu = "update notes set title=?,body=? where notesId=?";
			PreparedStatement ps = conn.prepareStatement(qu);
			ps.setString(1, title);
			ps.setString(2, body);
			ps.setInt(3, notesId);
			
			
			int i=ps.executeUpdate();
			if(i==1) {
				f = true;	
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	public boolean deleteNotes(int notesId) {

		boolean f = false;
		try {
			String que="delete from notes where notesId=? ";
			PreparedStatement ps = conn.prepareStatement(que);
			ps.setInt(1, notesId);
			
			
			int i=ps.executeUpdate();
			if(i==1) {
				f = true;	
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	
}
