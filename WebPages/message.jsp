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
</head>
<body style="background-color: powderblue;">

            <div class="row">
                    <div class="col-md-10" style="text-align:center">
                        <textarea name="bottxt" id="disabledTextInput" class="form-control col-xs-6" rows="8" cols="60"></textarea><br>
                        <form class="form-horizontal" action="messageServ" method="post" style="text-align:center">
                        <label for="message_area">No more than 512 characters</label>
                        <p><input class="form-control" id="message_area" type="text" name="userMsg" placeholder="Enter your message here" maxlength="512"></p>
                        <span class="hint" id="textarea_message"></span>
                        <button type="submit" class="btn btn-success active"> Send </button>
                       </form>
                    </div>
            </div>
            
	<form action="LogOut" method="post" style="text-align:right">
		<input type="submit" name="Logout" value="Logout">
	</form>
</body>
</html>