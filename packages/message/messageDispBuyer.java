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

@WebServlet("/messageDispBuyer")
public class messageDispBuyer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String query1 = "SELECT User_ID from virtualmart.ads_posted WHERE Prod_ID = ?";
	String query2 = "SELECT Seller_MSG, Buyer_MSG, Message_ID FROM virtualmart.messages where Buyer_ID = ? "
			+ "AND Seller_ID = ? and Prod_ID = ? order by MSG_Timestamp";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		//Set the Buyer ID from the session and get the ProdID from the page
		int Buyer_ID = (int) session.getAttribute("UserID");
		System.out.println(Buyer_ID);
		int Prod_ID = Integer.parseInt(request.getParameter("Prod_ID"));
		System.out.println(Prod_ID);

		try {
			Connection conn = DatabaseConnection.initializeDatabase();
			System.out.println("connection done");
			//Prepare the Statement object to use
			PreparedStatement stmnt1 = conn.prepareStatement(query1);
			//Set the query parameter
			stmnt1.setInt(1, Prod_ID);
			//Executing the query
			ResultSet rs1 = stmnt1.executeQuery();
			//Getting the Seller ID
			rs1.next();
				int Seller_ID = rs1.getInt("User_ID");
				System.out.println("The Seller user ID is: " + Seller_ID);
			
			PreparedStatement stmnt2 = conn.prepareStatement(query2);
			stmnt2.setInt(1, Buyer_ID);
			stmnt2.setInt(2, Seller_ID);
			stmnt2.setInt(3, Prod_ID);

			ResultSet rs2 = stmnt2.executeQuery();

			ArrayList<MessageBeanBS> msg_b = new ArrayList<MessageBeanBS>();

			while (rs2.next()) {
				//MessageBeanBS b = new MessageBeanBS();
				//b.setSeller_MSG(rs2.getString("Seller_MSG"));
				//b.setBuyer_MSG(rs2.getString("Buyer_MSG"));
				msg_b.add(new MessageBeanBS(rs2.getString("Buyer_MSG"),rs2.getString("Seller_MSG"),Prod_ID,rs2.getInt("Message_ID")));
			}
			System.out.println(msg_b);
			//Setting the msg_b attribute
			request.setAttribute("msg_b", msg_b);
			//Send the request to the page
			RequestDispatcher rd = request.getRequestDispatcher("ShowAllMsgBuy.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}