package com.user.servlet;

import java.io.IOException;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class DeleteOldBook extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String em=req.getParameter("em");
			int id=Integer.parseInt(req.getParameter("id"));
			BookDAOImpl d=new BookDAOImpl(DBConnect.getConn());
			boolean f=d.oldBookDelete(em, "Old", id);
			HttpSession session=req.getSession();
			
			if(f) {
				session.setAttribute("successMsg", "Old Book removed from cart");
				resp.sendRedirect("oldBook.jsp");
			}
			else {
				session.setAttribute("failedMsg", "Something went wrong");
				resp.sendRedirect("oldBook.jsp");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	
}
