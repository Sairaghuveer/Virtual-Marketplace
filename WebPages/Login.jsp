<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Log In</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body  style="background-color:powderblue;">
	<div>
		<h1	style="text-align: center; font-family: Candara;">Virtual MarketPlace</h1>
		<h3	style="text-align: center; font-family: Candara;">Please Log-in to continue</h3>
	</div>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	%>
	<div class="container" style="padding-top: 20px">
      
		<form action="LoginTest" method="post">
			<div class="form-group" >			
				<input type="text" class="form-control" name="User_Name" placeholder="UserName">
			</div>
			<div class="form-group">
			<input type="password" class="form-control" name="User_Pass" placeholder="Password">
			</div>
			<div style="text-align:center">
			<button type="submit" name="Submit" class="btn btn-primary" value="Submit">Submit</button>
			</div>
			<br><br>
				<div style="text-align:center">
			<button type="submit" name="Register" class="btn btn-primary" value="Register">Register</button>
			</div>
			
		</form>
		</div>  
</body>
</html>