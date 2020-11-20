<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
Your Ad has been deleted successfully

<form action="LogOut" method="post" style="text-align:right">
		<input type="submit" name="Logout" value="Logout">
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