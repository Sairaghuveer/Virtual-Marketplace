<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<title>Please enter AD details</title>
</head>
<body style="background-color: powderblue;">
	<% 
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>
	<h1 style="text-align: center; font-family: Candara; background-color: white;">VirtualMart</h1>
	<form action="LogOut" method="post" style="text-align: right">
		<br> <input type="submit" name="Logout" value="Logout">
	</form>
		<form action="Postlisting" method="Post" style="text-align: justify">
		Welcome ${UserID}, Please Enter Product Details
		<div class="container" style="padding-top: 1px">
			<label for="product_name">Enter product name :</label> <input
				type="text" name="Prod_Name" class="form-control"><br>
		</div>
		<div class="container" style="padding-top: 1px">
			<label for="product_description">Enter Product description: </label>
			<input type="text" name="Prod_Description" class="form-control"><br>
		</div>
		<div class="container" style="padding-top: 1px">
			<label for="product_price">Enter Product Price: </label> <input
				type="number" name="Prod_Price" class="form-control"><br>
		</div>
		<div class="container" style="padding-top: 1px">
			<label for="category_name">Select the Category: </label> <select
				name="Category_Name" class="form-control" >
				<option value="category">Choose</option>
				<option value="automobiles_bikes">automobiles bikes</option>
				<option value="electronics">electronics</option>
				<option value="real estate">real estate</option>
				<option value="furniture">furniture</option>
				<option value="books">books</option>
				<option value="others">others</option>
			</select><br>
		</div>
		<div class="container" style="padding-top: 1px">
			<label for="location">Enter location</label> <select
				name="Loc_ID" class="form-control">
				<option value="Montreal">Montreal</option>
				<option value="Laval">Laval</option>
				
					</select><br>
		</div>
		<div class="container" style="padding-top: 1px">
			<label for="item_condition">Select the item condition: </label> <select
				name="Item_Condition_ID" class="form-control">
				<option value="New">New</option>
				<option value="Used">Used</option>
			</select><br>
		</div>
		<input type="submit" value="Post" style="text-align: ceter">
	</form>
</body>
</html>
