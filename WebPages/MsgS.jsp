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

<!--  <form action="messageDispSeller" method="post">-->
		
<!-- <button type="submit" name="Prod_ID"  value="${cata.prod_ID}">-->
<c:forEach var="cata" items="${MsgS}" >
<a href="http://localhost:8080/Second/messageDispSeller?Prod_ID=${cata.prod_ID}&User_Name=${cata.user_Name}">

	User_Name: "${cata.user_Name}"
    Prod_Name: "${cata.prod_Name}"<br>
			
	</a>
	</c:forEach>
<!--</form>-->
   
     <form action="LogOut" method="post" style="text-align:right">
		<input type="submit" name="Logout" value="Logout">
	</form>


</body>
</html>