package adminMessage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import PostAd.DatabaseConnection;

/**
 * Servlet implementation class messageServAdmin 
 * 
 * same as messageServ
 */
@WebServlet("/messageServAdmin")
public class messageServAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String query = "INSERT INTO virtualmart.admin_messages (User_ID, User_MSG) VALUES(?, ?)";
//Insert the userid and the user message into the database when user types the message in the jsp page
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		int User_ID = (int) session.getAttribute("UserID");
//UserID is obtained from the session		
		String message = request.getParameter("userMsg");
//The user message is obtained from the jsp page which is connected to this servlet		
		String User_MSG = message;
		try {
//initializeDatabase is a method which connects the program and the database
			Connection conn = DatabaseConnection.initializeDatabase();
			System.out.println("connection done");
			PreparedStatement stmnt = conn.prepareStatement(query);
			stmnt.setInt(1, User_ID);
			stmnt.setString(2, User_MSG);
			stmnt.executeUpdate();
			System.out.println("Message inserted to database with the provided data");

// Close all the connections
			stmnt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("AfterMessage.jsp");
		rd.forward(request, response);
	}
}
