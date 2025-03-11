package com.entity;

public class Admin {
	private int id;
	private String fullname;
	private String email;
	private String password;
	private String profileImg;
	
	
	public Admin() {
		
	}
	
	
	
	public Admin(String fullname, String email, String password, String profileImg) {
		super();
		this.fullname = fullname;
		this.email = email;
		this.password = password;
		this.profileImg = profileImg;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String work) {
		this.password = work;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profile_img) {
		this.profileImg = profile_img;
	}
	
}
