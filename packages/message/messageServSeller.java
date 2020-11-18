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

@WebServlet("/messageServSeller")
public class messageServSeller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String query = "INSERT INTO virtualmart.messages (Buyer_ID, Seller_ID, Prod_ID, Seller_MSG) VALUES(?, ?, ?, ?)";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		int Seller_ID = (int) session.getAttribute("User_ID");
		int Buyer_ID = Integer.parseInt(request.getParameter("Buyer_ID"));
		int Prod_ID = Integer.parseInt(request.getParameter("Prod_ID"));
		String message = request.getParameter("userMsg");
		String Seller_MSG = message;
		try {
			Connection conn = DatabaseConnection.initializeDatabase();
			System.out.println("connection done");
			PreparedStatement stmnt = conn.prepareStatement(query);
			stmnt.setInt(1, Buyer_ID);
			stmnt.setInt(2, Seller_ID);
			stmnt.setInt(3, Prod_ID);
			stmnt.setString(4, Seller_MSG);
			stmnt.executeUpdate();
			System.out.println("Message inserted to database with the provided data");

			// Close all the connections
			stmnt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		MessageBean msgS = new MessageBean();
		msgS.setMsg(message);
		RequestDispatcher rd = request.getRequestDispatcher("contact.jsp");
		request.setAttribute("msgS", msgS);
		rd.forward(request, response);
	}
}