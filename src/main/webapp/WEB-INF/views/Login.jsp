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

<h4 align="center" style="text-color: lightgreen;"><a href="">Online Shopping</a></h4>

<div class="container" style="padding-top: 25px">
    <div class="row vertical-offset-100">
      <div class="col-md-4 col-md-offset-4">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 align="center" class="panel-title">Login</h3>
          </div>
          
<div class="panel-body">
<form action="perform_login" method="post" role="form">
                    <fieldset>
                <div class="form-group">
                  <input class="form-control" placeholder="Username" name="username" type="text">
                </div>
              
              <div class="form-group">
                <input class="form-control" placeholder="Password" name="password" type="password" >
              </div>
            
              <div class="checkbox">
                  <label>
                    <input name="remember" type="checkbox" value="Remember Me"> Remember Me
                  </label>
                  <button id="login_lost_btn" type="button" class="btn btn-link">Forgot Password?</button>
              </div>
   
              <input class="btn btn-lg btn-success btn-block" type="submit" value="Login">
                    </fieldset>
</form>
</div>

<form id="lost-form" style="display:none;">
              <div class="form-group">
                <div id="div-lost-msg">
                  <div id="icon-lost-msg" class="glyphicon glyphicon-chevron-right">
                  </div>
                  <span id="text-lost-msg">Type your e-mail.</span>
                </div>
                <input id="lost_email" class="form-control" type="text" placeholder="E-Mail" required>
              </div>
              <div>
                <button type="submit" class="btn btn-primary btn-lg btn-block">Submit</button>
              </div>
              <div>
                <button id="lost_login_btn" type="button" class="btn btn-link">Log In</button>
              </div>
</form>
          
        </div>
      </div>
    </div>
</div>
</body>
</html>