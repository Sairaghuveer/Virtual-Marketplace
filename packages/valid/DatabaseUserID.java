package valid;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import databasetojava.DisplayInfo;

public class DatabaseUserID {
	String dbDriver = "com.mysql.jdbc.Driver"; 
	String dbURL = "jdbc:mysql://localhost:3306/"; 
	String dbName = "virtualmart";
	String dbUsername = "root"; 
	String dbPassword = "aA!8801701755";
	String query="select User_ID from users where User_Name=?";

	public ForUserID getInfo(String User_Name) {
		
		ForUserID U = new ForUserID();
		
		
		try {
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(dbURL + dbName, dbUsername, dbPassword); 
		PreparedStatement stmnt = con.prepareStatement(query);
		stmnt.setString(1, User_Name);
		ResultSet rs = stmnt.executeQuery();
		rs.next();
			//System.out.println(rs.getInt("User_ID"));
			U.setUser_ID(rs.getInt("User_ID"));
				return U;
				
		
		}
		catch(Exception e) {
			System.out.println(e);
			return U;
		}

	}
	

}
