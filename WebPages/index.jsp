<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <title>VirtualMart Sign Up</title>
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
	<div>
		<h1	style="text-align: center; font-family: Candara; background-color: white;">Virtual MarketPlace</h1>
		<h3	style="text-align: center; font-family: Candara;">Sign Up</h3>
	</div>
<form action="Simple" method = "post">
<div class="container" style="padding-top:1px">

	<label for="First_Name" >Enter First Name :</label>
	<input type="text" class="form-control" name="First_Name" placeholder="Enter Your First Name" required>
	 </div>	
	 <div class="container" style="padding-top:5px">
	<label for="Last_Name" >Enter Last Name :</label>
	<input type="text" class="form-control" name="Last_Name" placeholder="Enter Your Last Name" required>
	 </div>	
	  <div class="container" style="padding-top:5px">
	<label for="User_Name" >Enter User Name :</label>
	<input type="text" class="form-control" name="User_Name" placeholder="Enter Your UserName" required>
	 </div>	
	  <div class="container" style="padding-top:5px">
	<label for="Email" >Enter Email :</label>
	<input type="text" class="form-control" name="Email" placeholder="Enter Your Email" required>
	 </div>	
	   <div class="container" style="padding-top:5px">
	<label for="Email" >Enter Password :</label>
	<input type="password" class="form-control" name="User_Pass" placeholder="Enter Your Password" required>
	 </div>	
	  <div class="container" style="padding-top:5px">
	<label for="Gender" >Select Gender:</label>
		<select class="form-control" name="Category_Name" required>
							<option value="Male">Male</option>
									 <option value="Female">Female</option>
									 <option value="Other">Other</option></select>
	 </div>	
	  <div class="container" style="padding-top:5px">
	<label for="Phone_Number" >Enter Phone Number :</label>
	<input type="tel" class="form-control" name="Phone_Number" placeholder="Enter Your Phone Number" required>
	 </div>	
	 <br>
	<div style="text-align:center">		
 	<button type="submit" class="btn btn-primary">Submit</button>
 	</div>
</form>
</body>
</html>
