<!--<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>-->
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home page</title>
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

* {
  box-sizing: border-box;
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
  margin-left: 20%;
  margin-right: 20%;
  margin-top: 2%;
  
 
}

.button1 {border-radius: 8px;color: white; background: black; height: 40px;}
 .button1:hover {
  background-color: #4cafff;
  color: black;
}

/* style inputs and link buttons */
input,
.btn {
  width: 100%;
  padding: 12px;
  border: none;
  border-radius: 4px;
  margin: 5px 0;
  opacity: 0.85;
  display: inline-block;
  font-size: 17px;
  line-height: 20px;
  text-decoration: none; /* remove underline from anchors */
}


/* style the submit button */

/* Two-column layout */
.col {
  float: left;
  width: 50%;
  margin: auto;
  padding: 0 50px;
  margin-top: 6px;
}

.col2 {
  float: right;
  width: 50%;
  margin: auto;
  padding: 0 50px;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* vertical line */
.vl {
  position: absolute;
  left: 50%;
  transform: translate(-50%);
  border: 2px  #00000026;
  height: 300px;
  background-color: #00000026;
}

/* text inside the vertical line */
.vl-innertext {
  position: absolute;
  top: 50%;
  transform: translate(-50%, -50%);
  background-color: black;
  color: white;
  border: 1px solid #ccc;
  border-radius: 50%;
  padding: 10px 10px;
}

/* hide some text on medium and large screens */
.hide-md-lg {
  display: none;
}

/* bottom container */


/* Responsive layout - when the screen is less than 650px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 650px) {
  .col {
    width: 100%;
    margin-top: 0;
  }
  /* hide the vertical line */
  .vl {
    display: none;
  }
  /* show the hidden text on small screens */
  .hide-md-lg {
    display: block;
    text-align: center;
  }
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

Welcome Admin

<%
	session.setAttribute("UserID",2);
%>


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
				<form action="profileInfo" method="post">
					<button type="submit" name="View My Profile" value="View My Profile" style="text-align: center; background: black; color:white; border: none;">View My Profile</button>
					</form>
			</a>
				<a>
				<form action="MessageNav"  method="post">
					<button type="submit" name="ViewMyMsgs" value="ViewMyMsgs" style="text-align: center; background: black; color:white; border: none;">View Messages</button>
					</form>
			</a>
		
			
			<a>
	              	<form action="ViewMyAds" method="post">
			<button type="submit" name="ViewMyAds" value="ViewMyAds" style="text-align: center; background: black; color:white; border: none;">View My Ads</button>
	               	</form>
			</a>
		
			<a>
	              	<form action="messageInterfaceA" method="post">
			<button type="submit" name="AdminMsgs" value="AdminMsgs" style="text-align: center; background: black; color:white; border: none;">Admin Messages</button>
	               	</form>
			</a>
			
				<a>
	              	<form action="SeeReports" method="post">
			<button type="submit" name="SeeReports" value="SeeReports" style="text-align: center; background: black; color:white; border: none;">See Reports</button>
	               	</form>
			</a>
			</div>
		<!--<div style="text-align:right">
			<input type="submit" name="Logout" value="Logout">
		</div>-->


        <div class="container">
      
 
    <div class="row">
      <h2 style="text-align:center">Choose Your Action!</h2>
      <div class="vl">
        <span class="vl-innertext">OR</span>
      </div>

      <div class="col">
        <a>
<form action="UserSelect" method="post" style="text-align:center">
        <div>
           
       
            <img src="https://pbs.twimg.com/media/EmuRHB6XIAEAtEv?format=png&name=small" style= "width:80%; margin-left:20px;">
        <button type="submit" name="Post an Ad" value="Post an Ad" style="text-align: center; margin-left:38%;"
	class="button1">Post</button>
                 </div>
    </form>
        </a>
      </div>

      <div class="col2">
        <div class="hide-md-lg">
          <p>OR</p>
        </div>
        <form action="UserSelect" method="post" style="text-align:center">
        <div>
       
            <img src="https://pbs.twimg.com/media/EmuRHB4WMAIg2JF?format=png&name=small" style= "width:85%; margin-right:20;">
            <button type="submit" name="AdBrowse"  value="AdBrowse" style="text-align: center; margin-left:10%;"
				class="button1">Browse</button>
            
        </div>
    </form>
      </div>
     
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