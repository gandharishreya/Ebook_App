package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Book;
import com.entity.Cart;

public class CartDAOImpl implements CartDAO {

	private Connection conn;
	public CartDAOImpl(Connection conn) {
		this.conn=conn;
	}
	
	@Override
	public boolean addCart(Cart c) {
		// TODO Auto-generated method stub
		boolean f=false;
		try {
			String sql="insert into carts(bid, uid, bookName, author, price, total_price) values(?,?,?,?,?,?)";
			PreparedStatement p=conn.prepareStatement(sql);
			p.setInt(1, c.getBid());
			p.setInt(2, c.getUserId());
			p.setString(3, c.getBookName());
			p.setString(4, c.getAuthor());
			p.setDouble(5, c.getPrice());
			p.setDouble(6, c.getTotalPrice());
			
			int i=p.executeUpdate();
			if(i==1) {
				f=true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<Cart> getBookByUser(int userId) {
		// TODO Auto-generated method stub
		List<Cart> l=new ArrayList<Cart>();
		
		Cart c=null;
		double totalPrice=0;
		try {
			String sql="select * from carts where uid=?";
			PreparedStatement p=conn.prepareStatement(sql);
			p.setInt(1, userId);
			
			ResultSet r=p.executeQuery();
			while(r.next()) {
				c=new Cart();
				c.setCid(r.getInt(1));
				c.setBid(r.getInt(2));
				c.setUserId(r.getInt(3));
				c.setBookName(r.getString(4));
				c.setAuthor(r.getString(5));
				c.setPrice(r.getDouble(6));
			//	c.setTotalPrice(r.getDouble(7));

				totalPrice=totalPrice+r.getDouble(7);
				c.setTotalPrice(totalPrice);
				
				l.add(c);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return l;
	}

	@Override
	public boolean deleteBook(int bid, int uid, int cid) {
		// TODO Auto-generated method stub
		boolean f=false;
		try {
			String sql="delete from carts where bid=? and uid=? and cid=?";
			PreparedStatement p=conn.prepareStatement(sql);
			p.setInt(1, bid);
			p.setInt(2, uid);
			p.setInt(3, cid);
			int i=p.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	
}
