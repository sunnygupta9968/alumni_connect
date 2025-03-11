package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.dao.Userdao;
import com.db.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/remove-job")
public class DeleteJob extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			int alumniId=Integer.parseInt(req.getParameter("alumniId")); 
			int jobId=Integer.parseInt(req.getParameter("jobId")); 
		      
	     
	        Userdao dao=new Userdao(DBConnection.getConn());
	        boolean b=dao.deleteJob(jobId, alumniId);
	        
	        HttpSession session=req.getSession();
	        if(b) {
				
				
	        	session.setAttribute("sucMsg", "Job Removed Successfully!");
				resp.sendRedirect("alumni/addJob.jsp");
			}
			else {
				session.setAttribute("errorMsg", "Failed to Remove Job");
				resp.sendRedirect("alumni/addJob.jsp");
			}
		}
			
		
	
}

