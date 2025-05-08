<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.User" %>
<%@ page import="com.entity.Book" %>
<%@ page import="com.DAO.BookDAOImpl" %>


<%@ page import="java.util.List" %>
<html>
<head>
<meta charset="UTF-8">

<title>EBook: Index</title>
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
<body style="background-color:#f7f7f7">

<%
	User u=(User)session.getAttribute("userobj");
%>

<%@include file="allComponent/navbar.jsp" %>
<div class="container-fluid back-img">
<h1 class="text-center text-success p-5">EBook Management System</h1>
</div>

<% Connection conn = DBConnect.getConn();
out.println(conn); %>
<!--  Start of recent book -->
 
<div class="container">
	<h3 class="text-center p-3">Recent Book</h3>
	<div class="row">
		
				<%
				BookDAOImpl d1= new BookDAOImpl(DBConnect.getConn());
				List<Book> l1=d1.getRecentBooks();
				for(Book b:l1){
				%>
				<div class="col-md-3">
			<div class="card crd-ho">
				<div class="card-body text-center">
					<img alt="Java book" src="img/<%=b.getPhotoName()%>" style="width:150px; height:150px" class="img-thumblin"/>
					<p><%=b.getBookName()%></p>
					<p><%=b.getAuthor()%></p>
					<p>
						<%
							if(b.getBookCategory().equals("Old")){
								%>
									Categories:<%=b.getBookCategory() %></p>	
					<div class="row">
					
						
						<a href="viewBooks.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-5">View details</a>
						<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%></a>
					</div>
					<p>			
							<% }else{
						%>
						Categories:<%=b.getBookCategory() %></p>
						<div class="row">
						
							<%
					if(u==null){%>
					
						<a href="login.jsp" class="btn btn-danger btn-sm ml-1"> Add to Cart</a>
						<%}else{ %>
						<a href="cart?bid=<%=b.getBookId()%>&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-1"> Add to Cart</a>
						
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
			<a href="allRecentBook.jsp" class="btn btn-danger btn-sm text-white">View All</a>
	</div>
</div>
      
      <!--  end of recent book block-->
      <hr>
<!-- Start of new book -->

 <div class="container">
	<h3 class="text-center p-3">New Book</h3>
	<div class="row">
		
			<%
				BookDAOImpl d= new BookDAOImpl(DBConnect.getConn());
			List<Book> l=d.getNewBook();
			for(Book b:l){
				%>
				<div class="col-md-3">
					<div class="card crd-ho">
				<div class="card-body text-center">
					<img alt="Java book" src="img/<%=b.getPhotoName()%>" style="width:150px; height:150px" class="img-thumblin"/>
					<p><%=b.getBookName()%></p>
					<p><%=b.getAuthor()%></p>
					<p>Categories:<%=b.getBookCategory() %></p>
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
				</div>
			</div>
		</div>
		
				<% 
			}
			%>
		
	</div>
	<div class="text-center mt-2 p-2">
			<a href="allNewBook.jsp" class="btn btn-danger btn-sm text-white">View All</a>
	</div>
</div>
      
      
      <!--  end of new book block-->      
      <hr>
      <!-- Start of old book -->
<div class="container">
	<h3 class="text-center p-3">Old Book</h3>
	<div class="row">
		
				<%
				BookDAOImpl d2= new BookDAOImpl(DBConnect.getConn());
				List<Book> l2=d2.getOldBooks();
				for(Book b:l2){
				%>
				<div class="col-md-3">
			<div class="card crd-ho">
				<div class="card-body text-center">
					<img alt="Java book" src="img/<%=b.getPhotoName()%>" style="width:150px; height:150px" class="img-thumblin"/>
					<p><%=b.getBookName()%></p>
					<p><%=b.getAuthor()%></p>
					<p><%=b.getBookCategory()%></p>
					<div class="row">
						
						<a href="viewBooks.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-5">View details</a>
						<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%></a>
					</div> 
				</div>
			</div>
		</div>
			<% 
			}
			%>
		
		
	</div>
	<div class="text-center mt-2 p-2">
			<a href="allOldBook.jsp" class="btn btn-danger btn-sm text-white">View All</a>
	</div>
</div>
  
      <!--  end of old book block-->
       <%@include file="allComponent/footer.jsp" %>
</body>
</html> 







