package com.user.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LogoutServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			HttpSession session =req.getSession();
			session.removeAttribute("userobj");
			
			HttpSession session2=req.getSession();
			session.setAttribute("successMsg", "Logout Succcessfull");
			resp.sendRedirect("login.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	
}
