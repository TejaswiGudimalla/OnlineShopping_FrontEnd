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

	<div id="cart">
		<div class="container" style="padding-top:25px;">
			<div class="row">
				<div class="col-xs-1"></div>
				<div class="col-xs-10">
					<div class="panel panel-success ">
						<div class="panel-heading">
							<div class="panel-title">
								<div class="row">
									<div class="col-xs-6">
										<li><a href=""
											style="text-transform: capitalize; font-weght: bold;"><sec:authentication
													property="principal.username" />'s cart ${emptycart}</a></li>

									</div>
									<div class="col-xs-1"></div>
								</div>
							</div>
						</div>
						<div class="panel-body">
							<div class="row"
								style="text-transform: capitalize; font-weight: bold; text-align: center;">

								<div class="col-xs-5">
									<label class="form-control input-sm">Product Details</label>
								</div>

								<div class="col-xs-2">
									<label class="form-control input-sm">Price</label>
								</div>

								<div class="col-xs-4">
									<div class="col-xs-6">
										<label class="form-control input-sm">Quantity</label>
									</div>
									<div class="col-xs-6">
										<label class="form-control input-sm">Update</label>
									</div>
								</div>

								<div class="col-xs-1">
									<label class="form-control input-sm">Delete</label>
								</div>
							</div>
							<hr>
							<c:if test="${!empty CartList}">
								<c:forEach items="${CartList}" var="cart">
									<div class="row">
										<div class="col-xs-5">
											<div class="col-xs-6">
												<a href="IndividualItem/${cart.productid}"> <img
													height="72px" width="72px" alt="${cart.productid}"
													src="<c:url value="/resources/images/${cart.productid}.jpg"></c:url>">
												</a>
											</div>
											<div class="col-xs-6" style="padding-top: 22px">
												<label class="form-control input-sm">${cart.productname}</label>
											</div>
											</div>
											<div class="col-xs-2 text-right" style="padding-top: 22px">
												<label class="form-control input-sm">${cart.price}</label>
											</div>

											<div class="col-xs-4" style="padding-top: 22px">
												<form action="editorder/${cart.id}">
													<div class="col-xs-6">
														<input type="text" class="form-control input-sm"
															value="${cart.quantity}" name="quantity">
													</div>
													<div class="col-xs-6">
														<button type="submit"
															class="btn btn-default btn-sm btn-block">Update</button>
													</div>

												</form>
											</div>

											<div class="col-xs-1" style="padding-top: 22px">
												<a href="delete/${cart.id}" class="form-control input-sm"><span
													class="glyphicon glyphicon-trash"> </span></a>
											</div>
										</div>
										<hr>
								</c:forEach>
							</c:if>
						</div>
						<div class="panel-footer">
							<div class="row text-center">
								<div class="col-xs-3">
									<a href="" class="btn btn-success btn-block">Continue
										Shopping</a>
								</div>
								<c:if test="${empty EmptyCart}">
									<div class="col-xs-6">
										<h4 class="text-right">Total : Rs ${cartprice}</h4>
									</div>

									<%-- <form action="placeorder"> --%>
									<div class="col-xs-3">
										<form action="placeorder">
											<a href=checkoutFlow class="btn btn-success btn-block">
												Checkout</a>
										</form>
									</div>

									<%-- </form> --%>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--  -->
		<c:choose>
			<c:when test="${IfPaymentClicked}">
				<c:import url="/WEB-INF/views/CartProducts.jsp"></c:import>
			</c:when>
		</c:choose>
</body>
</html>