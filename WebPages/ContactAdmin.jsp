<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="message.MessageBean"%>
<%@ page import="message.MessageBeanBS"%>

<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Contact Seller</title>
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
  margin-left: 400px;
  margin-top: 50px
  }

.button {border-radius: 8px;color: white; background: black; height: 40px;}
.button:hover {
  background-color: #4cafff;
  color: black;
}
.hint{
display: inline-block;
}



</style>
</head>
<body style="background-color: powderblue;">
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
            <div class="row">
                    <div class="col-md-10" style="text-align:center">
                        <!--<textarea name="bottxt" id="disabledTextInput" class="form-control col-xs-6" rows="8" cols="60"></textarea><br>-->
                        <div class="container">
                        <form class="form-horizontal" action="messageServAdmin" method="post" style="text-align:center">
                        <label for="message_area">No more than 512 characters</label>
                        <p><input class="form-control" id="message_area" type="text" name="userMsg" placeholder="Enter your message here" maxlength="512"></p>
                        <span class="hint" id="textarea_message"></span>
                       <button type="submit" class="button"> Send </button>
                        
                       </form>
                    </div>
            </div>
            
	<!--<form action="LogOut" method="post" style="text-align:right">
		<input type="submit" name="Logout" value="Logout">
	</form>-->
</div>

</body>
</html>
