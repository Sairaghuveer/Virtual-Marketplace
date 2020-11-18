<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form action="messageDispBuyer" method="post">
<c:forEach var="cata" items="${MsgB}" >
<button type="submit" name="Prod_ID"  value="${cata.prod_ID}">

	User_Name: "${cata.user_Name}"<br>
    Prod_Name: "${cata.prod_Name}"<br></button>
</c:forEach>	
</form>
   
     <form action="LogOut" method="post" style="text-align:right">
		<input type="submit" name="Logout" value="Logout">
	</form>
	
	
</body>
</html>