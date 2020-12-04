package block;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import PostAd.DatabaseConnection;


//This Servlet allows the Admin to block any user when their Ads are found sus


@WebServlet("/BlockUserProd")
public class BlockUserProd extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String query1 = "UPDATE virtualmart.users u SET u.Active_State = 0 WHERE u.User_ID = (SELECT ap.User_ID FROM virtualmart.ads_posted ap WHERE ap.Prod_ID=?);";
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		int Prod_ID = Integer.parseInt(request.getParameter("Prod_ID"));
		Connection conn = DatabaseConnection.initializeDatabase();
		System.out.println("connection done");
		PreparedStatement stmnt1 = conn.prepareStatement(query1);
		stmnt1.setInt(1, Prod_ID);
		stmnt1.executeUpdate();
		System.out.println("BlockUserProd");
		request.getRequestDispatcher("AdminWelcome.jsp").forward(request, response);
		
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		
		
	}

}
