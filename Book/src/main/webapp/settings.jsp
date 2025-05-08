<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="allComponent/allCss.jsp"%>

<style type="text/css">
	a{
		text-decoration:none;
		color:black;
	}
	a:hover{
		text-decoration:none;
	}
</style>

</head>
<body style="background-color:#f7f7f7">

<c:if test="${empty userobj }">
	<c:redirect url="login.jsp"/>
</c:if>

<%@include file="allComponent/navbar.jsp" %>
<div class="container">

	<h3 class="text-center">Hello, ${userobj.name}</h3>
	
	<div class="row p-5">
		<div class="col-md-4">
			<div class="card">
				<a href="sellBook.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-book-open fa-3x"></i>
							</div>
							<h4>Sell Old Book</h4>
						</div>
					</div>
				</a>
			</div>
		</div>
		
		<div class="col-md-4">
			<div class="card">
				<a href="oldBook.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-warning">
								<i class="fas fa-book-open fa-3x"></i>
							</div>
							<h4>Old Book</h4>
						</div>
					</div>
				</a>
			</div>
		</div>
		
		<div class="col-md-4">
			<div class="card">
				<a href="editProfile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-success">
								<i class="fas fa-edit fa-3x"></i>
							</div>
							<h4>Edit profile</h4>
						</div>
					</div>
				</a>
			</div>
		</div>
		
				
		<div class="col-md-6 mt-3">
			<div class="card">
				<a href="order.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-danger">
								<i class="fas fa-box-open fa-3x"></i>
							</div>
							<h3>My Order</h3>
							<p>Track Order</p>
						</div>
					</div>
				</a>
			</div>
		</div>
		
		<div class="col-md-6 mt-3">
			<div class="card">
				<a href="helpline.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-user-circle fa-3x"></i>
							</div>
							<h3>Help Center</h3>
							<p>24*7 Service</p>
						</div>
					</div>
				</a>
			</div>
		</div>
		
	</div>
</div>
<%@include file="allComponent/footer.jsp" %>
</body>
</html>