<%@page import="databasetojava.DisplayInfo"%>
<%@page import="databasetojava.FetchAdConnect"%>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.lang.Iterable"%>
<%@ page import ="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
body{
   margin: auto;
   background-image: url("https://pbs.twimg.com/media/EmuiBUAWEAA_O97?format=jpg&name=large");


   background-repeat: no-repeat;

   background-size: cover;
   
}

 
.header {
  background-color: grey;
  color: white;

  margin: auto;
  padding: 40px;
  text-align: center;
}

/* Style the topnav links */
.topnav a {
  float: right;
  display: block;
  color: black;

  margin: auto;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

.topnav {
  overflow: hidden;
  background-color: black;
}
/* Change color on hover */
.topnav a:hover {
  background-color: #ddd;
  color: black;
}

/* style the container */
.container {
  position: relative;
  border-radius: 5px;
  border-color: black;
  color: white;
  border: 3px solid #88000000;
  background-color: #0000003f;
  padding: 15px 0 30px 0;
  margin-left: 10%;
  margin-right: 10%;
  margin-top: 2%;
}

.button {
	position: absolute;
	top: 50%;
        background: black;
        border: none;
        color: white;
}
}
</style> 
</head>
<body>

<div class="header">
                <h1>VirtualMart</h1>
                 </div>
		<!--<h1 style="text-align: center; font-family: Candara; background-color: white;">VirtualMart - A online Marketplace for every product</h1>-->
			<div class="topnav">
                       <a>
                        <form action="LogOut" method="post">
                        <button type="submit" name="Logout" value="Logout" style="text-align: center; background: black; color:white; border: none;">Logout</button>
                     	</form>
			</a>
			<a>
	              	<form action="ViewMyAds" method="post">
			<button type="submit" name="ViewMyAds" value="ViewMyAds" style="text-align: center; background: black; color:white; border: none;">View My Ads</button>
	               	</form>
			</a>
			<a>
			 <form action="UserSelect" method="post" style="text-align:center">
        <div>
            <button type="submit" name="AdBrowse"  value="AdBrowse" style="text-align: center; background: black; color:white; border: none;">Browse Ads</button>
            
        </div>
        </form>
        </a>
  
        <a>
				<form action="profileInfo" method="post">
					<button type="submit" name="View My Profile" value="View My Profile" style="text-align: center; background: black; color:white; border: none;">View My Profile</button>
					</form>
			</a>
				<a>
				<form action="MessageNav"  method="post">
					<button type="submit" name="ViewMyMsgs" value="ViewMyMsgs" style="text-align: center; background: black; color:white; border: none;">View Messages</button>
					</form>
			</a>
			
			</a>
			<div class="navbar-header" style="float:left;">
            <a>
				<form action="Home"  method="post">
					<button type="submit" name="ViewMyMsgs" value="ViewMyMsgs" style="text-align: center; background: black; color:white; float: left; border: none;">Home</button>
					</form>
			</a>
			</div>
			</div>
<div class="container">	
<form action="ViewAd" method="post">
<c:forEach var="cata" items="${ViewReport}" >
<button type="submit" name="prod_ID"  value="${cata.prod_ID}">
	User Name: ${cata.user_Name}<br>
     Product Name: ${cata.prod_Name}<br>
     Reporter Name: ${cata.reporter_Name}<br>
     Reason: ${cata.user_Msg}<br>
     </button>
</c:forEach>	
</form>


<!--<form action="LogOut" method = "post">				
 				<input type="submit" name="Logout" value="Logout">			
</form>-->

</div>

</body>
</html>