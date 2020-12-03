package adminMessage;

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
 * Servlet implementation class AdminMsg to enable admin to respond user messages
 */
@WebServlet("/AdminMsg")
public class AdminMsg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String query = "UPDATE virtualmart.admin_messages SET Admin_MSG =?  WHERE Message_ID=?";
//The Admin reply is updated to the database using Message ID which is obtained from the session and the 
//text message is obtained in the form of string from the jsp page
		String Admin_MSG = request.getParameter("userMsg");
		HttpSession session = request.getSession();
		int Message_ID= (int) session.getAttribute("Message_ID");
		try {
//initializeDatabase is a method which connects the program and the database
			Connection conn = DatabaseConnection.initializeDatabase();
			System.out.println("connection done");
			PreparedStatement stmnt1 = conn.prepareStatement(query);
			stmnt1.setString(1, Admin_MSG);
			stmnt1.setInt(2, Message_ID);

			int rs = stmnt1.executeUpdate();
				//rs.next();		
			System.out.println("Message inserted to database with the provided data");

	// Close all the connections
			stmnt1.close();		
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
//After replying the Admin is redirected to AfterMessage jsp page

		RequestDispatcher rd = request.getRequestDispatcher("AfterMessage.jsp");
		rd.forward(request, response);
	}

}
