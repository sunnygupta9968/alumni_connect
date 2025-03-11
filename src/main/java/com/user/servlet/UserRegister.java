package com.user.servlet;

import java.io.File;
import java.io.IOException;


import com.dao.Userdao;
import com.db.DBConnection;
import com.entity.User;

import at.favre.lib.crypto.bcrypt.BCrypt;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10,      // 10MB
maxRequestSize = 1024 * 1024 * 50)   // 50MB
@WebServlet("/register")
public class UserRegister extends HttpServlet{
	private static final String UPLOAD_DIRECTORY = "alumniDoc";
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("name");
		String linkdnProf=req.getParameter("linkdn-prof");
		String gender=req.getParameter("gender");
		String batch=req.getParameter("batch");
		String branch=req.getParameter("branch");
		String email=req.getParameter("email");
		String pwd=req.getParameter("password");
		String hashedPwd=hashPassword(pwd);
		String status="";
		String work="Alumni";
		String company="Company Name";
		String profileImg="alumniImages/male-avatar.svg";
		String verificationMethod=req.getParameter("verificationMethod");
		String verificationValue="";
		HttpSession session=req.getSession();
		if ("rollNumber".equals(verificationMethod)) {
            String rollNumber = req.getParameter("rollNumber");
            verificationValue=rollNumber;
		
		
		}else if ("collegeDocument".equals(verificationMethod)) {
            Part filePart = req.getPart("collegeDocument");
            String fileName = filePart.getSubmittedFileName();
            String uploadPath = "C:\\Users\\sunny\\eclipse-workspace\\Alumni_Connect\\src\\main\\webapp\\admin\\alumniDoc";
            String filePath = null;
            if (fileName != null && !fileName.isEmpty()) {
                filePath = UPLOAD_DIRECTORY + File.separator + fileName;
                
    			/* System.out.println("Saving file to: " + filePath); */
                filePart.write(uploadPath + File.separator + fileName);
                
            }
           verificationValue=filePath;
            
		}
		else {
			session.setAttribute("errorMsg", "Invalid Verification Method");
			resp.sendRedirect("register.jsp");
		
		}
		
		
		
		if(gender.equals("Female")) {
			profileImg="alumniImages/female-avatar.svg";
		}
		String githubLink="https://github.com";
		User u=new User(name, linkdnProf, gender, batch, branch, email, status, work, company, profileImg, githubLink, hashedPwd, verificationMethod, verificationValue);
		Userdao dao=new Userdao(DBConnection.getConn());
		boolean f=dao.registerAlumni(u);
		
		if(f) {
			session.setAttribute("sucMsg", "Registered Succesfully! Your account is currently under verification. Please note that you will not be able to access all features until the verification process is completed, which may take up to 24 hours.");
			resp.sendRedirect("login.jsp");
		}
		else {
			session.setAttribute("errorMsg", "Failed to Register");
			resp.sendRedirect("register.jsp");
		}
	}
	
	// Method to hash a password
    public static String hashPassword(String plainTextPassword) {
        return BCrypt.withDefaults().hashToString(12, plainTextPassword.toCharArray()); // 12 = cost factor
    }
		
}
