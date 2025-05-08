<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit address</title>
<%@include file="allComponent/allCss.jsp" %>
</head>
<body style="background-color:#f0f1f2">
<%@include file="allComponent/navbar.jsp" %>
<div class="container">
	<div class="row">
		<div class="col-md-4 offset-md-4">
			<div class="card">
				<div class="card-body">
					<h4 class="text-center text-warning">Add Address</h4>
					<form action="">
						 <div class="form-row">
						   
						    <div class="form-group col-md-6">
						      <label for="inputAddress">Address</label>
						      <input type="text" class="form-control" id="inputAddress">
						    </div>
						    <div class="form-group col-md-6">
						      <label for="inputLandmark">Landmark</label>
						      <input type="text" class="form-control" id="inputLandmark">
						    </div>
						 </div>
						 <div class="form-row">
						   <div class="form-group col-md-4">
						      <label for="inputCity">City</label>
						      <input type="text" class="form-control" id="inputCity">
						    </div>
						    <div class="form-group col-md-4">
						      <label for="inputState">State</label>
						      <input type="text" class="form-control" id="inputState">
						    </div>
						      <div class="form-group col-md-4">
						      <label for="inputZipcode">Zipcode</label>
						      <input type="text" class="form-control" id="inputZipcode">
						    </div>
						 </div>
						 
						 <div class="text-center">
						 	<button class="btn btn-primary text-white">Save</button>
						 </div>
						 
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>