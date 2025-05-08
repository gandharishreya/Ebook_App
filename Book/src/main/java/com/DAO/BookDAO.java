package com.DAO;

import com.entity.Book;
//import com.sun.tools.javac.util.List;
import java.util.List;


public interface BookDAO {

	public boolean addBooks(Book b);
	public List<Book> getAllBooks();
	public Book getBookById(int id);
	public boolean updateEditBooks(Book b);
	public boolean deleteBooks(int id);
	public List<Book> getNewBook();
	public List<Book> getRecentBooks();
	public List<Book> getOldBooks();
	public List<Book> getAllRecentBooks();
	public List<Book> getAllNewBooks();
	public List<Book> getAllOldBooks();
	public List<Book> getBookByOld(String email, String cate);
	public boolean oldBookDelete(String email, String cat, int id);
	public List<Book> getBookBySearch(String ch);
	
}
