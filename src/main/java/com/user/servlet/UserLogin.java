package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.dao.Admindao;
import com.dao.Eventsdao;
import com.dao.Userdao;
import com.db.DBConnection;
import com.entity.Admin;
import com.entity.Events;
import com.entity.User;

import at.favre.lib.crypto.bcrypt.BCrypt;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/login")
public class UserLogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		
		String email=req.getParameter("email");
		String pwd=req.getParameter("password");
		String usertype=req.getParameter("userType");
		
		String utype2="alumni";
		Eventsdao eventdao=new Eventsdao(DBConnection.getConn());
		List<Events> eventsList=new ArrayList<>();
		eventsList=eventdao.getEvents();
		
		
		
		if(usertype.equals(utype2)) {
			User user=null;
			Userdao dao=new Userdao(DBConnection.getConn());
			String hashedPwd=dao.getHashedPwd(email);
			HttpSession session=req.getSession();
			if(hashedPwd!="") {
			boolean b=false;
			b=checkPassword(pwd,hashedPwd);
			if(b) {
				user=dao.login(email,pwd);
				List<User> alumniList=new ArrayList<>();
				alumniList=dao.getUser();
				
				session.setAttribute("alumniObj", user);
				session.setAttribute("alumniList", alumniList);
				session.setAttribute("eventsList", eventsList);
				resp.sendRedirect("alumni/profile.jsp");
				
			}else {
				session.setAttribute("errorMsg", "Invalid email or password");
				resp.sendRedirect("login.jsp");
			}
		
		
		
		}else{
			session.setAttribute("errorMsg","Account is not found!");
			resp.sendRedirect("login.jsp");
			
		}
		
		}
		else {
			Admin admin=null;
			Userdao userdao=new Userdao(DBConnection.getConn());
			Admindao admindao=new Admindao(DBConnection.getConn());
			String hashedPwd=admindao.getHashedPwd(email);
			HttpSession session=req.getSession();
			
			if(hashedPwd!="") {
				boolean b=false;
				b=checkPassword(pwd,hashedPwd);
				if(b) {
					admin=admindao.login(email,pwd);
					List<User> alumniList=new ArrayList<>();
					alumniList=userdao.getUser();
					session.setAttribute("adminObj", admin);
					session.setAttribute("alumniList", alumniList);
					session.setAttribute("eventsList", eventsList);
					resp.sendRedirect("admin/dashboard.jsp");
					
				}else {
					session.setAttribute("errorMsg", "Invalid email or password");
					resp.sendRedirect("login.jsp");
				}
			
			
			
			}else{
				session.setAttribute("errorMsg","Account is not found!");
				resp.sendRedirect("login.jsp");
				
			}

			
			
			
			
			
		}
		
		}catch(Exception e) {
		e.printStackTrace();
	}
	
		
	}
	
	// Method to verify a password
    public static boolean checkPassword(String plainTextPassword, String hashedPassword) {
        return BCrypt.verifyer().verify(plainTextPassword.toCharArray(), hashedPassword).verified;
    }

}
