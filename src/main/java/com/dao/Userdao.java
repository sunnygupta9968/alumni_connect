package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Events;
import com.entity.Gallery;
import com.entity.Job;
import com.entity.User;
import com.entity.WorkExperience;

public class Userdao {
	private Connection conn;
	public Userdao(Connection conn) {
		super();
		this.conn=conn;
	}
	
	public boolean registerAlumni(User u) {
		boolean f=false;
		try {
			String query="insert into alumnus_bio(name,linkdn_link,gender,batch,branch,email,status,work,company,profile_img,github_link,password,verification_method,verification_value) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1,u.getFullname());
			ps.setString(2,u.getGender());
			ps.setString(3,u.getBatch());
			ps.setString(4,u.getEmail());
			ps.setString(5,u.getStatus());
			ps.setString(6,u.getBranch());
			ps.setString(7,u.getWork());
			ps.setString(8,u.getCompany());
			ps.setString(9,u.getLinkdnLink());
			
			
			
		
			ps.setString(10, u.getGithubLink());
			ps.setString(11,u.getProfile_img());
			
			ps.setString(12, u.getPassword());
			ps.setString(13, u.getVerificationMethod());
			ps.setString(14, u.getVerificationValue());
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}


		}catch(SQLException e) {
			e.printStackTrace();

		}
		return f;
	}
	
	public User login(String email,String password) {
		User u=null;
		try {
			String query="select * from alumnus_bio where email=?";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1,email);
			
		
		ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				u=new User();
				u.setId(rs.getInt(1));
				u.setFullname(rs.getString(2));
				u.setLinkdnLink(rs.getString(3));
				u.setGender(rs.getString(4));
				u.setBatch(rs.getString(5));
				u.setBranch(rs.getString(6));
				u.setEmail(rs.getString(7));
				u.setStatus(rs.getString(8));
				u.setWork(rs.getString(9));
				u.setCompany(rs.getString(10));
				u.setProfile_img(rs.getString(11));
				u.setGithubLink(rs.getString(12));
				u.setPassword(rs.getString(13));
				u.setVerificationMethod(rs.getString(14));
				u.setVerificationValue(rs.getString(15));
				
			
				
			
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}
		
		
		return u;
		
	}
	

	public String getHashedPwd(String email) {
		try {
			String query="select password from alumnus_bio where email=?";
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
	
	public User getUserById(int id) {
		User u=null;
		
		String query="select * from alumnus_bio where id=?";
	try {	
		PreparedStatement ps=conn.prepareStatement(query);
		ps.setInt(1,id);
		
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			u=new User();
			u.setId(rs.getInt(1));
			u.setFullname(rs.getString(2));
			u.setLinkdnLink(rs.getString(3));
			u.setGender(rs.getString(4));
			u.setBatch(rs.getString(5));
			u.setBranch(rs.getString(6));
			u.setEmail(rs.getString(7));
			u.setStatus(rs.getString(8));
			u.setWork(rs.getString(9));
			u.setCompany(rs.getString(10));
			u.setProfile_img(rs.getString(11));
			u.setGithubLink(rs.getString(12));
			u.setPassword(rs.getString(13));
			u.setVerificationMethod(rs.getString(14));
			u.setVerificationValue(rs.getString(15));
			
			
		}
		
	}catch(Exception e) {
		e.printStackTrace();
	}
		return u;
	}
	
	
	
	
	
	
	public boolean updateExperience(WorkExperience w) {
		boolean f=false;
		try {
		String query="UPDATE experience SET alumni_id = ?, company = ?, role = ?, start = ?, end = ?, work_desc = ? WHERE id = ?";
		PreparedStatement ps=conn.prepareStatement(query);
		ps.setInt(1, w.getAlumniId());;
		ps.setString(2, w.getCompany());
		ps.setString(3, w.getRole());
		ps.setString(4, w.getStart());
		ps.setString(5, w.getEnd());
		ps.setString(6, w.getWorkDesc());
		ps.setInt(7, w.getId());
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	
	
	public boolean updateProfile(User u) {
		boolean f=false;
		try {
		String query="UPDATE alumnus_bio SET name = ?, linkdn_link = ?, gender = ?, batch = ?, branch = ?, email = ?, status = ?, work = ?, company = ?, profile_img = ?, github_link = ?, password =? WHERE id = ?";
		PreparedStatement ps=conn.prepareStatement(query);
		ps.setString(1,u.getFullname());
		ps.setString(2,u.getLinkdnLink());
		ps.setString(3,u.getGender());
		ps.setString(4,u.getBatch());
		ps.setString(5,u.getBranch());
		ps.setString(6,u.getEmail());
		ps.setString(7,u.getStatus());
		ps.setString(8,u.getWork());
		ps.setString(9,u.getCompany());
		ps.setString(10,u.getProfile_img());
		ps.setString(11, u.getGithubLink());
		ps.setString(12, u.getPassword());
		ps.setInt(13, u.getId());
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	
	public List<User> getUser() {
		
		User u=null;
		List<User>list=new ArrayList<>();
		String query="select * from alumnus_bio";
		try {
			PreparedStatement ps=conn.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				u=new User();
				u.setId(rs.getInt(1));
				u.setFullname(rs.getString(2));
				u.setLinkdnLink(rs.getString(3));
				u.setGender(rs.getString(4));
				u.setBatch(rs.getString(5));
				u.setBranch(rs.getString(6));
				u.setEmail(rs.getString(7));
				u.setStatus(rs.getString(8));
				u.setWork(rs.getString(9));
				u.setCompany(rs.getString(10));
				u.setProfile_img(rs.getString(11));
				u.setGithubLink(rs.getString(12));
				u.setPassword(rs.getString(13));
				list.add(u);
				
			}
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
		}


	public int getUserCount() {
		int size=0;
		try {
			String query="select * from alumnus_bio";
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

	
	
	public boolean saveExperience(WorkExperience w) {
		boolean f=false;
		try {
			String query="insert into experience(alumni_id,company,role,start,end,work_desc) values(?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setInt(1, w.getAlumniId());
			ps.setString(2, w.getCompany());
			ps.setString(3, w.getRole());
			ps.setString(4, w.getStart());
			ps.setString(5, w.getEnd());
			ps.setString(6, w.getWorkDesc());	
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}


		}catch(SQLException e) {
			e.printStackTrace();

		}
		return f;
	}
	
	public boolean deletExperience(int expId, int alumniId) {
		boolean f=false;
		try {
			String query="DELETE FROM experience WHERE id = ? AND alumni_id = ?";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setInt(1, expId);
			ps.setInt(2,alumniId);
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}


		}catch(SQLException e) {
			e.printStackTrace();

		}
		return f;
	}
	
	
	

	public List<WorkExperience> getExperience(int userid) {
		
		WorkExperience w=null;
		List<WorkExperience>list=new ArrayList<>();
		String query="select * from experience where alumni_id=?";
		try {
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setInt(1, userid);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				w=new WorkExperience();
				w.setId(rs.getInt(1));
				w.setAlumniId(rs.getInt(2));
				w.setCompany(rs.getString(3));
				w.setRole(rs.getString(4));
				w.setStart(rs.getString(5));
				w.setEnd(rs.getString(6));
				w.setWorkDesc(rs.getString(7));
				list.add(w);
				
			}
				
					
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
		}
	
	public boolean addImage(Gallery gallery) {
		boolean f=false;
		try {
			String query="insert into gallery(alumni_id, img_title, img_link, img_desc) values(?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setInt(1,gallery.getAlumniId());
			ps.setString(2, gallery.getTitle());
			ps.setString(3, gallery.getImgLink());
			/* ps.setString(4, gallery.getUploadDate()); */
			ps.setString(4, gallery.getImageDesc());
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}


		}catch(SQLException e) {
			e.printStackTrace();

		}
		return f;
	}

	public boolean postJob(Job j) {
		boolean f=false;
		try {
			String query="insert into jobs(alumni_id,job_title,company_name,job_type,location,experience,apply_link,last_date,eligible_batch,referral,referral_mob,referral_desc) values(?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setInt(1,j.getAlumniId());
			ps.setString(2, j.getJobTitle());
			ps.setString(3, j.getCompanyName());
			ps.setString(4,j.getJobType());
			ps.setString(5,j.getLocation());
			ps.setString(6,j.getExperienceRequired());
			ps.setString(7,j.getApplyLink());
			ps.setString(8,j.getLastDate());
			ps.setString(9, j.getEligibleBatch());
			ps.setNString(10, j.getReferralAvailable());
			ps.setString(11, j.getReferralMobile());
			ps.setString(12, j.getReferralGuideline());
			
			
			
			
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}


		}catch(SQLException e) {
			e.printStackTrace();

		}
		return f;
	}
	
	

	public List<Job> getJobsByAlumniId(int alumniId) {
		
		Job j=null;
		List<Job>list=new ArrayList<>();
		String query="select * from jobs where alumni_id=?";
		try {
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setInt(1, alumniId );
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				j=new Job();
				j.setJobId(rs.getInt(1));
				j.setAlumniId(rs.getInt(2));
				j.setJobTitle(rs.getString(3));
				j.setCompanyName(rs.getString(4));
				j.setJobType(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setExperienceRequired(rs.getString(7));
				j.setApplyLink(rs.getString(8));
				j.setPostedDate(rs.getString(9));
				j.setLastDate(rs.getString(10));
				j.setEligibleBatch(rs.getString(11));
				j.setReferralAvailable(rs.getString(12));
				j.setReferralMobile(rs.getString(13));
				j.setReferralGuideline(rs.getString(14));
				list.add(j);
				
			}
				
					
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
		}
	
public List<Job> getAllJobs() {
		
		Job j=null;
		List<Job>list=new ArrayList<>();
		String query="select * from jobs";
		try {
			PreparedStatement ps=conn.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				j=new Job();
				j.setJobId(rs.getInt(1));
				j.setAlumniId(rs.getInt(2));
				j.setJobTitle(rs.getString(3));
				j.setCompanyName(rs.getString(4));
				j.setJobType(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setExperienceRequired(rs.getString(7));
				j.setApplyLink(rs.getString(8));
				j.setPostedDate(rs.getString(9));
				j.setLastDate(rs.getString(10));
				j.setEligibleBatch(rs.getString(11));
				j.setReferralAvailable(rs.getString(12));
				j.setReferralMobile(rs.getString(13));
				j.setReferralGuideline(rs.getString(14));
				
				list.add(j);
				
			}
				
					
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
		}

public boolean deleteJob(int jobId, int alumniId) {
	boolean f=false;
	try {
		String query="DELETE FROM jobs WHERE id = ? AND alumni_id = ?";
		PreparedStatement ps=conn.prepareStatement(query);
		ps.setInt(1, jobId);
		ps.setInt(2,alumniId);
		int i=ps.executeUpdate();
		if(i==1) {
			f=true;
		}


	}catch(SQLException e) {
		e.printStackTrace();

	}
	return f;
	
}
	


}


