<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook: Sell Book</title>
<%@include file="allComponent/allCss.jsp" %>
</head>
<body style="background-color:#f0f1f2">

<c:if test="${empty userobj }">
	<c:redirect url="login.jsp"/>
</c:if>

<%@include file="allComponent/navbar.jsp" %>
<div class="container">
	<div class="row">
		<div class="col-md-4 offset-md-4">
			<div class="card">
				<div class="card-body">
					<h5 class="text-center text-danger p-1">Sell Old Books</h5>
					
						<c:if test="${not empty successMsg}">
							<p class="text-center text-success">${successMsg}</p>
							<c:remove var="successMsg" scope="session"/> 
						</c:if>
						<c:if test="${not empty failedMsg}">
							<p class="text-center text-danger">${failedMsg}</p>
							<c:remove var="failedMsg" scope="session"/> 
						</c:if>
					
					<form action="addOldBook" method="post" enctype="multipart/form-data">
						<input type="hidden" name="user" value="${userobj.email}">
							<div class="form-group">
								<label for="exampleInputEmail1">Book name</label>
								<input name="bname" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail">Author name</label>
								<input name="author" type="text" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Price</label>
								<input name="price" type="number" class="form-control" id="exampleInputPassword1">
							</div>
							
							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo</label>
								<input name="bimg" type="file" class="form-control-file" id="exampleFormControlFile1">
							</div>
							<button type="submit" class="btn btn-primary">Sell</button>
						</form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>