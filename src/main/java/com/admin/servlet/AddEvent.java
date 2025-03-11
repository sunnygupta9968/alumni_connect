package com.admin.servlet;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.dao.Admindao;

import com.db.DBConnection;
import com.entity.Events;



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
@WebServlet("/addEvent")
public class AddEvent extends HttpServlet{
	private static final String UPLOAD_DIRECTORY = "adminImages";
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("eventTitle");
		String date=req.getParameter("eventDate");
		String organizer=req.getParameter("eventOrganizer");
		String venue=req.getParameter("eventVenue");
		String regLink=req.getParameter("eventLink");
		String desc=req.getParameter("eventDesc");
		
		/*
		 * String profileImg=
		 * "https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.web";
		 */
		
		 // File upload handling
        Part filePart = req.getPart("file"); // Name of file input in form
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        // Upload path inside the server (webapp/uploads/)
        String uploadPath = "C:\\Users\\sunny\\eclipse-workspace\\Alumni_Connect\\src\\main\\webapp\\admin\\adminImages";      
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
		
		
			
			
			
			
			Events e=new Events(name, date, organizer, desc, filePath,venue,regLink);
			
			boolean f=dao.addEvent(e);
			/* HttpSession session=req.getSession(); */
			if(f) {
				
				session.setAttribute("eventsObj", e);
				session.setAttribute("sucMsg", "Event Added Successfull!");
				resp.sendRedirect("admin/dashboard.jsp");
			}
			else {
				session.setAttribute("errorMsg", "Failed to add Event");
				resp.sendRedirect("admin/dashboard.jsp");
			}
		
	}
}

