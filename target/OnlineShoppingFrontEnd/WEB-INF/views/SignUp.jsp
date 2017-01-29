<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width = device-width, initial-scale = 1">
<title>Home Page</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/Login.css"/>">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


</head>

<body>
	<fieldset>
		<div class="container">
			<div class="row vertical-offset-100">
				<div class="col-md-4 col-md-offset-4">
					<div class="panel panel-default">
						<div class="panel-heading">
							<center>
								<h1 class="panel-title">Enter the following details to
									Register</h1>
							</center>
						</div>

						<div class="panel-body">
							<c:url var="action" value="adduser"></c:url>
							<form action="${action }" modelAttribute="User">
								<fieldset>
									<div class="form-group">
										<input class="form-control" placeholder="Name" name="name"
											type="text">
									</div>
									<div class="form-group">
										<input class="form-control" placeholder="Username"
											name="username" type="text">
									</div>
									<div class="form-group">
										<input class="form-control" placeholder="Set Password"
											name="password" type="password">
									</div>
									<div class="form-group">
										<input class="form-control"
											placeholder="mail id(ex: name@os.com)" name="mail_id"
											type="text">
									</div>
									<div class="form-group">
										<input class="form-control" placeholder="mobile number"
											name="mobilenumber" type="text">
									</div>
									<input class="btn btn-lg btn-success btn-block" type="submit"
										value="Submit">
								</fieldset>
							</form>
						</div>
	</fieldset>
	${registered}
</body>
</html>