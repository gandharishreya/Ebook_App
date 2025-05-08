package com.user.servlet;

import java.io.IOException;

import com.DAO.CartDAOImpl;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class RemoveBookServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int bid=Integer.parseInt(req.getParameter("bid"));
		int uid=Integer.parseInt(req.getParameter("uid"));
		int cid=Integer.parseInt(req.getParameter("cid"));
		CartDAOImpl d=new CartDAOImpl(DBConnect.getConn());
		
		boolean f=d.deleteBook(bid,uid, cid);
		HttpSession session = req.getSession();
		
		if(f) {
			session.setAttribute("successMsg", "Book removed from the Cart");
			resp.sendRedirect("checkOut.jsp");
			
		}
		else {
			session.setAttribute("failedMsg", "Somethuing went wrong");
			resp.sendRedirect("checkOut.jsp");
		}
	}

	
}
