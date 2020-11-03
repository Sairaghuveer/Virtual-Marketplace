<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

Your Ad has been successfully posted  <br>
Name of the Product: ${ProductName}; <br>
Description of the product: ${Prod_Description}; <br>
Item Condition: ${Item_Condition_ID}; <br>
Location: ${Loc_ID}; <br>


<% 
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>
<form action="LogOut" method = "post">				
 				<input type="submit" name="Logout" value="Logout">			
</form>

</body>
</html>