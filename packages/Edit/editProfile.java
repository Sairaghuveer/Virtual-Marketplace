package edit;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import PostAd.DatabaseConnection;


@WebServlet("/editProfile")
public class editProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Connection conn = DatabaseConnection.initializeDatabase();
			System.out.println("connection done");
			HttpSession session = request.getSession();
			int UserIDinfo = (int) session.getAttribute("UserID");
			String updFirst_Name = request.getParameter("updFirst_Name");
			String updLast_Name = request.getParameter("updLast_Name");
			String updEmail = request.getParameter("updEmail");
			long updPhone_Number = Long.parseLong(request.getParameter("updPhone_Number"));
			String updUser_Name = request.getParameter("updUser_Name");
			String updup = request.getParameter("updup");

			String query1 = "UPDATE virtualmart.users SET First_Name = ?, Last_Name = ?, Email = ?, Phone_Number = ?, User_Name = ?, User_Pass = ? WHERE User_ID = ?";
			PreparedStatement stmnt1 = conn.prepareStatement(query1);
			stmnt1.setString(1, updFirst_Name);
			stmnt1.setString(2, updLast_Name);
			stmnt1.setString(3, updEmail);
			stmnt1.setLong(4, updPhone_Number);
			stmnt1.setString(5, updUser_Name);
			stmnt1.setString(6, updup);
			stmnt1.setInt(7, UserIDinfo);

			stmnt1.executeUpdate();
			request.getRequestDispatcher("UserResponse.jsp").forward(request, response);

		}catch(Exception e) {
			System.out.println(e);
		}

	}

}