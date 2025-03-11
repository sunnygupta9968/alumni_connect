package com.admin.servlet;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.dao.Admindao;

import com.db.DBConnection;
import com.entity.Admin;

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
@WebServlet("/addAdmin")
public class AddAdmin extends HttpServlet{
	private static final String UPLOAD_DIRECTORY = "adminImages";
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("adminName");
		String adminEmail=req.getParameter("adminEmail");
		String adminPwd=req.getParameter("adminPwd");
		String hashPwd=hashPassword(adminPwd);
		
		/*
		 * String profileImg=
		 * "https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.web";
		 */
		
		 // File upload handling
        Part filePart = req.getPart("file"); // Name of file input in form
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        // Upload path inside the server (webapp/uploads/)
        String uploadPath ="C:\\Users\\sunny\\eclipse-workspace\\Alumni_Connect\\src\\main\\webapp\\admin\\adminImages";
        		//getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir(); // Create directory if it does not exist

        // Save file if uploaded
        String filePath = null;
        if (fileName != null && !fileName.isEmpty()) {
            filePath = UPLOAD_DIRECTORY + File.separator + fileName;
            
			/* System.out.println("Saving file to: " + filePath); */
            filePart.write(uploadPath + File.separator + fileName);
            
        }

     
        
		
		
		
		HttpSession session=req.getSession();
		
		Admindao dao=new Admindao(DBConnection.getConn());
		/*
		 * System.out.println(name); System.out.println(date);
		 * System.out.println(organizer); System.out.println(desc);
		 * System.out.println(filePath);
		 */
		
		
			
			
			
			
			Admin admin=new Admin(name, adminEmail, hashPwd, filePath);
			
			boolean f=dao.addAdmin(admin);
			/* HttpSession session=req.getSession(); */
			if(f) {
				
				session.setAttribute("adminObj", admin);
				session.setAttribute("sucMsg", "New Admin Added Successfull!");
				resp.sendRedirect("admin/dashboard.jsp");
			}
			else {
				session.setAttribute("errorMsg", "Failed to Add Admin");
				resp.sendRedirect("alumni/dashboard.jsp");
			}
		
	}
	
	// Method to hash a password
    public static String hashPassword(String plainTextPassword) {
        return BCrypt.withDefaults().hashToString(12, plainTextPassword.toCharArray()); // 12 = cost factor
    }
}

