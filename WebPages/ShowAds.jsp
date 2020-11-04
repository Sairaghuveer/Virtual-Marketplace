<%@page import="databasetojava.DisplayInfo"%>
<%@page import="databasetojava.FetchAdConnect"%>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title> 
</head>
<body>
<% 
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>

<%
    
	ArrayList<DisplayInfo> da = (ArrayList<DisplayInfo>)request.getAttribute("AdData");

	out.println(da);

	
%>


<form action="LogOut" method = "post">				
 				<input type="submit" name="Logout" value="Logout">			
</form>


</body>
</html>