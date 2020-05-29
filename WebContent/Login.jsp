<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	
	<div class="container-fluid">
	<div class="row">
	    <div class="col-sm-4" style="background-color:lavender; width:250px;">
	    </div>
	    <div class="col-sm-4" style="">
	    	<br>
	    	<h3 style="text-align: center;">Login</h3>
	    	<form action="LoginS">
			  <div class="form-group">
			    <label for="text">Username :</label>
			    <input type="text" name="uname" class="form-control" placeholder="Enter email" id="email">
			  </div>
			  <div class="form-group">
			    <label for="pwd">Password :</label>
			    <input type="password" name="pass" class="form-control" placeholder="Enter password" id="pwd">
			  </div>
			  <div class="form-group form-check">
			    <label class="form-check-label">
			      <input class="form-check-input" type="checkbox"> Remember me
			    </label>
			  </div>
			  <button type="submit" value="Login" class="btn btn-primary">Submit</button>
			</form>
			<br>
	    </div>
	    <div class="col-sm-4" style="background-color:lavender; width:250px;">
	    </div>
	  </div>
	  </div>
</body>
</html>