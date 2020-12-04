package report;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import databasetojava.DisplayInfo;



/*
 * This class obtains all the reported ads by the users
 */
public class FetchReports {
	public ArrayList <AdminReport> myFetchedReports;
	String dbDriver = "com.mysql.jdbc.Driver"; 
	String dbURL = "jdbc:mysql://localhost:3306/"; 
	String dbName = "virtualmart";
	String dbUsername = "root"; 
	String dbPassword = "aA!8801701755";
	String query="SELECT u.User_Name, s.User_Name as `Reported_User_Name`, ap.Prod_Name, ur.Reporting_Reason, ur.Prod_ID FROM virtualmart.users_report ur JOIN virtualmart.users u ON u.User_ID = ur.User_ID JOIN virtualmart.users s ON s.USER_ID = ur.reported_ID JOIN virtualmart.ads_posted ap ON ap.Prod_ID = ur.Prod_ID where ur.Query_Status='unsolved';";
//To select all the reports present in the user_reports table

	
public ArrayList<AdminReport> getInfo() {	
		try {
//Connect to the database		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(dbURL + dbName, dbUsername, dbPassword); 
		PreparedStatement stmnt = con.prepareStatement(query);
		//stmnt.setInt(1,(Prod_ID));
		ResultSet rs = stmnt.executeQuery();
		ArrayList <AdminReport> myFetchedReports = new ArrayList<AdminReport>();
//To obtain all the reports use while loop		
		while(rs.next()) {
		myFetchedReports.add(new AdminReport(rs.getString("Reported_User_Name"),rs.getString("Prod_Name"),rs.getString("User_Name"),rs.getString("Reporting_Reason"),rs.getInt("Prod_ID"))); 
		//System.out.println(myFetchedData.prod_Description);
		}
		return myFetchedReports;
//To enter the parameters into an object to return values
			//System.out.println(rs.getInt("Prod_Price"));
		  
		  
		}
		catch(Exception e) {
			System.out.println(e);
		    return myFetchedReports;
		}

	}

	
}



