package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.DB.DBConnect;
import com.entity.User;

import jakarta.servlet.http.HttpSession;

public class UserDAOImpl implements UserDAO {

	private Connection conn;

	public UserDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean userRegister(User u) {
		// TODO Auto-generated method stub
		boolean f= false;
		try {
			String sql="insert into users(name, email, phno, password) values (?,?,?,?)";
			PreparedStatement p=conn.prepareStatement(sql);
			p.setString(1, u.getName());
			p.setString(2, u.getEmail());
			p.setString(3, u.getPhno());
			p.setString(4, u.getPassword());
			
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
	public User login(String email, String password) {
		// TODO Auto-generated method stub
		User u=null;
		
		try {
			String sql="select * from users where email= ? and password= ?";
			PreparedStatement p=conn.prepareStatement(sql);
			p.setString(1,email);
			p.setString(2, password);
			
			ResultSet r=p.executeQuery();
			while(r.next()) {
				u = new User();
				//u.setId(r.getInt(1));
				u.setName(r.getString(1));
				u.setEmail(r.getString(2));
				u.setPhno(r.getString(3));
				u.setPassword(r.getString(4));
				u.setAddress(r.getString(5));
				u.setLandmark(r.getString(6));
				u.setCity(r.getString(7));
				u.setState(r.getString(8));
				u.setPincode(r.getString(9));
				u.setId(r.getInt(10));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			}
		
		return u;
	}

	@Override
	public boolean checkPassword(int id, String ps) {
		// TODO Auto-generated method stub
		boolean f=false;
		try {
			String sql="select * from users wher id=? and password=?";
			PreparedStatement p=conn.prepareStatement(sql);
			p.setInt(1,id);
			p.setString(2, ps);
			ResultSet r=p.executeQuery();
			while(r.next()) {
				f=true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public boolean updateProfile(User us) {
		// TODO Auto-generated method stub
		boolean f= false;
		try {
			String sql="update user set name=?, email=?, phno=?, where id=?";
			PreparedStatement p=conn.prepareStatement(sql);
			p.setString(1, us.getName());
			p.setString(2, us.getEmail());
			p.setString(3, us.getPhno());
			p.setString(4, us.getPassword());
			p.setInt(4, us.getId());
			
			
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
	public boolean checkUser(String em) {
		// TODO Auto-generated method stub
		boolean f= true;
		try {
			String sql="select * from users where email=?";
			PreparedStatement p=conn.prepareStatement(sql);
			p.setString(1, em);
			ResultSet r=p.executeQuery();
			while(r.next()) {
				f=false;
			}
			
			
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
