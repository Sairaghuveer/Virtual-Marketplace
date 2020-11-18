package message;

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

/**
 * Servlet implementation class SellerMsg
 */
@WebServlet("/SellerMsg")
public class SellerMsg extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String query = "UPDATE virtualmart.messages SET Seller_MSG =?  WHERE Seller_ID=? and Message_ID=?";
		String message = request.getParameter("userMsg");
		String Seller_MSG = message;
		HttpSession session = request.getSession();
		int Seller_ID = (int) session.getAttribute("UserID");
		int Message_ID = (int) session.getAttribute("Message_ID");
		try {
			Connection conn = DatabaseConnection.initializeDatabase();
			System.out.println("connection done");
			PreparedStatement stmnt1 = conn.prepareStatement(query);
			stmnt1.setString(1, Seller_MSG);
			stmnt1.setInt(2, Seller_ID);
			stmnt1.setInt(3, Message_ID);
			
			int rs = stmnt1.executeUpdate();
			//rs.next();
		
			System.out.println("Message inserted to database with the provided data");

			// Close all the connections
			stmnt1.close();
		
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		RequestDispatcher rd = request.getRequestDispatcher("AfterMessage.jsp");
		rd.forward(request, response);
	}
}