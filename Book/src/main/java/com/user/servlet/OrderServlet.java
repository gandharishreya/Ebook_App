package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.DAO.CartDAOImpl;
import com.DAO.OrderBookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookOrder;
import com.entity.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			
			HttpSession session=req.getSession();
			session.setAttribute("msg","Please choose a payment method");
			int id=Integer.parseInt(req.getParameter("id"));
			String name=req.getParameter("username");
			String email=req.getParameter("email");
			String phno=req.getParameter("phno");
			String address=req.getParameter("address");
			String landmark=req.getParameter("landmark");
			String city=req.getParameter("city");
			String state=req.getParameter("state");
			String zipcode=req.getParameter("zipcode");
			String paymentType=req.getParameter("payment");
			
			String fullAdd=address+","+landmark+","+city+','+state+","+zipcode;
			
			//System.out.println(name+" "+email+" "+phno+" "+fullAdd+" "+paymentType);
			
			CartDAOImpl d=new CartDAOImpl(DBConnect.getConn());
			List<Cart> b=d.getBookByUser(id);
			if(b.isEmpty()) {
				
				session.setAttribute("failedMsg", "Add Item");
				resp.sendRedirect("checkOut.jsp");
			}
			
			else {
			OrderBookDAOImpl d1=new OrderBookDAOImpl(DBConnect.getConn());
			
			BookOrder o=null;
			
			ArrayList<BookOrder> l=new ArrayList<BookOrder>();
			Random r=new Random();
			
			for(Cart c:b) {
				//System.out.println(c.getBookName()+" "+c.getAuthor()+" "+c.getPrice());
				
				o=new BookOrder();
				o.setOrderId("BOOK-ORD-"+ System.currentTimeMillis());
				o.setUserName(name);
				o.setEmail(email);
				o.setPhno(phno);
				o.setFulladd(fullAdd);
				o.setBookName(c.getBookName());
				o.setAuthor(c.getAuthor());
				o.setPrice(c.getPrice()+"");
				o.setPaymentType(paymentType);
				l.add(o);
				
			}
			
			
			
			if("Select".equals(paymentType)) {
				session.setAttribute("failedMsg", "Choose Payment Method");
				resp.sendRedirect("checkOut.jsp");
			}
			else {
				boolean f=d1.saveOrder(l);
				if(f) {
					//System.out.println("Order Success");
					resp.sendRedirect("orderSuccess.jsp");
				}
				else {
					//System.out.println("Order Failed");
					session.setAttribute("failedMsg", "Your order failed");
					resp.sendRedirect("checkOut.jsp");
				}
			}
		}	
	}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	
}
