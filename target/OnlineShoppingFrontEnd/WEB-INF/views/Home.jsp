<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width = device-width, initial-scale = 1">
<title>Home Page</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.min.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/css/HomeStyle.css"/>">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
	<nav class="navbar navbar-inverse" style="background-color: lightgreen"
		role="navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-nav">
			<li><a class="navbar-brand" href="Home">OnlineShopping</a>
		</div>
		<div class="navbar-nav">
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="Category">Categories <span
					class="caret"></span></a>
				<ul class="dropdown-menu">
					<li>
					 <c:forEach items="${CategoryList}" var="category" ><a
						href="navproducts/${category.id}"><c:out value="${category.name}" />
					</a>
					</c:forEach>
					</li>
		</div>
		<div class="navbar-nav">
			<li><a class="navbar-brand" href="ShowProduct">Products</a>
				</ul></li>
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
				<li><a class="navbar-brand" href="Cart" class="btn btn-info"><span
						class="glyphicon glyphicon-shopping-cart"></span>Cart</a></li>
				<li><a class="navbar-brand"
					href="<c:url value="/perform_logout"/>" class="btn btn-info"><span
						class="glyphicon glyphicon-log-out"></span>Logout</a></li>
			</sec:authorize>
			<sec:authorize access="!isAuthenticated()">
				<li><a class="navbar-brand" href="Login" class="btn btn-info"><span
						class="glyphicon glyphicon-log-in"></span>Login</a></li>
				<li><a class="navbar-brand" href="SignUp" class="btn btn-info"><span
						class="glyphicon glyphicon-user"></span>Sign Up</a></li>
			</sec:authorize>
		</div>
	</div>
	</nav>
	
	<div class="container">		
		<c:forEach items="${productList}" var="product">
			<tr>
				<td>
					<!-- --<div class="thumbnail">-->
					<div class="col-md-4">
						<a href="ShowProduct/${product.id}"> <img height="150px"
							width="150px" alt="${product.id }"
							src="<c:url value="/resources/images/${product.id }.jpg"></c:url>"></a>
						<td><c:url var="action" value="addtocart/${product.id}"></c:url>
							<form:form action="${action}" modelAttribute="cart">
								<td id="td1"><c:out value="${product.name}" /><br>
								<td id="td1"><c:out value="${product.price}" /> <input
									type="submit" class="btn btn-primary" value="Add To Cart" /><br>
							</form:form></td>
						<br>
					</div>
			</tr>
			</td>
		</c:forEach>
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
			<jsp:include page="Login.jsp"></jsp:include>
		</c:if>

		<c:if test="${showsignup}">
			<jsp:include page="SignUp.jsp"></jsp:include></c:if>

		<c:if test="${showCategory}">
			<jsp:include page="Category.jsp"></jsp:include></c:if>

		<c:if test="${showProductpage}">
			<jsp:include page="Product.jsp"></jsp:include></c:if>

		<c:if test="${showadminPage}">
			<jsp:include page="Admin.jsp"></jsp:include></c:if>

		<c:if test="${Clickedcatproduct}">
			<jsp:include page="CartProducts.jsp"></jsp:include></c:if>

		<c:choose>
			<c:when test="${Clickedshowproduct}">
				<c:import url="/WEB-INF/views/ShowProduct.jsp"></c:import>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${Clickedcartproduct}">
				<c:import url="/WEB-INF/views/CartProducts.jsp"></c:import>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${addtocart}">
				<c:import url="/WEB-INF/views/Cart.jsp"></c:import>
			</c:when>
		</c:choose>
	
	
</body>
</html>