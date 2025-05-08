<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>EBook: Login</title>
<%@include file="allComponent/allCss.jsp" %>
</head>
<body style="background-color:#f0f1f2">
<%@include file="allComponent/navbar.jsp" %>
<div class="container p-2">
<div class="row mt-2">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<h4 class="text-center">Login</h4>

				<c:if test="${not empty failedMsg }">
					<h5 class="text-center text-danger">${failedMsg}</h5>
					<c:remove var="failedMsg" scope="session"/>
				</c:if>
				
				<c:if test="${not empty successMsg }">
					<h5 class="text-center text-success">${successMsg}</h5>
					<c:remove var="successMsg" scope="session"/>
				</c:if>

                 <form action="login" method="post">
                         <div class="form-group">
						    <label for="exampleInputEmail1">Email address</label>
						    <input type="email" class="form-control" required="required" name="email">
						 </div>

                        <div class="form-group">
						    <label for="exampleInputPassword1">Password</label>
						    <input type="password" class="form-control" required="required" name="password">
						  </div>

                        <div class="form-group form-check">
						    <input type="checkbox" class="form-check-input" name="check">
						    <label class="form-check-label" for="exampleCheck1">Check me out</label>
						  </div>

                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Login</button>
                            <br>
                            <a href="register.jsp">Create Account</a>
                        </div>
                    </form>

                    
</div>
</div>
</div>
</div>
</div>
<%@include file="allComponent/footer.jsp" %>
</body>

</html>