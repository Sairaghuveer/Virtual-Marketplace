package databasetojava;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.*;
public class FetchAdConnect{
	String dbDriver = "com.mysql.jdbc.Driver"; 
	String dbURL = "jdbc:mysql://localhost:3306/"; 
	String dbName = "virtualmart";
	String dbUsername = "root"; 
	String dbPassword = "aA!8801701755";
	String query="select Prod_Description, Prod_Price, Category_Name, Loc_ID, Item_Condition_ID from ads_posted where Prod_Name=?";

	public List<DisplayInfo> getInfo(String Prod_Name) {
		
		
		
		
		try {
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(dbURL + dbName, dbUsername, dbPassword); 
		PreparedStatement stmnt = con.prepareStatement(query);
		stmnt.setString(1,(Prod_Name));
		ResultSet rs = stmnt.executeQuery();
	    
		ArrayList <DisplayInfo> displayResults = new ArrayList<DisplayInfo>();
		
		int row =1;
		while(rs.next()) {
			DisplayInfo d = new DisplayInfo();
			d.setProd_Name(Prod_Name);
			d.setProd_Description(rs.getString("Prod_Description"));
			d.setProd_Price(rs.getInt("Prod_Price"));
			d.setCategory_Name(rs.getString("Category_Name"));
			d.setLoc_ID(rs.getInt("Loc_ID"));
			d.setItem_Condition_ID(rs.getInt("Item_Condition_ID"));
			row=row+1;
			//System.out.println(rs.getInt("Prod_Price"));
			displayResults.add(d);
			
		}
		  System.out.println(displayResults);
				return displayResults;
		
		}
		catch(Exception e) {
			System.out.println(e);
			return null;
		}

	}
	
}
