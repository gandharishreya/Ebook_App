package com.user.servlet;

import java.io.IOException;

import com.DAO.BookDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.Book;
import com.entity.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class CartServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			int bid=Integer.parseInt(req.getParameter("bid"));
			int uid=Integer.parseInt(req.getParameter("uid"));
			
			BookDAOImpl d=new BookDAOImpl(DBConnect.getConn());
			Book b=d.getBookById(bid);
			
			Cart c=new Cart();
			c.setBid(bid);
			c.setUserId(uid);
			c.setBookName(b.getBookName());
			c.setAuthor(b.getAuthor());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalPrice(Double.parseDouble(b.getPrice()));
			
			CartDAOImpl d1=new CartDAOImpl(DBConnect.getConn());
			boolean f=d1.addCart(c);
			
			HttpSession session=req.getSession();
			
			
			if(f) {
				session.setAttribute("addCart", "Book added to the cart");
				resp.sendRedirect("allNewBook.jsp");
				//System.out.println("Added to cart");
			}
			else {
				//System.out.println("Error in adding to the cart");
				session.setAttribute("failed", "Error in adding book to cart");
				resp.sendRedirect("allNewBook.jsp");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	
}
