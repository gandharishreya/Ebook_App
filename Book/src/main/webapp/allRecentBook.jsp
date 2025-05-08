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
<title>All Recent Books</title>
<%@include file="allComponent/allCss.jsp"%>
<style type="text/css">
.back-img{
background: url("img/cover.jpg");
height: 50vh;
width:100%;
background-repeat:no-repeat;
background-size: cover;
}

.crd-ho:hover{
background-color:#f7f7f7;
}

</style>
</head>
<body>
<%
	User u=(User)session.getAttribute("userobj");
%>

<%@include file="allComponent/navbar.jsp" %>

<div class="container">
	
	<div class="row p-3">
		
				<%
				BookDAOImpl d1= new BookDAOImpl(DBConnect.getConn());
				List<Book> l1=d1.getRecentBooks();
				for(Book b:l1){
				%>
				<div class="col-md-3">
			<div class="card crd-ho mt-2">
				<div class="card-body text-center">
					<img alt="Java book" src="img/<%=b.getPhotoName()%>" style="width:100px; height:150px" class="img-thumblin"/>
					<p><%=b.getBookName()%></p>
					<p><%=b.getAuthor()%></p>
					<p>
						<%
							if(b.getBookCategory().equals("Old")){
								%>
									Categories:<%=b.getBookCategory() %></p>	
					<div class="row">
					
						
						<a href="viewBooks.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View details</a>
						<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%></a>
					</div>
								
					<p>		<% }else{
						%>
						Categories:<%=b.getBookCategory() %></p>
						<div class="row">
						
								<%
						if(u==null){%>
					
						<a href="login.jsp" class="btn btn-danger btn-sm ml-1"> Add to Cart</a>
						<%}else{ %>
						<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-1"> Add to Cart</a>
						
						<%} %>
							
							<a href="viewBooks.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View details</a>
							<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%></a>
						</div>
						<% } %>
					
				</div>
			</div>
		</div>
			<% 
			}
			%>
		
		
	</div>
	<div class="text-center mt-2 p-2">
			<a href="" class="btn btn-danger btn-sm text-white">View All</a>
	</div>
</div>
</body>
</html>