package com.admin.servlet;

import java.io.IOException;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class DeleteBooks extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			BookDAOImpl d=new BookDAOImpl(DBConnect.getConn());
			boolean f=d.deleteBooks(id);
			HttpSession session =req.getSession();
			if(f) {
				session.setAttribute("successMsg", "Book deleted successfully");
				resp.sendRedirect("admin/allbooks.jsp");
			}
			else {
				session.setAttribute("failedMsg", "Something went wrong");
				resp.sendRedirect("admin/addbooks.jsp")
;			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	
}
