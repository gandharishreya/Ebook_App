package com.user.servlet;

import java.io.IOException;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UpdateProfileServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String name=req.getParameter("fname");
			String email=req.getParameter("email");
			String phno=req.getParameter("phno");
			String password=req.getParameter("password");
			
			User u=new User();
			u.setId(id);
			u.setName(name);
			u.setEmail(email);
			u.setPhno(phno);
			
			HttpSession session =req.getSession();
			
			UserDAOImpl d=new UserDAOImpl(DBConnect.getConn());
			boolean f=d.checkPassword(id, password);
			if(f) {
				boolean f2=d.updateProfile(u);
				if(f2) {
					session.setAttribute("successMsg", "Profile updated successfully");
					resp.sendRedirect("editProfile.jsp");
				}
				else {
					session.setAttribute("failedMsg", "Something went wrong");
					resp.sendRedirect("editProfile.jsp");
				}
			}else {
				session.setAttribute("failedMsg", "Incorrect Password");
				resp.sendRedirect("editProfile.jsp");
			}
			
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
