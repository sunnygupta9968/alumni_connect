package com.admin.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.dao.Admindao;
import com.dao.Eventsdao;
import com.dao.Userdao;
import com.db.DBConnection;
import com.entity.Events;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/delete-event")
public class DeleteEvent extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));	
		HttpSession session=req.getSession();
		Userdao dao2=new Userdao(DBConnection.getConn());
		Eventsdao eventdao=new Eventsdao(DBConnection.getConn());
		boolean b=eventdao.deleteEvent(id);
		
		
		if(b) {
			
			List<Events> eventsList=new ArrayList<>();
			eventsList=eventdao.getEvents();
			List<User> alumniList=new ArrayList<>();
			alumniList=dao2.getUser();
			session.setAttribute("alumniList", alumniList);
			session.setAttribute("eventsList", eventsList);
			session.setAttribute("sucMsg", "Event Deleted Successfully!");
			resp.sendRedirect("admin/dashboard.jsp");
		}else {
			session.setAttribute("errorMsg", "Failed to Delete Event!");
			resp.sendRedirect("admin/dashboard.jsp");
		}
	
		
	}
	
}
