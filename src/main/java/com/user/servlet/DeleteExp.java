package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.dao.Userdao;
import com.db.DBConnection;
import com.entity.User;
import com.entity.WorkExperience;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/remove-workexp")
public class DeleteExp extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			int alumniId=Integer.parseInt(req.getParameter("alumniId")); 
			int expId=Integer.parseInt(req.getParameter("workId")); 
		      
	        System.out.println();
	        Userdao dao=new Userdao(DBConnection.getConn());
	        boolean b=dao.deletExperience(expId, alumniId);
	        
	        HttpSession session=req.getSession();
	        if(b) {
				
				
	        	session.setAttribute("sucMsg", "Experience Removed Successfull!");
				resp.sendRedirect("alumni/addExperience.jsp");
			}
			else {
				session.setAttribute("errorMsg", "Failed to Remove Experience");
				resp.sendRedirect("alumni/addExperience.jsp");
			}
		}
			
		
	
}

