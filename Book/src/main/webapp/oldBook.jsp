<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="com.DB.DBConnect" %>
 <%@ page import="com.entity.User" %>
<%@ page import="com.entity.Book" %>
<%@ page import="com.DAO.BookDAOImpl" %>

<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Old Book</title>
<%@include file="allComponent/allCss.jsp" %>
</head>
<body>
<%@include file="allComponent/navbar.jsp" %>

				<c:if test="${not empty successMsg}"> 
						<div class="alert alert-success text-center">${successMsg}</div>
						<c:remove var="successMsg" scope="session"/>
					</c:if>
					
<div class="container p-5">
	<table class="table table-striped">
  <thead class="bg-primary text-white">
    <tr>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Category</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
   
   <%
   User u = (User)session.getAttribute("userobj");
   String email=u.getEmail();
   	BookDAOImpl d=new BookDAOImpl(DBConnect.getConn());
   	List<Book> l=d.getBookByOld(email, "Old");
   	for(Book b : l){
   %>
   
    <tr>
      <td><%=b.getBookName() %></td>
      <td><%=b.getAuthor() %></td>
      <td><%=b.getPrice() %></td>
      <td><%=b.getBookCategory() %></td>
      <td><a href="deleteOldBook?em=<%=email %>&id=<%=b.getBookId() %>" class="btn btn-sm btn-danger">Delete</a></td>
    </tr>
    <%} %>
   
  </tbody>
</table>
</div>
</body>
</html>