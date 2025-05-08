<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="allComponent/allCss.jsp" %>
</head>
<body style="background-color:#f0f1f2;">
<%@include file="allComponent/navbar.jsp" %>

<div class="container text-center mt-3">
	<i class="fas fa-check-circle fa-5x text-success"></i>
	<h1>Thank you</h1>
	<h2>Order Successful</h2>
	<h5>Within 7 days your product will be delivered to your address</h5>
	<a href="index.jsp" class="btn btn-primary mt-3">Home</a>
	<a href="order.jsp" class="btn btn-danger mt-3">View Order</a>
</div>


<%@include file="allComponent/footer.jsp" %>
</body>
</html>