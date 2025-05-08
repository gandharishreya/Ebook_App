<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<%@include file="allComponent/allCss.jsp" %>
</head>
<body style="background-color:#f0f1f2">
<%@include file="allComponent/navbar.jsp" %>
<div class="container">
	<div class="row">
		<div class="col-md-4 offset-md-4">
			<div class="card">
				<div class="card-body">
				<h4 class="text-center text-primary">Edit Profile</h4>
				
				<c:if test="${not empty failedMsg }">
					<h5 class="text-center text-danger">${failedMsg}</h5>
					<c:remove var="failedMsg" scope="session"/>
				</c:if>
				
				<c:if test="${not empty successMsg }">
					<h5 class="text-center text-success">${successMsg}</h5>
					<c:remove var="successMsg" scope="session"/>
				</c:if>
				
					<form action="updateProfile" method="post">
					<input type="hidden" value="${ userobj.id}" name="id">
			  			<div class="form-group">
						    <label for="exampleInputEmail1">Enter Full Name</label>
						    <input type="text" class="form-control" required="required" name="fname" value="${userobj.name }">
			  			</div>
			
			 			 <div class="form-group">
						    <label for="exampleInputEmail1">Email address</label>
						    <input type="email" class="form-control" required="required" name="email" value="${userobj.email }">
						 </div>
			
						  <div class="form-group">
						    <label for="exampleInputEmail1">Phone number</label>
						    <input type="number" class="form-control" required="required" name="phno" value="${userobj.phno }">
						  </div>
			
						  <div class="form-group">
						    <label for="exampleInputPassword1">Password</label>
						    <input type="password" class="form-control" required="required" name="password">
						  </div>
						
						 
						
			  			  <button type="submit" class="btn btn-primary">Update</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>