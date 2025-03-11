package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Events;
import com.entity.User;

public class Eventsdao {
	private Connection conn;
	public Eventsdao(Connection conn) {
		super();
		this.conn=conn;
	}
	
public List<Events> getEvents() {
		
		Events u=null;
		List<Events>list=new ArrayList<>();
		String query="select * from events";
		try {
			PreparedStatement ps=conn.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				u=new Events();
				u.setId(rs.getInt(1));
				u.setEventName(rs.getString(2));
				u.setEventDate(rs.getString(3));
				u.setEventDesc(rs.getString(4));
				u.setEventOrganizer(rs.getString(5));
				u.setEventImg(rs.getString(6));
				u.setEventVenue(rs.getString(7));
				u.setEventLink(rs.getString(8));
				list.add(u);
				
			}
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
		}




public boolean deleteEvent(int id) {
	boolean f=false;
	try {
	String query="DELETE FROM events WHERE id = ?";
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




	public int getEventCount() {
	int size=0;
	try {
		String query="select * from events";
		PreparedStatement ps=conn.prepareStatement(query);
		ResultSet user=ps.executeQuery();
		while(user.next()) {
			size++;
}
	}catch(Exception e) {
		e.printStackTrace();
	}
	return size;
}	

}
