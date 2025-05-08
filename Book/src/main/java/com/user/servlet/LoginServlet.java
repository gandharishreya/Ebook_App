package com.user.servlet;

import java.io.IOException;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class LoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			
			UserDAOImpl d=new UserDAOImpl(DBConnect.getConn());
			
			HttpSession session = req.getSession();
			
			String email=req.getParameter("email");
			String password=req.getParameter("password");
			//System.out.println(email+" "+password);
			if("admin@gmail.com".equals(email) && "admin".equals(password)) {
				
				User u=new User();
				u.setName("Admin");
				session.setAttribute("userobj",u);
				resp.sendRedirect("admin/home.jsp");
			}
			else {
				User u=d.login(email,password);
				if(u!=null) {
					session.setAttribute("userobj", u);
					resp.sendRedirect("index.jsp");
				}
				else {
					session.setAttribute("failedMsg", "Email or password invalid");
					resp.sendRedirect("login.jsp");
				}
				resp.sendRedirect("home.jsp");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	
}
