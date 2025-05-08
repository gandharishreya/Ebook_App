package com.user.servlet;

import java.io.File;
import java.io.IOException;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.Book;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@MultipartConfig
public class AddOldBook extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			
			String bookName=req.getParameter("bname");
			String author=req.getParameter("author");
			String price = req.getParameter("price");
			String categories="Old";
			String status = "Active";
			Part part=req.getPart("bimg");
			String fileName=part.getSubmittedFileName();
			
			String useremail=req.getParameter("user");
			
			Book b=new Book(bookName, author, price, categories, status, fileName, useremail);
			//System.out.println(b);
			
			BookDAOImpl d=new BookDAOImpl(DBConnect.getConn());
			boolean f=d.addBooks(b);
			HttpSession session =req.getSession();
			
			if(f) {
				
				String path=getServletContext().getRealPath("")+"book";
				File file=new File(path);
				part.write(path+File.separator+fileName);
				
				session.setAttribute("successMsg", "Book added successfully");
				resp.sendRedirect("sellBook.jsp");
			}
			else {
				session.setAttribute("failedMsg", "Something went wrong");
				resp.sendRedirect("sellBook.jsp");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
