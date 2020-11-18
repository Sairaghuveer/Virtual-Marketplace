package message;

import PostAd.DatabaseConnection;

import java.io.IOException;
import java.sql.*;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/messageServ")
public class messageServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String query1 = "SELECT User_ID from virtualmart.ads_posted WHERE Prod_ID = ?";
	String query2 = "INSERT INTO virtualmart.messages (Buyer_ID, Seller_ID, Prod_ID, Buyer_MSG) VALUES(?, ?, ?, ?)";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		int Buyer_ID = (int) session.getAttribute("UserID");
		int Prod_ID = (int) session.getAttribute("prod_ID");
		//int Prod_ID = session.getAttribute("User_ID");
		//int Prod_ID = Integer.parseInt(request.getParameter("Contact Seller"));
		String message = request.getParameter("userMsg");
		String Buyer_MSG = message;
		try {
			Connection conn = DatabaseConnection.initializeDatabase();
			System.out.println("connection done");
			PreparedStatement stmnt1 = conn.prepareStatement(query1);
			stmnt1.setInt(1, Prod_ID);
			ResultSet rs = stmnt1.executeQuery();
			rs.next();
				int Seller_ID = rs.getInt(1);
				System.out.println("The Seller user ID is: " + Seller_ID);
			
			PreparedStatement stmnt2 = conn.prepareStatement(query2);
			stmnt2.setInt(1, Buyer_ID);
			stmnt2.setInt(2, Seller_ID);
			stmnt2.setInt(3, Prod_ID);
			stmnt2.setString(4, Buyer_MSG);
			stmnt2.executeUpdate();
			System.out.println("Message inserted to database with the provided d5ata");

			// Close all the connections
			stmnt1.close();
			stmnt2.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		//MessageBeanBS msgB = new MessageBeanBS();
		//msgB.setBuyer_MSG(message);
		//RequestDispatcher rd = request.getRequestDispatcher("contact.jsp");
		//request.setAttribute("msgB", (MessageBeanBS) msgB);
		//rd.forward(request, response);
		RequestDispatcher rd = request.getRequestDispatcher("AfterMessage.jsp");
		rd.forward(request, response);
	}
}