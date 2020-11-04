<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <title>Virtualmart user search</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body style="background-color:powderblue;">
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	%>
		<h1 style="text-align: center; font-family: Candara; background-color: white;">VirtualMart</h1>
			<h3 style="text-align: center; font-family: Candara;">Search</h3>
			<div class="form-group"
		style="text-align:right;">
		<form action="LogOut" method="post">
			<button type="submit" name="Logout" value="Logout"
				class="btn btn-primary">LogOut</button>
		</form>
	</div>
	<br>
	<pre> 
 </pre>
	<pre> 
</pre>
	<div class="container" style="padding-top: 5px">
		<form action="FetchAdDetails" method="post">
			<div class="form-group"
				style="text-align: center;">
				<input type="text" class="form-control" name="Prod_Name"
					placeholder="Enter a Product Name" required><br>
				<button type="submit" class="btn btn-primary">Submit</button>
			</div>
			<pre> 
 </pre>

			<pre> 

 </pre>
			<pre> 

 </pre>
			<pre> 

 </pre>
		</form>
	</div>
</body>
</html>