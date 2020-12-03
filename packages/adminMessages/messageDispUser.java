package adminMessage;

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
import javax.servlet.http.HttpSession;

import PostAd.DatabaseConnection;
/**
 * Servlet implementation class messageDispUser 
 * 
 * same as messageDispBuyer
 */
@WebServlet("/messageDispUser")
public class messageDispUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String query2 = "SELECT Admin_MSG, User_MSG, Message_ID FROM virtualmart.admin_messages where User_ID = ? "
			+ "order by Message_ID";
// Fetch all the messages from the db based on UserID	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int User_ID = (int) session.getAttribute("UserID");
		try {
//initializeDatabase is a method which connects the program and the database
			Connection conn = DatabaseConnection.initializeDatabase();
			System.out.println("connection done");
			PreparedStatement stmnt2 = conn.prepareStatement(query2);
			stmnt2.setInt(1, User_ID);
			
			ResultSet rs2 = stmnt2.executeQuery();

			ArrayList<AdminMessageBean> msg_u = new ArrayList<AdminMessageBean>();

			while (rs2.next()) {
				msg_u.add(new AdminMessageBean(rs2.getString("User_MSG"),rs2.getString("Admin_MSG"),rs2.getInt("Message_ID"), User_ID));
			}
			System.out.println(msg_u);
			
			//Set the Attribute from msg_b to msg_u as what was done in the messaging for buyer and seller
			request.setAttribute("msg_u", msg_u);
//Send the request to the page
//Redirect the admin to the page where he can see all his messages from users
			RequestDispatcher rd = request.getRequestDispatcher("ShowAllMsgUser.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
