<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page isELIgnored="false" %>
<div class="container-fluid" style="height:10px; background-color:#303f9f"></div>

<div class="container-fluid p-3 bg-light">

	<div class="row">

		<div class="col-md-3 text-success">
			<h3> <i class="fas fa-book"></i>EBooks</h3>
		</div>
		<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0">
      			<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
     	 		<button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
    		</form>
		</div>
		
		<c:if test="${not empty userobj }">
			<div class="col-md-3">
				<a href="checkOut.jsp"><i class="fas fa-cart-plus fa-2x"></i></a>
				<a href="login.jsp" class="btn btn-success text-white"><i class="fas fa-user-plus"></i> ${userobj.name}</a>
				<a href="logout" class="btn btn-primary text-white"><i class="fas fa-sign-in-alt"></i> Logout</a>
			</div>
		</c:if>
		
		<c:if test="${empty userobj}">
			<div class="col-md-3">
			<a href="login.jsp" class="btn btn-success text-white"><i class="fa-solid fa-right-to-bracket"></i> Login</a>
			<a href="register.jsp" class="btn btn-primary text-white"><i class="fa-solid fa-user-plus"></i> Register</a>
		</div>
		</c:if>
		
	
	</div>
</div>


<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
  <a class="navbar-brand" href="#"><i class="fa-solid fa-house"></i></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp"> Home</a>
      </li>
        <li class="nav-item active">
        <a class="nav-link" href="allRecentBook.jsp"><i class="fa-solid fa-book-open"></i> Recent Book</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="allNewBook.jsp"><i class="fa-solid fa-book-open"></i> New Book</a>
      </li>
     
      <li class="nav-item active">
        <a class="nav-link" href="allOldBook.jsp"><i class="fa-solid fa-book"></i> Old Book</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      
      <a href="settings.jsp" class="btn text-white my-2 my-sm-0" type="submit" style="text-decoration:none;"><i class="fa-solid fa-gear"></i> Settings</a>
     <!--   <button class="btn my-2 my-sm-0 ml-1" type="submit"><i class="fa-solid fa-square-phone"></i> Contact Us</button> -->
     <a href="contact.jsp" class="btn my-2 my-sm-0 ml-1 text-white"><i class="fa-solid fa-square-phone"></i> Contact Us</a>
     
    </form>
  </div>
</nav>