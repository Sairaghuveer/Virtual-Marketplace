<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home page</title>
<style>
.container {
	height: 200px;
	position: relative;
	border: 3px solid green;
}
.center {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 200px;
	border: 3px solid green;
}
.wrapper {
	text-align: center;
}
.button {
	position: absolute;
	top: 50%;
}
}
</style>
</head>
<body style="background-color: powderblue;">
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	%>
		<h1 style="text-align: center; font-family: Candara; background-color: white;">VirtualMart - A online Marketplace for every product</h1>
			<form action="LogOut" method="post">
		<div style="text-align:right">
			<input type="submit" name="Logout" value="Logout">
		</div>
	</form>
	<form action="UserSelect" method="post" style="text-align:center">
		<div>
			To post an Ad for selling your product - 
			<button type="submit" name="Post an Ad" value="Post an Ad" style="text-align: center"
				class="btn btn-primary">Post an Ad</button>
			<br><br>
			To browse available listings - 
			<button type="submit" name="AdBrowse"  value="AdBrowse" style="text-align: center"
				class="btn btn-primary">AdBrowse</button>
			<br><br>
		</div>
	</form>
</body>
</html>