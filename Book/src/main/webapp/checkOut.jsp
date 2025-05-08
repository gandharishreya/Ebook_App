<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page isELIgnored="false" %>
<%@ page import="java.util.List" %>
    <%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.User" %> 
<%@ page import="com.entity.Cart" %>
<%@ page import="com.DAO.CartDAOImpl" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart Page</title>
<%@include file="allComponent/allCss.jsp" %>
</head>
<body style="background-color:#f0f1f2">
<%@include file="allComponent/navbar.jsp" %>

<c:if test="${empty userobj }">
	<c:redirect url="login.jsp" />
</c:if>

<c:if test="${not empty successMsg }">
	<div class="alert alert-success" role="alert">${successMsg }</div>
	<c:remove var="successMsg" scope="session"/>
</c:if>

<c:if test="${not empty failedMsg }">
	<div class="alert alert-danger" role="alert">${failedMsg }</div>
	<c:remove var="failedMsg" scope="session"/>
</c:if>

<div class="container">
	<div class="row p-2">
		<div class="col-md-6">
			
			<div class="card bg-white">
				<div class="card-body">
					<h3 class="text-center text-success">Selected List in Cart</h3>
						<table class="table table-striped">
						  <thead>
						    <tr>
						      <th scope="col">Book Name</th>
						      <th scope="col">Author</th>
						      <th scope="col">Price</th>
						      <th scope="col">Action</th>
						    </tr>
						  </thead>
						  <tbody>
						  
						  <% 
						 	User u=(User)session.getAttribute("userobj");
						  	CartDAOImpl d=new CartDAOImpl(DBConnect.getConn());
						 	List<Cart> cart= d.getBookByUser(u.getId());
						 	Double totalPrice=0.00;
						 for(Cart c: cart){
							 totalPrice =c.getTotalPrice();
						  %>
						    <tr>
						      <th scope="row"><%=c.getBookName() %></th>
						      <td><%=c.getAuthor()%></td>
						      <td><%=c.getPrice() %></td>
						      <td><a href="remove?bid=<%=c.getBid()%>&uid=<%=c.getUserId() %>&cid=<%=c.getCid() %>" class="btn btn-sm btn-danger">Remove</a></td>
						    </tr>
						  <%
						  }
						 %>
						 
						 <tr>
						 <td>Total Price</td>
						 <td></td>
						 <td></td>
						 <td><%=totalPrice %>
						 <td>
						  </tbody>
						</table>
					</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="card">
				<div class="card-body">
					<h3 class="text-center text-success">Details for Shipping</h3>
					<form action="order" method="post">
					<input type="hidden" value="${userobj.id }" name="id">
						<div class="form-row">
						    <div class="form-group col-md-6">
						      <label for="inputName">Name</label>
						      <input type="text" class="form-control" id="inputName" value="${userobj.name }" readonly="readonly" name="username" required>
						    </div>
						    <div class="form-group col-md-6">
						      <label for="inputEmail">Email</label>
						      <input type="email" class="form-control" id="inputEmail" value="${userobj.email }" readonly="readonly" name="email" required>
						    </div>
						 </div>
						 <div class="form-row">
						    <div class="form-group col-md-6">
						      <label for="inputPhone">Phone Number</label>
						      <input type="number" class="form-control" id="inputPhone" value="${userobj.phno }" name="phno" required>
						    </div>
						    <div class="form-group col-md-6">
						      <label for="inputAddress">Address</label>
						      <input type="text" class="form-control" id="inputAddress" name="address" required>
						    </div>
						 </div>
						 <div class="form-row">
						    <div class="form-group col-md-6">
						      <label for="inputLandmark">Landmark</label>
						      <input type="text" class="form-control" id="inputLandmark" name="landmark" required>
						    </div>
						    <div class="form-group col-md-6">
						      <label for="inputCity">City</label>
						      <input type="text" class="form-control" id="inputCity" name="city" required>
						    </div>
						 </div>
						 <div class="form-row">
						    <div class="form-group col-md-6">
						      <label for="inputState">State</label>
						      <input type="text" class="form-control" id="inputState" name="state" required>
						    </div>
						    <div class="form-group col-md-6">
						      <label for="inputZipcode">Zipcode</label>
						      <input type="number" class="form-control" id="inputZipcode" name="zipcode" required>
						    </div>
						 </div>
						 <div class="form-group">
						 	<label>Payment Mode</label><select class="form-control" name="payment">
						 		<option value="Select">--Select--</option>
						 		<option value="COD">Cash on Delivery</option>
						 	</select>
						 </div>
						 
						 <div class="text-center">
						 	<button class="btn btn-warning">Place Order</button>
						 	<a href="index.jsp" class="btn btn-success">Continue Shopping</a>
						 </div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>