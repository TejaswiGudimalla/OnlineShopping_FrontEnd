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
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body>


<h4 align="center" style="text-color: lightgreen;"><a href="">Online Shopping</a></h4>


	<div class="container" style="padding-top: 25px">
		<c:forEach items="${IndividualProduct}" var="product">
			<h2>
				<c:out value="${product.name }" />
			</h2>
			<div class="col-xs-6 w3-animate-left">
				<div class="img">
					<img height="100px" width="100px" alt="${product.id }"
						src="<c:url value="/resources/images/${product.id }.jpg"></c:url>">
					<div class="desc"></div>
				</div>
			</div>

			<div class="col-xs-4 ">
				<div class="img">
					<div class="desc">
						<p>
						<div class="form-group">
							<input type="text" class="form-control" value="${product.name}"
								readonly="readonly">
						</div>

						<div class="form-group">
							<input type="text" class="form-control"
								value="Rs. ${product.price}" readonly="readonly"><br>
								<c:url var="action" value="/addtoCart/${userid}/${product.id}"></c:url>
								<form action="${action}" commandName="cart">
							<input type="submit" class="btn btn-success" value="Add To Cart" />
							</form>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>


</body>
</html>