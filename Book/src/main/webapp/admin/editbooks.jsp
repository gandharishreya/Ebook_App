<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
   <%@ page import="com.entity.Book" %>
<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook: Edit book</title>
<%@include file="allCss.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Book</h4>
						
						
						<% int id=Integer.parseInt(request.getParameter("id"));
							BookDAOImpl d=new BookDAOImpl(DBConnect.getConn());
							Book b=d.getBookById(id);
						%>
						
						<form action="../editBooks" method="post">
							<input type="hidden" name="id" value="<%=b.getBookId()%>">
							<div class="form-group">
								<label for="exampleInputEmail1">Book name</label>
								<input name="bname" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=b.getBookName()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail">Author name</label>
								<input name="author" type="text" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp" value="<%=b.getAuthor()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Price</label>
								<input name="price" type="number" class="form-control" id="exampleInputPassword1" value="<%=b.getPrice()%>">
							</div>
							<div class="form-group">
								<label for="inputState">Book Categories</label>
								<select id="inputState" name="status" class="form-control">
								<% if("Active".equals(b.getStatus())){%>
											<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								<% }else{%>
										
									<option value="Inactive">Inactive</option>
									<option value="Active">Active</option>
								<%} %>
									
								</select>
							</div>
							
							<button type="submit" class="btn btn-primary">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top:123px">
<%@include file="footer.jsp" %>
</div>
</body>
</html>