package com.user.servlet;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import com.dao.Userdao;
import com.db.DBConnection;
import com.entity.User;
import com.entity.WorkExperience;

import at.favre.lib.crypto.bcrypt.BCrypt;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
	    maxFileSize = 1024 * 1024 * 10,      // 10MB
	    maxRequestSize = 1024 * 1024 * 50    // 50MB
	)
@WebServlet("/edit-profile")
public class UpdateProfile extends HttpServlet{
	private static final String UPLOAD_DIRECTORY = "alumniImages";
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id=Integer.parseInt(req.getParameter("id"));
		String name=req.getParameter("name");
		String gender=req.getParameter("gender");
		String batch=req.getParameter("batch");
		String branch=req.getParameter("branch");
		String email=req.getParameter("email");
		String oldPic=req.getParameter("oldPic");
		String oldPwd=req.getParameter("oldPwd");
		String newPwd=req.getParameter("newPwd");
		String confirmedPwd=req.getParameter("confirmedPwd");
		String work=req.getParameter("work");
		String company=req.getParameter("company");
		String githubLink=req.getParameter("github");
		String linkdnLink=req.getParameter("linkdn");
		String status=req.getParameter("status");
		
	
       
		
		
		
		/*
		 * String profileImg=
		 * "https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.web";
		 */
		
		 // File upload handling
        Part filePart = req.getPart("file"); // Name of file input in form
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
;
        // Upload path inside the server (webapp/uploads/)
        String uploadPath ="C:\\Users\\sunny\\eclipse-workspace\\Alumni_Connect\\src\\main\\webapp\\alumni\\alumniImages"; /*getServletContext().getRealPath("/images");*/
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir(); // Create directory if it does not exist

        // Save file if uploaded
        String filePath = null;
        if (fileName != null && !fileName.isEmpty()) {
            filePath = UPLOAD_DIRECTORY + File.separator + fileName;
            
			/* System.out.println("Saving file to: " + filePath); */
            filePart.write(uploadPath + File.separator + fileName);
            
        }

		
		 if(filePath==null) { filePath=oldPic; }
		 
		
	
		
		HttpSession session=req.getSession();
		
		Userdao dao=new Userdao(DBConnection.getConn());
		User temp=dao.getUserById(id);
		boolean verifyOldPwd=checkPassword(oldPwd,temp.getPassword());
		if(verifyOldPwd  && newPwd.equals(confirmedPwd) ) {
			String newhashedPwd=hashPassword(oldPwd);
			
			if(newPwd.trim().length()>4) {
				
				
				newhashedPwd=hashPassword(newPwd);
			}
			
			
			
			
			User u=new User(id, name, linkdnLink, gender, batch, branch, email, status, work, company, filePath, githubLink, newhashedPwd);
			
			boolean f=dao.updateProfile(u);
			/* HttpSession session=req.getSession(); */
			if(f) {
				List<User> alumniList=new ArrayList<>();
				alumniList=dao.getUser();
				
				session.setAttribute("alumniObj", u);
				session.setAttribute("alumniList", alumniList);
				session.setAttribute("sucMsg", "Profile Updated Successfull!");
				resp.sendRedirect("alumni/editProfile.jsp");
			}
			else {
				session.setAttribute("errorMsg", "Failed to Update Profile");
				resp.sendRedirect("alumni/editProfile.jsp");
			}
		}
		else if(!newPwd.equals(confirmedPwd)) {
			session.setAttribute("errorMsg", "New Password and old Password not matched ");
			resp.sendRedirect("alumni/editProfile.jsp");
			
		}
		else {
			session.setAttribute("errorMsg", "Wrong Password");
			resp.sendRedirect("alumni/editProfile.jsp");
		}
		
		
		
		
	}
	// Method to hash a password
    public static String hashPassword(String plainTextPassword) {
        return BCrypt.withDefaults().hashToString(12, plainTextPassword.toCharArray()); // 12 = cost factor
    }
    
 // Method to verify a password
    public static boolean checkPassword(String plainTextPassword, String hashedPassword) {
        return BCrypt.verifyer().verify(plainTextPassword.toCharArray(), hashedPassword).verified;
    }

}
