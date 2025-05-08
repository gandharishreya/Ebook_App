package com.user.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;


public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String name=req.getParameter("fname");
			String email=req.getParameter("email");
			String phno=req.getParameter("phno");
			String password=req.getParameter("password");
			String check=req.getParameter("check");
			
			//System.out.println(name+" "+email+" "+phno+" "+password+" "+check);
			
			User u=new User();
			u.setName(name);
			u.setEmail(email);
			u.setPhno(phno);
			u.setPassword(password);
			
			HttpSession session = req.getSession();
			
			if(check != null) {
			
			UserDAOImpl d1=new UserDAOImpl(DBConnect.getConn());
			boolean f2=d1.checkUser(email);
			if(f2) {
				
				UserDAOImpl d=new UserDAOImpl(DBConnect.getConn());
				boolean f= d.userRegister(u);
				
				if(f) {
					//System.out.println("User Register Success...");
					session.setAttribute("successMsg", "Registration Successful...");
					resp.sendRedirect("register.jsp");
				}
				else {
					//System.out.println("Something went wrong on server");
					session.setAttribute("failedMsg", "Something went wrong");
					resp.sendRedirect("register.jsp");
				}
			}
			else {
				session.setAttribute("failedMsg", "User already exists");
				resp.sendRedirect("register.jsp");
			}
			
			
		}
			else {
				//System.out.println("Please check Agree & Terms Condition");
				session.setAttribute("failedMsg", " Agree & Terms Conditions");
				resp.sendRedirect("register.jsp");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	
}
