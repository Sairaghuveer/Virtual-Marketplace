,javapackage adminMessage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import PostAd.DatabaseConnection;

/**
 * Servlet implementation class messageDispAdmin 
 * 
 * same as messageDispSeller
 */
@WebServlet("/messageDispAdmin")
public class messageDispAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String query1 = "SELECT User_ID from virtualmart.users WHERE User_Name = ?";
// Based on the username obtain userid
	String query2 = "SELECT User_MSG, Admin_MSG, Message_ID FROM virtualmart.admin_messages where User_ID = ? "
    		+ " order by Message_ID";          
// Based on the userid fetch all the messages from the database	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String User_Name = request.getParameter("User_Name");
		System.out.println(User_Name);
		try {
//initializeDatabase is a method which connects the program and the database			
			Connection conn = DatabaseConnection.initializeDatabase();
			System.out.println("connection done");
	//Preparing the statement and setting the variables for the query
			PreparedStatement stmnt1 = conn.prepareStatement(query1);
			stmnt1.setString(1, User_Name);
			//stmnt1.setInt(2, Prod_ID);
			//Executing the query
			ResultSet rs1 = stmnt1.executeQuery();
			ArrayList<AdminMessageBean> msg_u = new ArrayList<AdminMessageBean>();
			while(rs1.next()) {
			int User_ID= rs1.getInt("User_ID");
			//Preparing the arraylist of AdminMessageBean object
			//Passing the value of the messages to the arraylist used to print the 
			//messages in the jsp page
			PreparedStatement stmnt2 = conn.prepareStatement(query2);
			stmnt2.setInt(1, User_ID);

			ResultSet rs2 = stmnt2.executeQuery();
			
			if (rs2.next()) {				
				msg_u.add(new AdminMessageBean(rs2.getString("User_MSG"),rs2.getString("Admin_MSG"),rs2.getInt("Message_ID"), User_ID));
			System.out.println(msg_u);
			}
			}			
//Setting the msg_u attribute
			
//Set the Attribute from msg_b to msg_u as what was done in the messaging for buyer and seller
			request.setAttribute("msg_u", msg_u);
//Send the request to the page
//Redirect the admin to the page where he can see all his messages from users
			RequestDispatcher rd = request.getRequestDispatcher("ShowAllMsgsAdmin.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
