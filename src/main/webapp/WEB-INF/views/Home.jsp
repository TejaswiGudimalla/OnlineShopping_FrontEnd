<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-inverse" style="background-color: lightgreen" role="navbar-fixed-top">
	<div class="container-fluid">
		 <div class="navbar-header">
          <a class="navbar-brand" href="">Online Shopping</a>
          <ul class="nav navbar-nav">
           <li class="dropdown">
               <a class="dropdown-toggle" data-toggle="dropdown" href="${CategoryList}">Categories
               <span class="caret"></span></a>
                <ul class="dropdown-menu">
                 <li class="navbar-nav">
				   <c:forEach items="${CategoryList}" var="category" >
				    <a href="navproducts/${category.id}"><c:out value="${category.name}" /></a>
				   </c:forEach>
				 </li>
                </ul>
            </li>
          </ul>
          </div>
       
       <style>
       #srch-term
        {
	     position: relative;
	     width: 650px;
	     height: 35px;
        }
        .input-group-btn
        {
         height:35px;
        }
       </style>   
          
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
	
		<c:forEach items="${ProductList}" var="product">
		<!--  <div class="row"> -->
     <div class="col-xs-3" class="thumbnail">
 	 			 
	<a href="ShowProduct/${product.id}" > <img height="275px" width="150px" alt="${product.id }"
	src="<c:url value="/resources/images/${product.id }.jpg"></c:url>"></a>
  <div class="desc">
          Name : <c:out value="${product.name }"/><br>
          Price : <c:out value="${product.price }"/>
   <c:url var="action" value="addtocart/${product.id}"></c:url>
   <form action="${action}" commandName="cart">
   <input type="submit" class="btn btn-primary" value="Add To Cart" />
   </form>
							</div>
							</div>	
							</c:forEach>
							
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
	
	
</body>
</html>