package com.user.servlet;

import java.io.IOException;

import com.dao.Userdao;
import com.db.DBConnection;
import com.entity.Job;
import com.entity.User;

import at.favre.lib.crypto.bcrypt.BCrypt;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/add-job")
public class AddJob extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int alumniId=Integer.parseInt(req.getParameter("id"));
		String jobRole=req.getParameter("jobRole");
		String companyName=req.getParameter("companyName");
		String jobtype=req.getParameter("jobType");
		String lastDate=req.getParameter("lastDate");
		String jobLocation=req.getParameter("jobLocation");
		String experience=req.getParameter("experience");
		String eligibleBatch=req.getParameter("eligibleBatch");
		String jobLink=req.getParameter("jobLink");
		String referralAvailable=req.getParameter("referralAvailable");
		String referralMobile=req.getParameter("referralMobile");
		String referralGuideline=req.getParameter("referralGuideline");
		
		Userdao dao=new Userdao(DBConnection.getConn());
		Job j=new Job(alumniId, jobRole, companyName, jobtype, jobLocation, experience, jobLink,  lastDate,eligibleBatch,referralAvailable,referralMobile,referralGuideline);
		boolean f=dao.postJob(j);
		HttpSession session=req.getSession();
		if(f) {
			session.setAttribute("sucMsg", "Job Added Succesfully!");
			resp.sendRedirect("alumni/addJob.jsp");
		}
		else {
			session.setAttribute("errorMsg", "Failed to Add Job");
			resp.sendRedirect("alumni/addJob.jsp");
		}
	}
	
	// Method to hash a password
    public static String hashPassword(String plainTextPassword) {
        return BCrypt.withDefaults().hashToString(12, plainTextPassword.toCharArray()); // 12 = cost factor
    }
		
}
