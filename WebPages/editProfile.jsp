<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Edit Profile</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
  padding: 0px 5px;
  text-decoration: none;
}

.topnav {
  overflow: hidden;
  background-color: black;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.container {
  position: relative;
  border-radius: 5px;
  border-color: black;
  color: white;
  border: 3px solid #88000000;
  background-color: #0000003f;
  padding: 30px 0 30px 0;
  width:50%;
  }

.button {border-radius: 8px;color: white; background: black; height: 40px; margin-left:43%;}
.button:hover {
  background-color: #4cafff;
  color: black;
}


</style>

</head>
<body style="background-color: powderblue;">
	<!--<div>
		<h1	style="text-align: center; font-family: Candara; background-color: white;">Virtual MarketPlace</h1>
		<h3 style="text-align: center; font-family: Candara;">Edit your Profile</h3>
	</div>-->
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
<%
 	String fname = (String) session.getAttribute("First_Name");
 	String lname = (String) session.getAttribute("Last_Name");
 	String uname = (String) session.getAttribute("User_Name");
 	long phn = (long) session.getAttribute("Phone_Number");
	String Emai = (String) session.getAttribute("Email");
	String up = (String) session.getAttribute("up");

%>
       <div class="container">
	<form action="editProfile" method="post">
		<!--<div class="container" style="padding-top: 1px">-->
			<label for="First_Name">Enter First Name :</label> 
			<input type="text"	class="form-control" name="updFirst_Name" value="<%= fname %>" required>
		<!--</div>
		<div class="container" style="padding-top: 5px">-->
			<label for="Last_Name">Enter Last Name :</label> <input type="text"
				class="form-control" name="updLast_Name"
				value="<%= lname %>" required>
		<!--</div>
		<div class="container" style="padding-top: 5px">-->
			<label for="User_Name">Enter User Name :</label> <input type="text"
				class="form-control" name="updUser_Name"
				value="<%= uname %>" required>
		<!--</div>
		<div class="container" style="padding-top: 5px">-->
			<label for="Email">Enter Email :</label> <input type="email"
				class="form-control" name="updEmail" id="myEmail"  value="<%= Emai %>"   pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required >
		<!--</div>

		<div class="container" style="padding-top: 5px">-->
			<label for="Phone_Number">Enter Phone Number :</label> <input
				type="number" id="numb" maxlength="10"  pattern="[0-9]+" title="please enter number only"  class="form-control" name="updPhone_Number" value="<%= phn %>"
				required/>
		<!--</div>
				<div class="container" style="padding-top: 5px">-->
			<label for="User_Name">Enter User Name :</label> <input type="text"
				class="form-control" name="updUser_Name"
				value="<%= uname %>" required>
		<!--</div>
				<div class="container" style="padding-top: 5px">-->
			<label for="up">Change the Password :</label> <input type="password"
				class="form-control" name="updup" value="<%= up %>" required>
		<!--</div>-->
		<br>
	<button type="submit" onclick="myFunction()"  class="button" onclick="window.location.href='/VMart/UserResponse.jsp'">Update</button>
	</form>
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
<script>
function myFunction() {
	  var em = document.getElementById("myEmail").pattern;
	  document.getElementById("demo").innerHTML = em;
	  
	  
	}
</script>
</html>