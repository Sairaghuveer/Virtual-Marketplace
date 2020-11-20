<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<title>Profile Info</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body style="background-color: powderblue;">
	<div>
		<h1
			style="text-align: center; font-family: Candara; background-color: white;">Virtual
			MarketPlace</h1>
		<h3 style="text-align: left; font-family: Candara;">View your
			profile information here</h3>
	</div>
	<form action="LogOut" method="post">
		<input type="submit" name="Logout" value="Logout">
	</form>

	<!-- Write the code to initiate the servlet -servlet name = profileInfo.java -->
			<br> First Name: ${First_Name}; 
			<br> Last Name:	${Last_Name}; 
			<br> Phone Number: ${Phone_Number}; 
			<br>Email: ${Email};
			<br> Gender: ${Gender}; 
			<br> User_Name:	${User_Name};
	<br>
<button onclick="window.location.href='/Second/editProfile.jsp'">Edit Profile</button>
</body>
</html>



