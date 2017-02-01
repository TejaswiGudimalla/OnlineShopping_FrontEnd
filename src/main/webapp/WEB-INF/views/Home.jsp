<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script
	src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Home</title>
</head>
<style>

#srch-term {
	position: relative;
	width: 650px;
	height: 35px;
}

.input-group-btn {
	height: 35px;
}

.navbar{
background-color:lightgreen;
margin-bottom: 0;
border-radius: 0;
}

.carousel-inner img {
      width: 100%; /* Set width to 100% */
      margin: auto;
      height:100px;
  }
  
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; 
    }
</style>


<body>

	<nav class="navbar navbar-inverse" class="navbar-fixed-top" role="active">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="">Online Shopping</a>
			<ul class="nav navbar-nav" class="navbar-brand">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="${CategoryList}">Categories <span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="navbar-nav">
						<li class="navbar-nav"><c:forEach items="${CategoryList}"
								var="category">

								<a href="navproducts/${category.id}"><c:out
										value="${category.name}" /></a>
							</c:forEach></li>
					</ul></li>
			</ul>
		</div>

		<form class="navbar-form navbar-left" role="search">
			<div class="form-group">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="Search"
						name="srch-term" id="srch-term">
					<div class="input-group-btn">
						<button class="btn btn-default" type="submit">
							<i class="glyphicon glyphicon-search"></i>
						</button>
					</div>
				</div>
			</div>
		</form>

		<div class="navbar-nav navbar-right">
			<sec:authorize access="isAuthenticated()">
				<li><a class="navbar-brand" href="Cart"><span
						class="glyphicon glyphicon-shopping-cart" class="btn btn-info"></span>Cart</a></li>
				<li><a class="navbar-brand"
					href="<c:url value="/perform_logout"/>" class="btn btn-info"><span
						class="glyphicon glyphicon-log-out"></span>Logout</a></li>
			</sec:authorize>
			<sec:authorize access="!isAuthenticated()">
				<li><a class="navbar-brand" href="Login"><span
						class="glyphicon glyphicon-log-in" class="btn btn-info"></span>Login</a></li>
				<li><a class="navbar-brand" href="SignUp" class="btn btn-info"><span
						class="glyphicon glyphicon-user"></span>Sign Up</a></li>
			</sec:authorize>
		</div>
	</div>
	</nav>

	<sec:authorize access="isAuthenticated()">
		<c:forEach items="${ProductList}" var="product">
			<!--  <div class="row"> -->
			<div class="col-xs-3" class="thumbnail" style="padding-top: 25px">

				<a href="ShowProduct/${product.id}"> <img height="275px"
					width="150px" alt="${product.id }"
					src="<c:url value="/resources/images/${product.id }.jpg"></c:url>"></a>
				<div class="desc">
					Name :
					<c:out value="${product.name }" />
					<br> Price :
					<c:out value="${product.price }" />
					<c:url var="action" value="/addtoCart/${userid}/${product.id}"></c:url>
					<form action="${action}" commandName="cart">
						<input type="submit" class="btn btn-primary" value="Add To Cart" />
					</form>
				</div>
			</div>
		</c:forEach>
	</sec:authorize>
	
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
    <li data-target="#myCarousel" data-slide-to="3"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="F:\workspace\OnlineShopping_FrontEnd\src\main\webapp\resources\images\sale.jpg" alt="sale" width="600" height="200">
    </div>

    <div class="item">
      <img src="F:\workspace\OnlineShopping_FrontEnd\src\main\webapp\resources\images\bookshelf.jpg" alt="bookshelf" width="600" height="200">
    </div>

    <div class="item">
      <img src="F:\workspace\OnlineShopping_FrontEnd\src\main\webapp\resources\images\phones.jpg" alt="phones" width="600" height="200">
    </div>

    <div class="item">
      <img src="F:\workspace\OnlineShopping_FrontEnd\src\main\webapp\resources\images\shoes.jpg" alt="shoes" width="600" height="200">
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
	
	<div class="ng-view"></div>
	<script>
		var app = angular.module("myApp", [ "ngRoute" ]);
		app.config(function($routeProvider) {
			$routeProvider.when("/", {
				templateUrl : "Home"
			}).when("/Login", {
				templateUrl : "Login"
			}).when("/SignUp", {
				templateUrl : "SignUp"
			});
		});
	</script>

	<c:if test="${UserClickedLogin}">
		<jsp:include page="Login.jsp"></jsp:include></c:if>

	<c:choose>
		<c:when test="${UserClickedLogin}">
			<c:import url="/WEB-INF/views/Login.jsp"></c:import>
		</c:when>
	</c:choose>

	<c:choose>
		<c:when test="${showsignup}">
			<c:import url="/WEB-INF/views/SignUp.jsp"></c:import>
		</c:when>
	</c:choose>

	<c:choose>
		<c:when test="${addtocart}">
			<c:import url="/WEB-INF/views/Cart.jsp"></c:import>
		</c:when>
	</c:choose>

	<c:choose>
		<c:when test="${Clickedcartproduct}">
			<c:import url="/WEB-INF/views/CartProducts.jsp"></c:import>
		</c:when>
	</c:choose>

	<c:choose>
		<c:when test="${UserClickedshowproduct}">
			<c:import url="/WEB-INF/views/ShowProduct.jsp"></c:import>
		</c:when>
	</c:choose>
	<script>
		$(document).ready(function() {
			$('.dropdown a.test').on("click", function(e) {
				$(this).next('ul').toggle();
				e.stopPropagation();
				e.preventDefault();
			});
		});
	</script>

</body>
</html>