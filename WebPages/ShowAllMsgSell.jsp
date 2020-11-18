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

<form action="navigateMessageSeller" method="post">
<c:forEach var="cata" items="${msg_b}" >
<button type="submit" name="Message_ID"  value="${cata.message_ID}">
	Buyer Message: "${cata.buyer_MSG}"<br>
	My Reply: "${cata.seller_MSG}"<br>
   </button>
</c:forEach>	
</form>
<form action="LogOut" method="post" style="text-align:right">
		<input type="submit" name="Logout" value="Logout">
	</form>

</body>
</html>