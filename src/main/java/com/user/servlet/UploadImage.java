package com.user.servlet;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.dao.Admindao;
import com.dao.Userdao;
import com.db.DBConnection;
import com.entity.Events;
import com.entity.Gallery;

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
@WebServlet("/addImage")
public class UploadImage extends HttpServlet{
	private static final String UPLOAD_DIRECTORY = "images";
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String imgTitle=req.getParameter("imageTitle");
		int alumniId=Integer.parseInt(req.getParameter("alumniId"));
		String imgDesc=req.getParameter("imageDesc");
		
	
        Part filePart = req.getPart("file"); // Name of file input in form
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        // Upload path inside the server (webapp/uploads/)
        String uploadPath = "C:\\Users\\sunny\\eclipse-workspace\\Alumni_Connect\\src\\main\\webapp\\images";      
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
		Userdao dao=new Userdao(DBConnection.getConn());
		Gallery galleryImg=new Gallery(alumniId, filePath, imgTitle, imgDesc);
		
			boolean f=dao.addImage(galleryImg);
			/* HttpSession session=req.getSession(); */
			if(f) {
				
			
				session.setAttribute("sucMsg", "Image uploaded Successfull!");
				resp.sendRedirect("alumni/gallery.jsp");
			}
			else {
				session.setAttribute("errorMsg", "Failed upload Image");
				resp.sendRedirect("login.jsp");
			}
		
	}
}

