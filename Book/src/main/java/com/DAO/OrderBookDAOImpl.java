package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Book;
import com.entity.BookOrder;

public class OrderBookDAOImpl implements OrderBookDAO{

	private Connection conn;

	public OrderBookDAOImpl(Connection conn) {
		this.conn=conn;
		// TODO Auto-generated constructor stub
	}

	/*@Override
	public int getOrderNo() {
		// TODO Auto-generated method stub
		int i=0;
		try {
			String sql="select * from bookOrder";
			PreparedStatement p=conn.prepareStatement(sql);
			ResultSet r=p.executeQuery();
			while(r.next()) {
				i++;
			}
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		return i;
	}*/

	@Override
	public boolean saveOrder(List<BookOrder> b) {
		// TODO Auto-generated method stub
		boolean f=false;
		try {
			String sql="insert into bookOrder(order_id, user_name, email, address, phone, book_name, author, price, payment) values(?,?,?,?,?,?,?,?,?) ";
			conn.setAutoCommit(false);
			PreparedStatement p=conn.prepareStatement(sql);
			for(BookOrder ob: b ) {
				p.setString(1, ob.getOrderId());
				p.setString(2, ob.getUserName());
				p.setString(3, ob.getEmail());
				p.setString(4, ob.getFulladd());
				p.setString(5, ob.getPhno());
				p.setString(6, ob.getBookName());
				p.setString(7, ob.getAuthor());
				p.setString(8, ob.getPrice());
				p.setString(9, ob.getPaymentType());
				
				p.addBatch();
			}
			int[] count =p.executeBatch();
			conn.commit();
			f=true;
			conn.setAutoCommit(true);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<BookOrder> getBook(String email) {
		// TODO Auto-generated method stub
		List <BookOrder> l=new ArrayList<BookOrder>();
		BookOrder o=null;
		try {
			String sql="select * from bookOrder where email=?";
			PreparedStatement p=conn.prepareStatement(sql);
			p.setString(1, email);
			ResultSet r=p.executeQuery();
			while(r.next()) {
				o=new BookOrder();
				o.setId(r.getInt(1));
				o.setOrderId(r.getString(2));
				o.setUserName(r.getString(3));
				o.setEmail(r.getString(4));
				o.setFulladd(r.getString(5));
				o.setPhno(r.getString(6));
				o.setBookName(r.getString(7));
				o.setAuthor(r.getString(8));
				o.setPrice(r.getString(9));
				o.setPaymentType(r.getString(10));
				l.add(o);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return l;
	}

	@Override
	public List<BookOrder> getAllOrder() {
		// TODO Auto-generated method stub
		List <BookOrder> l=new ArrayList<BookOrder>();
		BookOrder o=null;
		try {
			String sql="select * from bookOrder";
			PreparedStatement p=conn.prepareStatement(sql);
			//p.setString(1, email);
			ResultSet r=p.executeQuery();
			while(r.next()) {
				o=new BookOrder();
				o.setId(r.getInt(1));
				o.setOrderId(r.getString(2));
				o.setUserName(r.getString(3));
				o.setEmail(r.getString(4));
				o.setFulladd(r.getString(5));
				o.setPhno(r.getString(6));
				o.setBookName(r.getString(7));
				o.setAuthor(r.getString(8));
				o.setPrice(r.getString(9));
				o.setPaymentType(r.getString(10));
				l.add(o);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return l;
	}

	
	
}
