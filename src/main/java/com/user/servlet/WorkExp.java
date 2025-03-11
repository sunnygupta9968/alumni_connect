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
@WebServlet("/add-workexp")
public class WorkExp extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			int id=Integer.parseInt(req.getParameter("id"));
			String[] companyNames = req.getParameterValues("companyName[]");
	        String[] jobRoles = req.getParameterValues("jobRole[]");
	        String[] startYears = req.getParameterValues("startYear[]");
	        String[] endYears = req.getParameterValues("endYear[]");
	        String[] shortDescs = req.getParameterValues("shortDesc[]");
	        boolean b=false;
	        Userdao dao=new Userdao(DBConnection.getConn());
	        for (int i = 0; i < companyNames.length; i++) {
	            WorkExperience wrk = new WorkExperience();
	            wrk.setAlumniId(id);
	            wrk.setCompany(companyNames[i]);
	            wrk.setRole(jobRoles[i]);
	            wrk.setStart(startYears[i]);
	            wrk.setEnd(endYears[i]);
	            wrk.setWorkDesc(shortDescs[i]);    
	            b=dao.saveExperience(wrk);
	        }
	        
	        HttpSession session=req.getSession();
	        if(b) {
				
				
	        	session.setAttribute("sucMsg", "Experience Added Successfully!");
				resp.sendRedirect("alumni/addExperience.jsp");
			}
			else {
				session.setAttribute("errorMsg", "Failed to Add Experience");
				resp.sendRedirect("alumni/addExperience.jsp");
			}
		}
			
		
	
}

