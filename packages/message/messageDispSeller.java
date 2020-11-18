package message;

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

@WebServlet(name="/messageDispSeller", urlPatterns = {"/messageDispSeller"})
public class messageDispSeller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String query1 = "SELECT User_ID from virtualmart.users WHERE User_Name = ?";
	String query2 = "SELECT Buyer_MSG, Seller_MSG, Message_ID FROM virtualmart.messages where Buyer_ID = ? "
    		+ "AND Seller_ID = ? and Prod_ID = ? order by MSG_Timestamp";   
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		//Getting the seller ID using the Http session
		int Seller_ID = (int) session.getAttribute("UserID");
		//Getting the buyer ID and Prod ID using the get parameter from the page
		//int Buyer_ID = Integer.parseInt(request.getParameter("Buyer_ID"));
		System.out.println(request.getParameter("Prod_ID"));
		int Prod_ID = Integer.parseInt(request.getParameter("Prod_ID"));
		String User_Name = request.getParameter("User_Name");
		System.out.println(User_Name);
		try {
			Connection conn = DatabaseConnection.initializeDatabase();
			System.out.println("connection done");
			//Preparing the statement and setting the variables for the query
			PreparedStatement stmnt1 = conn.prepareStatement(query1);
			stmnt1.setString(1, User_Name);
			//stmnt1.setInt(2, Prod_ID);
			//Executing the query
			ResultSet rs1 = stmnt1.executeQuery();
			ArrayList<MessageBeanBS> msg_b = new ArrayList<MessageBeanBS>();
			while(rs1.next()) {
			int Buyer_ID= rs1.getInt("User_ID");
			//Preparing the arraylist of messageBeanBS object
			//ArrayList<MessageBeanBS> msg_s = new ArrayList<MessageBeanBS>();
			//Passing the value of the messages to the arraylist used to print the 
			//messages in the jsp page
			PreparedStatement stmnt2 = conn.prepareStatement(query2);
			stmnt2.setInt(1, Buyer_ID);
			stmnt2.setInt(2, Seller_ID);
			stmnt2.setInt(3, Prod_ID);
			ResultSet rs2 = stmnt2.executeQuery();
			
			

			if (rs2.next()) {
				
				msg_b.add(new MessageBeanBS(rs2.getString("Buyer_MSG"),rs2.getString("Seller_MSG"),Prod_ID,rs2.getInt("Message_ID")));
			System.out.println(msg_b);
			}
			}			//Setting the msg_b attribute
			request.setAttribute("msg_b", msg_b);
			//Send the request to the page
			RequestDispatcher rd = request.getRequestDispatcher("ShowAllMsgSell.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}