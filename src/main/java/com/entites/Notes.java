package com.entites;

import java.sql.Date;

public class Notes {
	
	private int id;
	private String title;
	private String body;
	private Date nDate;
	private User user;
	public Notes() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Notes(int id, String title, String body, Date nDate, User user) {
		super();
		this.id = id;
		this.title = title;
		this.body = body;
		this.nDate = nDate;
		this.user = user;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public Date getnDate() {
		return nDate;
	}
	public void setnDate(Date nDate) {
		this.nDate = nDate;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
	
}
