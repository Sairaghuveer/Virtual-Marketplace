package delete;

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
import message.MessageInterfaceBean;

@WebServlet("/DeleteAd")
public class DeleteAd extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String query1 = "delete m, ap from ads_posted ap LEFT JOIN messages m on m.Prod_ID = ap.Prod_ID where ap.Prod_ID = ?;";
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int Prod_ID= Integer.parseInt(request.getParameter("Prod_ID"));
		try {
			Connection conn = DatabaseConnection.initializeDatabase();
			System.out.println("connection done");
			PreparedStatement stmnt1 = conn.prepareStatement(query1);
			stmnt1.setInt(1, Prod_ID);
			int rs1 = stmnt1.executeUpdate();
				
		
			RequestDispatcher rd = request.getRequestDispatcher("Delete.jsp");
			rd.forward(request, response);

			// Close all the connections
			stmnt1.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
