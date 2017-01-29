<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<title>Admin Page</title>
<body >
</head>
<body>
<nav class="navbar navbar-inverse" style="background-color: lightgreen" role="navbar-fixed-top">
<div class="container-fluid">
  <ul class="navbar-nav">
    <li><a class="navbar-brand" href="Home">Logo with Name</a>
    <li><a class="navbar-brand" href="Supplier">Supplier</a></li>
    <li><a class="navbar-brand" href="Product">Product</a></li>
    <li><a class="navbar-brand" href="Category">Category</a></li>
  </ul>
  <ul class="nav navbar-nav navbar-right" style="margin-bottom:-2px;"> 
    <li><a href="Home">CONTACT US</a></li>  
    <li><a href="perform_logout"><span class="glyphicon glyphicon-log-out"></span>LOGOUT</a></li>    
  </ul>
</nav>

<!-- ${msg}
${msg1 }!> -->
<h1>Welcome Admin </h1>

<%-- <c:if test="${showSupplierpage}">
    <jsp:include page="Supplier.jsp"></jsp:include></c:if> --%>

<c:choose>
<c:when test="${showSupplierpage}">
<c:import url="/WEB-INF/views/Supplier.jsp"></c:import>
</c:when>
</c:choose>

<c:choose>
<c:when test="${showProductpage}">
<c:import url="/WEB-INF/views/Product.jsp"></c:import>
</c:when>
</c:choose> 
<c:choose>
<c:when test="${showCategory}">
<c:import url="/WEB-INF/views/Category.jsp"></c:import>
</c:when>
</c:choose>
<c:choose>
<c:when test="${UserClickedContactUs}">
<c:import url="/WEB-INF/views/Login.jsp"></c:import>
</c:when>
</c:choose>
<c:choose>
<c:when test="${Clickedcatproduct}">
<c:import url="/WEB-INF/views/CartProducts.jsp"></c:import>
</c:when>
</c:choose>

<div class="ng-view"></div>

</body>
</html>