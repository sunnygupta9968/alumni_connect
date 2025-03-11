package com.admin.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.dao.Admindao;
import com.dao.Userdao;
import com.db.DBConnection;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/view-profile")
public class ViewProfile extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));	
		HttpSession session=req.getSession();
		Userdao dao2=new Userdao(DBConnection.getConn());
		User u=dao2.getUserById(id);
		if(u!=null) {
			
			
			session.setAttribute("alumniObj", u);
			resp.sendRedirect("admin/profile.jsp");
		}else {
			session.setAttribute("errorMsg", "Failed to View Alumni Profile!");
			resp.sendRedirect("admin/dashboard.jsp");
		}
	
		
	}
	
}
