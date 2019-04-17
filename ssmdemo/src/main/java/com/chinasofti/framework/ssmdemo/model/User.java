package com.chinasofti.framework.ssmdemo.model;



public class User {
	
	private int userId;
	
	private String username;
	
	private String password;
	
	private String uphone;
	
	private String uqq;
	

	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(String username, String password, String uphone, String uqq) {
		super();
		this.username = username;
		this.password = password;
		this.uphone = uphone;
		this.uqq = uqq;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUphone() {
		return uphone;
	}

	public void setUphone(String uphone) {
		this.uphone = uphone;
	}

	public String getUqq() {
		return uqq;
	}

	public void setUqq(String uqq) {
		this.uqq = uqq;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", username=" + username + ", password=" + password + ", uphone=" + uphone
				+ ", uqq=" + uqq + "]";
	}
	
	
}