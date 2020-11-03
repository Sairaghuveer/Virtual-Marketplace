package valid;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginValid {
	String dbDriver = "com.mysql.jdbc.Driver"; 
	String dbURL = "jdbc:mysql://localhost:3306/"; 
	String dbName = "virtualmart"; 
	String dbUsername = "root"; 
	String dbPassword = "aA!8801701755";
	String query="select * from users where User_Name=? and User_Pass=?";
	
	public boolean check(String User_Name, String User_Pass)  
	{
	        boolean a = false;
		 try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(dbURL + dbName, dbUsername, dbPassword); 
			PreparedStatement stmnt = con.prepareStatement(query);
			stmnt.setString(1, User_Name);
			stmnt.setString(2, User_Pass);
			ResultSet rs = stmnt.executeQuery();
			if (rs.next()) {
				
				a= true;
			}
		 }
		 catch(Exception e) {
          e.printStackTrace();
		
		}
		
			
		return a;
		
		
	}
	}

