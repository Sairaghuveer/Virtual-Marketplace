package report;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import PostAd.DatabaseConnection;


/*
 * This servlet inserts the reported id, prod iD, reporter ID and reporting reason into the db
 */
@WebServlet("/ReportAd")
public class ReportAd extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String query1 = "SELECT ap.User_ID FROM virtualmart.ads_posted ap WHERE ap.Prod_ID =?;";
//To obatin the UserID of the reported product using productID	
	String query2 = "INSERT INTO users_report(User_ID, Reported_ID, Prod_ID, Reporting_Reason) VALUES(?, ?, ?, ?);";
//To insert the details in the users_report table
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		int Buyer_ID = (int) session.getAttribute("UserID");
		int Prod_ID = (int) session.getAttribute("prod_ID");
		String User_Msg = request.getParameter("user_Msg");
		System.out.println(User_Msg);
		try {
//initializeDatabase is a method which connects the program and the databas			
			Connection conn = DatabaseConnection.initializeDatabase();
			System.out.println("connection done");
			PreparedStatement stmnt1 = conn.prepareStatement(query1);
			stmnt1.setInt(1, Prod_ID);
			ResultSet rs1 = stmnt1.executeQuery();
			rs1.next();
			PreparedStatement stmnt2 = conn.prepareStatement(query2);
			stmnt2.setInt(1, Buyer_ID);
			stmnt2.setInt(2, rs1.getInt("User_ID"));
			stmnt2.setInt(3, Prod_ID);
			stmnt2.setString(4, User_Msg);
			int rs2 = stmnt2.executeUpdate();	
//Redirect the user after reporting the ad			
			RequestDispatcher rd = request.getRequestDispatcher("AfterReport.jsp");
			rd.forward(request, response);

// Close all the connections
			stmnt1.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
		
		
		
		
		
	}

