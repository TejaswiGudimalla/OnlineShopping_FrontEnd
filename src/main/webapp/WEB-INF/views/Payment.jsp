<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  footer {
    
    margin-top: 100px;
    
} 
body {
width:100%;
}
  </style>
</head>
<body  style="background-color:#ffffff;">
   
  <br><br>
  <br><br>
  <br>
  <br>
   <div class="container">
  <div class="row col-xs-4"></div>
  <div class="col-xs-4">
  <div class="panel panel-primary">
     <div class="panel-heading">
   
      <div class="row">
       <h3 class="panel-title " style="padding-left: 20px">Select Payment type</h3>
       
      </div>
     </div>
     <div class="panel-body">
<form method="post" action="${flowExecutionUrl}">
        <input type="hidden" name="_eventId" value="method">
        <input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}" />
      <input type="radio" name="method" value="cashOnDelivery">  Cash On Delivery<br><br>
     <input type="radio" name="method" value="card">  Banking <br><br>
         <button class="btn btn-success btn-sm btn-block" type="submit">Proceed</button>  
        </form>
        </div>
        </div>
        </div>
        </div>
        <br><br><br><br><br><br>
        
</body>
</html>