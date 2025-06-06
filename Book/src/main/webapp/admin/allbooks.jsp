<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
  
    <%@ page import="com.entity.Book" %>
<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.util.List" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All Books</title>
<%@include file="allCss.jsp"%>

</head>
<body>
<%@include file="navbar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp"/>
	</c:if>

<h3 class="text-center">Hello Admin</h3>

						<c:if test="${not empty successMsg}">
							<h5 class="text-center text-success">${successMsg}</h5>
							<c:remove var="successMsg" scope="session"/> 
						</c:if>
						
						<c:if test="${not empty failedMsg}">
							<h5 class="text-center text-danger">${failedMsg}</h5>
							<c:remove var="failedMsg" scope="session"/> 
						</c:if>

<table class="table table-striped">
  <thead class="bg-primary">
    <tr>
    <th scope="col">Id</th>
      <th scope="col">Image</th>
      
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Categories</th>
      <th scope="col">Status</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  
  <%
  	BookDAOImpl d=new BookDAOImpl(DBConnect.getConn());
  	List<Book> l=d.getAllBooks();
  	for(Book b: l){
	  %>
	  
	  <tr>
      
      <td><%=b.getBookId() %></td>
      <td><img src="../img/<%=b.getPhotoName() %>" style="width:50px; height:50px;"/></td>
      <td><%=b.getBookName() %></td>
      <td><%=b.getAuthor() %></td>
      <td><%=b.getPrice() %></td>
       <td><%=b.getBookCategory() %></td>
        <td><%=b.getStatus() %></td>
      <td>
      	<a href="editbooks.jsp?id=<%=b.getBookId()%>" class="btn btn-sm btn-primary"><i class="fas fa-edit"></i> Edit</a>
      	<a href="../delete?id=<%=b.getBookId()%>" class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i> Delete</a>
      </td>
    </tr>
	  
	  <% 
  }
  %>
  
   
  </tbody>
</table>
<div style="margin-top:270px">
<%@include file="footer.jsp" %>
</div>
</body>
</html>