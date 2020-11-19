<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Edit Profile</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body style="background-color: powderblue;">
	<div>
		<h1	style="text-align: center; font-family: Candara; background-color: white;">Virtual MarketPlace</h1>
		<h3 style="text-align: center; font-family: Candara;">Edit your Profile</h3>
	</div>
	<form action="LogOut" method="post">
		<input type="submit" name="Logout" value="Logout">
	</form>
<%
 	String fname = (String) session.getAttribute("First_Name");
 	String lname = (String) session.getAttribute("Last_Name");
 	String uname = (String) session.getAttribute("User_Name");
 	long phn = (long) session.getAttribute("Phone_Number");
	String Emai = (String) session.getAttribute("Email");
	String up = (String) session.getAttribute("up");

%>
	<form action="editProfile" method="post">
		<div class="container" style="padding-top: 1px">
			<label for="First_Name">Enter First Name :</label> <input type="text"
				class="form-control" name="updFirst_Name"
				value="<%= fname %>" required>
		</div>
		<div class="container" style="padding-top: 5px">
			<label for="Last_Name">Enter Last Name :</label> <input type="text"
				class="form-control" name="updLast_Name"
				value="<%= lname %>" required>
		</div>
		<div class="container" style="padding-top: 5px">
			<label for="User_Name">Enter User Name :</label> <input type="text"
				class="form-control" name="updUser_Name"
				value="<%= uname %>" required>
		</div>
		<div class="container" style="padding-top: 5px">
			<label for="Email">Enter Email :</label> <input type="text"
				class="form-control" name="updEmail" value="<%= Emai %>" required>
		</div>

		<div class="container" style="padding-top: 5px">
			<label for="Phone_Number">Enter Phone Number :</label> <input
				type="tel" class="form-control" name="updPhone_Number" value="<%= phn %>"
				required/>
		</div>
				<div class="container" style="padding-top: 5px">
			<label for="User_Name">Enter User Name :</label> <input type="text"
				class="form-control" name="updUser_Name"
				value="<%= uname %>" required>
		</div>
				<div class="container" style="padding-top: 5px">
			<label for="up">Change the Password :</label> <input type="password"
				class="form-control" name="updup" value="<%= up %>" required>
		</div>
		<br>
	<button type="submit"  class="btn btn-primary" onclick="window.location.href='/VMart/UserResponse.jsp'">Update</button>
	</form>
	
</body>
</html>