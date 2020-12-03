<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
  color: black;
  border: 3px solid #88000000;
  background-color: #cfd3ce;
  padding:20px;
}

.button {
	position: absolute;
	top: 50%;
        background: black;
        border: none;
        color: white;
}
table, th,{
  border: 1px white;
}
</style>
</head>
<body>

			<div class="container-fluid">
               		 <h1 style="text-align:center; padding:20px;">VirtualMart</h1>
            </div>
		<!--<h1 style="text-align: center; font-family: Candara; background-color: white;">VirtualMart - A online Marketplace for every product</h1>-->
			<div class="topnav">
 <div class="navbar-header" style="float:left;">
            <a>
				<form action="Home"  method="post">
					<button type="submit" name="ViewMyMsgs" value="ViewMyMsgs" style="text-align: center; background: black; color:white; float: left; border: none;">Home</button>
					</form>
			</a>
			</div>
			<a>
	<form action="BlockUserProd" method="post" style="text-align:right">
		<button type="submit" name="Prod_ID" value="${SeeAd.prod_ID}">Block this User</button>
	</form>
	
</a>
			
                       	</div>
	               	
			

<div class="container">
   <div class="row justify-content-md-center">
    <div class="col-sm-8">
    <p>
     Product Description: "${SeeAd.prod_Description}"<br>
     Product Price: "${SeeAd.prod_Price}"<br>
     Category Name: "${SeeAd.category_Name}"<br>
     Location: "${SeeAd.loc_ID}"<br>
     Product ID: "${SeeAd.prod_ID}"<br>
     Item Condition: "${SeeAd.item_Condition_ID}"<br>
     </p>
     </div>
      <div class="col-sm-4">
      <img src="/Second/images/${SeeAd.image_path}" width="250" height="250"/>
     </div>
	</div>
	</div>
	  <div class="container">	
<br><br>
   <div class="row justify-content-sm-center">
    <div class="col-sm-4" style="text-align:right">
	<form action="DeleteAd" method="post" style="text-align:right">
		<button onclick="return confirm('Are you sure you want to delete this item')" type="submit" name="Prod_ID" value="${SeeAd.prod_ID}">Delete Ad</button>
	</form>
	</div>
	 <div class="col-sm-4">
	<form action="AdAgain" method="post" style="text-align:center">
		<button type="submit" name="Prod_ID" value="${SeeAd.prod_ID}">Post my Ad again</button>
	</form></div>
	 <div class="col-sm-4">
	 <form action="updateServlet" method="post" style="text-align:left">
	<button type="submit" name="Edit Ad" value="${SeeAd.prod_ID}">Edit Ad</button>
	</form>
</div>
</div>
<%
if (session == null || session.getAttribute("UserID") == null) {
    response.sendRedirect("LogOut.jsp"); // No logged-in user found, so redirect to login page.
} else {
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0);
}

%>
</body>



</html>