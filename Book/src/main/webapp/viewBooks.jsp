<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.DB.DBConnect" %>
 
<%@ page import="com.entity.Book" %>
<%@ page import="com.DAO.BookDAOImpl" %>

<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="allComponent/allCss.jsp"%>
</head>
<body style="background-color:#f0f1f2;">
<%@include file="allComponent/navbar.jsp" %>

<%
	int bid=Integer.parseInt(request.getParameter("bid"));
	BookDAOImpl d=new BookDAOImpl(DBConnect.getConn());
	Book b=d.getBookById(bid);
%>
<div class="container p-3">
	<div class="row">
		<div class="col-md-6 text-center p-5 border bg-white">
			<img src="img/<%=b.getPhotoName() %>" style="height:150px; width:100px"></br>
			<h4 class="mt-3">Book Name:<span class="text-success"><%=b.getBookName() %></span></h4>
			<h4>Author Name:<span class="text-success"> <%=b.getAuthor() %></span></h4>
			<h4>Category:<span class="text-success"> <%=b.getBookCategory() %></span></h4>
		</div>
		<div class="col-md-6 text-center p-5 border bg-white">
			<h2><%=b.getBookName() %></h2>
			
			<%
			if("old".equals(b.getBookCategory())){
			%>
			<h5 class="text-primary">Contact to seller</h5>
			<h5 class="text-primary">
				<i class="far fa-envelope"></i>Email;
					<%=b.getEmail() %>
			</h5>
			
			<%
			}
			%>
			
			<div class="row">
				<div class="col-md-4 text-danger text-center p-2">
					<i class="fas fa-money-bill-wave fa-3x"></i>
					<p>Cash on delivery</p>
				</div>
				<div class="col-md-4 text-danger text-center p-2">
					<i class="fas fa-undo-alt fa-3x"></i>
					<p>Return Available</p>
				</div>
				<div class="col-md-4 text-danger text-center p-2">
					<i class="fas fa-truck-moving fa-3x"></i>
					<p>Free Shipping</p>		
				</div>
				
				<% if("old".equals(b.getBookCategory())) {%>
					<div class="text-center p-3">
					<a href="index.jsp" class="btn btn-success">Continue Shopping</a>
					<a href="" class="btn btn-danger">12</a>
				</div>
				
				<% }else{ %>
				
				<div class="text-center p-3">
					<a href="" class="btn btn-primary">Add to cart</a>
					<a href="" class="btn btn-danger">12</a>
				</div>
				<%} %>
			</div>
		</div>
	</div>
</div>
</body>
</html>