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



<form action="navigateMessagetwo" method="post" style="text-align:right">
<c:forEach var="cata" items="${msg_b}" >
<button type="submit" name="Contact Seller"  value="${cata.prod_ID}">
	Seller Reply: "${cata.seller_MSG}"<br>
    My Message: "${cata.buyer_MSG}"<br></button>
</c:forEach>	
</form>



		



<form action="LogOut" method="post" style="text-align:right">
		<input type="submit" name="Logout" value="Logout">
	</form>

</body>
</html>