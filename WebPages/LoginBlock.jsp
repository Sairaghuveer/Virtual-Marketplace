  <!-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> -->
<!--<!DOCTYPE html>-->
<html>
<head>
<!--<title>Log In</title>-->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
 <style>
   body{
      color: white; 
      }
   form {
        display: block;
        position: relative;
        margin: auto;
        border: 3px solid #88000000;
        background-color: #00000026;
         
        width: 40%;
        padding: 70px 0;
        
        
        
        }
 .hero-image {
  
     background-image: url("https://pbs.twimg.com/media/Emp8JArXMAMOSRH?format=jpg&name=small");

  
     height: 700px;
  
     background-position: center;
  
     background-repeat: no-repeat;
  
     background-size: cover;
  
     position: relative;
}
 .button1 {border-radius: 8px;color: white; background: black; height: 40px;}
 .button1:hover {
  background-color: #4cafff;
  color: black;
}
 .button2 {border-radius: 8px;color: black; background: #4cafff; height: 40px;}
 .button2:hover {
  background-color: black;
  color: white;
}
 </style>
  
</head>
<body  style="background-color:powderblue;">
    <div class="hero-image">
    
Your Account has been blocked
	<div>
		<h1	style="text-align: center; font-family: Geneva;">VirtualMart</h1>
		<h3	style="text-align: center; font-family: Candara;">Log-in to continue</h3>
	</div>
      
	<div class="container" style="padding-top: 40px">
            
      <form action="LoginTest" method="post">
			<div class="form-group" >			
				<input type="text" class="form-control" name="User_Name" placeholder="UserName">
			</div>
			<div class="form-group">
			<input type="password" class="form-control" name="User_Pass" placeholder="Password">
			</div>
			<div style="text-align:center">
			<button type="submit" name="Submit" class="btn btn-primary" value="Submit">Submit</button>
			</div>
			<br><br>
				<div style="text-align:center">
			<button type="submit" name="Register" class="btn btn-primary" value="Register">Register</button>
			</div>
			
		</form>
		</div>  
     </div> 
              
</body>
</html>