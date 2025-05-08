<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page isELIgnored="false" %>
   <%@ page import="java.util.List" %>
    <%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.User" %> 
<%@ page import="com.entity.BookOrder" %>
<%@ page import="com.DAO.OrderBookDAOImpl" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All Orders</title>
<%@include file="allCss.jsp"%>

</head>
<body>

<c:if test="${empty userobj }">
	<c:redirect url="login.jsp" />
</c:if>
<%@include file="navbar.jsp"%>
<h3 class="text-center">Hello Admin</h3>

<table class="table table-striped">
  <thead class="bg-primary">
    <tr>
      <th scope="col">Order Id</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Address</th>
      <th scope="col">Phone no</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
       <th scope="col">Price</th>
      <th scope="col">Payment type</th>
    </tr>
  </thead>
  <tbody>
  
  <%
  	OrderBookDAOImpl d=new OrderBookDAOImpl(DBConnect.getConn());
  List<BookOrder> l=d.getAllOrder();
  for(BookOrder b:l){
  	%>
  		<tr>
      <th scope="row"><%=b.getOrderId() %></th>
      <td><%=b.getUserName() %></td>
      <td><%=b.getEmail() %></td>
      <td><%=b.getFulladd() %></td>
      <td><%=b.getPhno() %></td>
      <td><%=b.getBookName() %></td>
      <td><%=b.getAuthor() %></td>
      <td><%=b.getPrice() %></td>
      <td><%=b.getPaymentType() %></td>
  
    </tr>
  	<%
  	}%>
    
  
  </tbody>
</table>
<div style="margin-top:290px">
<%@include file="footer.jsp" %>
</div>
</body>
</html>