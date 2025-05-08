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
<title>Insert title here</title>
<%@include file="allComponent/allCss.jsp" %>
</head>
<body style="background-color:#f0f1f2">

<c:if test="${empty userobj }">
	<c:redirect url="login.jsp" />
</c:if>

<%@include file="allComponent/navbar.jsp" %>
<div class="container p-1">
<h3 class="text-center text-primary">Your Order</h3>
	<table class="table table-striped">
  <thead class="bg-primary text-white">
    <tr>
      <th scope="col">Order Id</th>
      <th scope="col">Name</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Email</th>
       <th scope="col">Price</th>
        <th scope="col">Payment</th>
    </tr>
  </thead>
  <tbody>
  <%
  	User u=(User)session.getAttribute("userobj");
  	OrderBookDAOImpl d=new OrderBookDAOImpl(DBConnect.getConn());
  	List<BookOrder> l= d.getBook(u.getEmail());
  	for(BookOrder b:l){
  %>
  	<tr>
      <th scope="row"><%=b.getOrderId() %></th>
      <td><%=b.getUserName() %></td>
      <td><%=b.getBookName() %></td>
      <td><%=b.getAuthor() %></td>
      <td><%=b.getEmail() %></td>
      <td><%=b.getPrice() %></td>
      <td><%=b.getPaymentType() %></td>
    </tr>
  <%
  } %>
    
  
  </tbody>
</table>
</div>

</body>
</html>