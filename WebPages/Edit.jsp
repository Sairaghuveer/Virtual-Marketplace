<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
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
<title>Please edit AD details</title>
</head>
<body style="background-color: powderblue;">

	<h1 style="text-align: center; font-family: Candara; background-color: white;">VirtualMart</h1>
	<form action="LogOut" method="post" style="text-align: right">
		<br> <input type="submit" name="Logout" value="Logout">
	</form>
		<form action="PostEditedListing" method="Post" style="text-align: justify">
		Welcome ${UserID}, Please Edit Product Details
		<div class="container" style="padding-top: 1px">
			<label for="product_name">Enter product name :</label> <input
				type="text" name="Prod_Name"  contentEditable="true" value="${Edit.prod_Name}"><br>
		</div>
		<div class="container" style="padding-top: 1px">
			<label for="product_description">Enter Product description: </label>
			<input type="text" name="Prod_Description" contentEditable="true" value="${Edit.prod_Description}"><br>
		</div>
		<div class="container" style="padding-top: 1px">
			<label for="product_price">Enter Product Price: </label> <input
				type="number" name="Prod_Price" contentEditable="true" value="${Edit.prod_Price}"><br>
		</div>
		<div class="container" style="padding-top: 1px">
			<label for="category_name">Select the Category: </label> <select
				name="Category_Name" contentEditable="true" id="${Edit.category_Name}" >
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
			<label for="location">Enter location</label> 
			<select name="Loc_ID" contentEditable="true" id="${Edit.loc_ID}">
				<option value="Montreal">Montreal</option>
				<option value="Laval">Laval</option>
				
					</select><br>
		</div>
		<div class="container" style="padding-top: 1px">
			<label for="item_condition">Select the item condition: </label> <select
				name="Item_Condition_ID" contentEditable="true" id="${Edit.item_Condition_ID}">
				<option value="New">New</option>
				<option value="Used">Used</option>
			</select><br>
		</div>
		<div class="container" style="padding-top: 1px">
		<label for="Prod_ID">Your Product ID is </label>
		<input type="text" name="Prod_ID" value="${Edit.prod_ID}" readonly>
		</div>
		<input type="submit" value="Post" style="text-align: ceter">
	</form>
</body>
</html>
