package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Book;
//import com.sun.tools.javac.util.List;

public class BookDAOImpl implements BookDAO {

	private Connection conn;

	@Override
	public boolean addBooks(Book b) {
		// TODO Auto-generated method stub
		boolean f=false;
		try {
			String sql="insert into books(bookname, author, price, bookcategory, status, photo, user_email) values (?,?,?,?,?,?,?)";
			PreparedStatement p=conn.prepareStatement(sql);
			p.setString(1, b.getBookName());
			p.setString(2, b.getAuthor());
			p.setString(3, b.getPrice());
			p.setString(4, b.getBookCategory());
			p.setString(5, b.getStatus());
			p.setString(6, b.getPhotoName());
			p.setString(7, b.getEmail());
		
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

	public BookDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public List<Book> getAllBooks() {
		// TODO Auto-generated method stub
		List<Book> l=new ArrayList<Book>();
		Book b=null;
		try {
			String sql="select * from books";
			PreparedStatement p=conn.prepareStatement(sql);
			ResultSet r=p.executeQuery();
			while(r.next()) {
				b=new Book();
				b.setBookId(r.getInt(1));
				b.setBookName(r.getString(2));
				b.setAuthor(r.getString(3));
				b.setPrice(r.getString(4));
				b.setBookCategory(r.getString(5));
				b.setStatus(r.getString(6));
				b.setPhotoName(r.getString(7));
				b.setEmail(r.getString(8));
				l.add(b);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return l;
	}

	@Override
	public Book getBookById(int id) {
		// TODO Auto-generated method stub
		Book b=null;
		try {
			String sql="select * from books where bookid=?";
			PreparedStatement p=conn.prepareStatement(sql);
			p.setInt(1, id);
			ResultSet r=p.executeQuery();
			while(r.next()) {
				b=new Book();
				b.setBookId(r.getInt("bookid"));
				b.setBookName(r.getString("bookname"));
				b.setAuthor(r.getString("author"));
				b.setPrice(r.getString("price"));
				b.setBookCategory(r.getString("bookcategory"));
				b.setStatus(r.getString("status"));
				b.setPhotoName(r.getString("photo"));
				b.setEmail(r.getString("user_email"));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	@Override
	public boolean updateEditBooks(Book b) {
		// TODO Auto-generated method stub
		boolean f=false;
		try {
			String sql="update books set bookname=?, author=?, price=?, status=? where bookid=?";
			PreparedStatement p=conn.prepareStatement(sql);
			p.setString(1, b.getBookName());
			p.setString(2, b.getAuthor());
			p.setString(3, b.getPrice());
			p.setString(4, b.getStatus());
			p.setInt(5, b.getBookId());
			
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
	public boolean deleteBooks(int id) {
		// TODO Auto-generated method stub
		boolean f=false;
		try {
			String sql="delete from books where bookid=?";
			PreparedStatement p=conn.prepareStatement(sql);
			p.setInt(1, id);
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
	public List<Book> getNewBook() {
		// TODO Auto-generated method stub
		List<Book> l=new ArrayList<Book>();
		Book b=null;
		try {
			String sql="select * from books where bookcategory=? and status=? order by bookid desc";
			PreparedStatement p=conn.prepareStatement(sql);
			p.setString(1, "New");
			p.setString(2, "Active");
			ResultSet r=p.executeQuery();
			int i=1;
			while(r.next() && i<=4) {
				b=new Book();
				b.setBookId(r.getInt("bookid"));
				b.setBookName(r.getString("bookname"));
				b.setAuthor(r.getString("author"));
				b.setPrice(r.getString("price"));
				b.setBookCategory(r.getString("bookcategory"));
				b.setStatus(r.getString("status"));
				b.setPhotoName(r.getString("photo"));
				b.setEmail(r.getString("user_email"));
				l.add(b);
				i++;
				
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return l;
	}

	@Override
	public List<Book> getRecentBooks() {
		// TODO Auto-generated method stub
		
		List<Book> l=new ArrayList<Book>();
		Book b=null;
		try {
			String sql="select * from books where status=? order by bookid desc";
			PreparedStatement p=conn.prepareStatement(sql);

			p.setString(1, "Active");
			ResultSet r=p.executeQuery();
			int i=1;
			while(r.next() && i<=4) {
				b=new Book();
				b.setBookId(r.getInt("bookid"));
				b.setBookName(r.getString("bookname"));
				b.setAuthor(r.getString("author"));
				b.setPrice(r.getString("price"));
				b.setBookCategory(r.getString("bookcategory"));
				b.setStatus(r.getString("status"));
				b.setPhotoName(r.getString("photo"));
				b.setEmail(r.getString("user_email"));
				l.add(b);
				i++;
				
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return l;
	}

	@Override
	public List<Book> getOldBooks() {
		// TODO Auto-generated method stub
		List<Book> l=new ArrayList<Book>();
		Book b=null;
		try {
			String sql="select * from books where bookcategory=? and status=? order by bookid desc";
			PreparedStatement p=conn.prepareStatement(sql);
			p.setString(1, "Old");
			p.setString(2, "Active");
			ResultSet r=p.executeQuery();
			int i=1;
			while(r.next() && i<=4) {
				b=new Book();
				b.setBookId(r.getInt("bookid"));
				b.setBookName(r.getString("bookname"));
				b.setAuthor(r.getString("author"));
				b.setPrice(r.getString("price"));
				b.setBookCategory(r.getString("bookcategory"));
				b.setStatus(r.getString("status"));
				b.setPhotoName(r.getString("photo"));
				b.setEmail(r.getString("user_email"));
				l.add(b);
				i++;
				
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return l;
	}

	@Override
	public List<Book> getAllRecentBooks() {
		// TODO Auto-generated method stub
		List<Book> l=new ArrayList<Book>();
		Book b=null;
		try {
			String sql="select * from books where status=? order by bookid desc";
			PreparedStatement p=conn.prepareStatement(sql);
			p.setString(1, "Active");
			ResultSet r=p.executeQuery();
			
			while(r.next()) {
				b=new Book();
				b.setBookId(r.getInt("bookid"));
				b.setBookName(r.getString("bookname"));
				b.setAuthor(r.getString("author"));
				b.setPrice(r.getString("price"));
				b.setBookCategory(r.getString("bookcategory"));
				b.setStatus(r.getString("status"));
				b.setPhotoName(r.getString("photo"));
				b.setEmail(r.getString("user_email"));
				l.add(b);
				
				
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return l;
	}

	@Override
	public List<Book> getAllNewBooks() {
		// TODO Auto-generated method stub
		List<Book> l=new ArrayList<Book>();
		Book b=null;
		try {
			String sql="select * from books where bookcategory=? and status=? order by bookid desc";
			PreparedStatement p=conn.prepareStatement(sql);
			p.setString(1, "New");
			p.setString(2, "Active");
			ResultSet r=p.executeQuery();
			
			while(r.next()) {
				b=new Book();
				b.setBookId(r.getInt("bookid"));
				b.setBookName(r.getString("bookname"));
				b.setAuthor(r.getString("author"));
				b.setPrice(r.getString("price"));
				b.setBookCategory(r.getString("bookcategory"));
				b.setStatus(r.getString("status"));
				b.setPhotoName(r.getString("photo"));
				b.setEmail(r.getString("user_email"));
				l.add(b);
				
				
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return l;
	}

	@Override
	public List<Book> getAllOldBooks() {
		// TODO Auto-generated method stub
		List<Book> l=new ArrayList<Book>();
		Book b=null;
		try {
			String sql="select * from books where status=? and bookcategory=? order by bookid desc";
			PreparedStatement p=conn.prepareStatement(sql);
			p.setString(1, "Active");
			p.setString(2, "Old");
			ResultSet r=p.executeQuery();
			
			while(r.next()) {
				b=new Book();
				b.setBookId(r.getInt("bookid"));
				b.setBookName(r.getString("bookname"));
				b.setAuthor(r.getString("author"));
				b.setPrice(r.getString("price"));
				b.setBookCategory(r.getString("bookcategory"));
				b.setStatus(r.getString("status"));
				b.setPhotoName(r.getString("photo"));
				b.setEmail(r.getString("user_email"));
				l.add(b);
			
				
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return l;
	
	}

	@Override
	public List<Book> getBookByOld(String email, String cate) {
		// TODO Auto-generated method stub
		List<Book> l=new ArrayList<Book>();
		Book b=null;
		try {
			String sql="select * from books where bookcategory=? and user_email=?";
			PreparedStatement p=conn.prepareStatement(sql);
			p.setString(1, cate);
			p.setString(2, email);
			ResultSet r=p.executeQuery();
			
			while(r.next()) {
				b=new Book();
				b.setBookId(r.getInt("bookid"));
				b.setBookName(r.getString("bookname"));
				b.setAuthor(r.getString("author"));
				b.setPrice(r.getString("price"));
				b.setBookCategory(r.getString("bookcategory"));
				b.setStatus(r.getString("status"));
				b.setPhotoName(r.getString("photo"));
				b.setEmail(r.getString("user_email"));
				l.add(b);
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return l;
	}

	@Override
	public boolean oldBookDelete(String email, String cat, int id) {
		// TODO Auto-generated method stub
		boolean f=false;
		try {
			String sql="delete from books where bookcategory=? and user_email=? and bookid=?";
			PreparedStatement p=conn.prepareStatement(sql);
			p.setString(1, cat);
			p.setString(2, email);
			p.setInt(3, id);
			int i=p.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<Book> getBookBySearch(String ch) {
		// TODO Auto-generated method stub
		List<Book> l=new ArrayList<Book>();
		Book b=null;
		try {
			String sql="select * from books where bookname ? or author like ? or bookcategory like ? and status=?";
			PreparedStatement p=conn.prepareStatement(sql);
			p.setString(1, "%"+ch+"%");
			p.setString(2, "%"+ch+"%");
			p.setString(3, "%"+ch+"%");
			p.setString(4, "Active");
			ResultSet r=p.executeQuery();
			
			while(r.next()) {
				b=new Book();
				b.setBookId(r.getInt("bookid"));
				b.setBookName(r.getString("bookname"));
				b.setAuthor(r.getString("author"));
				b.setPrice(r.getString("price"));
				b.setBookCategory(r.getString("bookcategory"));
				b.setStatus(r.getString("status"));
				b.setPhotoName(r.getString("photo"));
				b.setEmail(r.getString("user_email"));
				l.add(b);
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return l;
	
	}
	
	
}
