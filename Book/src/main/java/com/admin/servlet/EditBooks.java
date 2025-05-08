package com.admin.servlet;

import java.io.IOException;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.Book;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class EditBooks extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
		int id=Integer.parseInt(req.getParameter("id"));
		String bookName=req.getParameter("bname");
		String author=req.getParameter("author");
		String price = req.getParameter("price");
		
		String status = req.getParameter("status");
		
		Book b=new Book();
		b.setBookId(id);
		b.setBookName(bookName);
		b.setAuthor(author);
		b.setPrice(price);
		b.setStatus(status);
		
		BookDAOImpl d=new BookDAOImpl(DBConnect.getConn());
		boolean f=d.updateEditBooks(b);
		
		HttpSession session = req.getSession();
		
		if(f) {
			
			session.setAttribute("successMsg", "Book updated successfully");
			resp.sendRedirect("admin/allbooks.jsp");
		}
		else {
			session.setAttribute("failedMsg", "Something went wrong");
			resp.sendRedirect("admin/allbooks.jsp");
		}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	
}
