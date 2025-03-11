package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.entity.Admin;
import com.entity.Events;
import com.entity.User;


public class Admindao {
	private Connection conn;
	public Admindao(Connection conn) {
		super();
		this.conn=conn;
	}
	
	public boolean addEvent(Events event) {
		boolean f=false;
		try {
			String query="insert into events(event_name, event_date, description, organizer, event_img, venue, form_link) values(?,?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(2,event.getEventDate());
			ps.setString(1,event.getEventName());
			ps.setString(3,event.getEventDesc());
			ps.setString(4,event.getEventOrganizer());
			ps.setString(5,event.getEventImg());	
			ps.setString(6,event.getEventVenue());
			ps.setString(7,event.getEventLink());	
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}


		}catch(SQLException e) {
			e.printStackTrace();

		}
		return f;
	}
	public boolean addAdmin(Admin admin) {
		boolean f=false;
		try {
			String query="insert into admin(name, email, password, profile_img) values(?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1,admin.getFullname());
			ps.setString(2,admin.getEmail());
			ps.setString(3,admin.getPassword());
			ps.setString(4,admin.getProfileImg());
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}


		}catch(SQLException e) {
			e.printStackTrace();

		}
		return f;
	}

	public String getHashedPwd(String email) {
		try {
			String query="select password from admin where email=?";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1,email);
			String pwd="";
		
		ResultSet rs=ps.executeQuery();
			while(rs.next()) {
			pwd=rs.getString("password");
			return pwd;
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}
		
		
		
		return "";
		
	}

	public Admin login(String email,String password) {
		Admin admin=null;
		try {
			String query="select * from admin where email=?";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1,email);
			
		
		ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				admin=new Admin();
				admin.setId(rs.getInt(1));
				admin.setFullname(rs.getString(2));
				admin.setEmail(rs.getString(3));
				admin.setPassword(rs.getString(4));
				admin.setProfileImg(rs.getString(5));
	
			
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}
		
		
		return admin;
		
	}
	
	
	public boolean updateStatus(int id, String s) {
		boolean f=false;
		try {
		String query="UPDATE alumnus_bio SET status = ? WHERE id = ?";
		PreparedStatement ps=conn.prepareStatement(query);
		ps.setString(1,s);
		ps.setInt(2,id);
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean deleteAlumn(int id) {
		boolean f=false;
		try {
		String query="DELETE FROM alumnus_bio WHERE id = ?";
		PreparedStatement ps=conn.prepareStatement(query);
		ps.setInt(1,id);
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	
	
	
	
	
}
