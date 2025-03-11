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
@WebServlet("/delete-alumni")
public class DeleteUser extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));	
		HttpSession session=req.getSession();
		Admindao dao=new Admindao(DBConnection.getConn());
		boolean b=dao.deleteAlumn(id);
		Userdao dao2=new Userdao(DBConnection.getConn());
		
		
		
		if(b) {
			
			List<User> alumniList=new ArrayList<>();
			alumniList=dao2.getUser();
			session.setAttribute("alumniList", alumniList);
			session.setAttribute("sucMsg", "Alumni Deleted Successfully!");
			resp.sendRedirect("admin/dashboard.jsp");
		}else {
			session.setAttribute("errorMsg", "Failed to Delete Alumni Profile!");
			resp.sendRedirect("admin/dashboard.jsp");
		}
	
		
	}
	
}
