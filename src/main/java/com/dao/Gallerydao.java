package com.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.entity.Gallery;
import com.entity.User;

public class Gallerydao {
	private Connection conn;
	public Gallerydao(Connection conn) {
		super();
		this.conn=conn;
	}
	
public List<Gallery> getGallery() {
		
		Gallery g=null;
		List<Gallery>list=new ArrayList<>();
		String query="select * from gallery";
		try {
			PreparedStatement ps=conn.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				g=new Gallery();
				g.setId(rs.getInt(1)); 
				g.setAlumniId(rs.getInt(2));
				g.setTitle(rs.getString(3));
				g.setImgLink(rs.getString(4));
				g.setUploadDate(rs.getString(5));
				g.setImageDesc(rs.getString(6));
				list.add(g);
				
			}
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
		}




public boolean deleteGalleryImg(int id) {
	boolean f=false;
	try {
	String query="DELETE FROM gallery WHERE id = ?";
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
