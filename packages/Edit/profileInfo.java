package edit;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;


import PostAd.DatabaseConnection;


@WebServlet("/profileInfo")
public class profileInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Connection conn = DatabaseConnection.initializeDatabase();
			System.out.println("connection done");
			HttpSession session = request.getSession();
			int UserIDinfo = (int) session.getAttribute("UserID");
			String query1 = "SELECT First_Name, Last_Name, Email, Phone_Number, Gender, User_Name, User_Pass FROM users WHERE User_ID = ?";
			PreparedStatement stmnt1 = conn.prepareStatement(query1);
			stmnt1.setInt(1, UserIDinfo);
			ResultSet rs1 = stmnt1.executeQuery();
			while(rs1.next()) {
				session.setAttribute("First_Name",rs1.getString("First_Name"));
				session.setAttribute("Last_Name", rs1.getString("Last_Name"));
				session.setAttribute("Phone_Number",rs1.getLong("Phone_Number"));
				session.setAttribute("Email",rs1.getString("Email"));
				session.setAttribute("Gender",rs1.getString("Gender"));
				session.setAttribute("User_Name",rs1.getString("User_Name"));
				session.setAttribute("up",rs1.getString("User_Pass"));
			}
			request.getRequestDispatcher("profile.jsp").forward(request, response);
		}catch(Exception e) {
			System.out.println(e);
		}

	}

}
