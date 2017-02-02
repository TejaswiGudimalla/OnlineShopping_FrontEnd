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
 <title>Home</title>
 </head>
<body>

	<fieldset>
		<div class="container">
			<div class="row vertical-offset-100">
				<div class="col-md-4 col-md-offset-4">
					<div class="panel panel-default">
						<div class="panel-heading">
							<center>
								<h1 class="panel-title">Enter your address details here</h1>
							</center>
						</div>

						<div class="panel-body">
							<%-- <c:url var="action" value="adduser"></c:url>
							<form action="${action }" modelAttribute="User"> --%>
							
								<fieldset>
									<div class="form-group">
										<input class="form-control" placeholder="Name" name="name"
											type="text">
									</div>
									<div class="form-group">
										<input class="form-control" placeholder="D.No/Flat No."
											name="D.No/Flat No." type="text">
									</div>
									<div class="form-group">
										<input class="form-control" placeholder="Street"
											name="Street" type="text">
									</div>
									<div class="form-group">
										<input class="form-control"
											placeholder="City" name="City"
											type="text">
									</div>
									<div class="form-group">
										<input class="form-control" placeholder="state"
											name="state" type="text">
									</div>
									<div class="form-group">
										<input class="form-control" placeholder="pincode"
											name="pincode" type="text">
									</div>
									
									<div class="row">
                                       <div class="col-xs-6 col-md-6">
                                       <form method="post" action="${flowExecutionUrl}">
                              <input type="hidden" name="_eventId" value="continue"/>
                              <input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}" />
                                       <button class="btn btn-success btn-sm btn-block" type="submit">Continue</button>  
                                       </form>
                                       </div>
                                       <div class="col-xs-6 col-md-6">
                                       <form method="post" action="${flowExecutionUrl}">
                              <input type="hidden" name="_eventId" value="cancel"/>
                              <input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}" />
                                       <button class="btn btn-success btn-sm btn-block" type="submit">Cancel</button>  
                                       </div>
                                    </div>
								</fieldset>
							
						</div>
	</fieldset>
	
</body>
</html>