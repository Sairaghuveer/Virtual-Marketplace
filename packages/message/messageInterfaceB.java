package message;
import java.util.ArrayList;
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
import java.util.List;
import java.util.Collections;

import PostAd.DatabaseConnection;

@WebServlet("/messageInterfaceB")
public class messageInterfaceB extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String query1 = "SELECT DISTINCT Seller_ID, Prod_ID FROM virtualmart.messages WHERE Buyer_ID = ?";
	String query2 = "SELECT u.User_Name, ap.Prod_Name FROM users u JOIN ads_posted ap "
			+ "ON u.User_ID = ap.User_ID WHERE ap.Prod_ID = ? AND ap.User_ID = ?";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		int Buyer_ID = (int) session.getAttribute("UserID");
		try {
			Connection conn = DatabaseConnection.initializeDatabase();
			System.out.println("connection done");
			PreparedStatement stmnt1 = conn.prepareStatement(query1);
			PreparedStatement stmnt2 = conn.prepareStatement(query2);
			stmnt1.setInt(1, Buyer_ID);
			ResultSet rs1 = stmnt1.executeQuery();
			ArrayList<MessageInterfaceBean> mib1 = new ArrayList<MessageInterfaceBean>();
			while (rs1.next()) {
				stmnt2.setInt(1, rs1.getInt("Prod_ID"));
				stmnt2.setInt(2, rs1.getInt("Seller_ID"));
				ResultSet rs2 = stmnt2.executeQuery();
				if(rs2.next()) {
				System.out.println("in while");
				mib1.add(new MessageInterfaceBean(rs2.getString("User_Name"),rs2.getString("Prod_Name"),rs1.getInt("Seller_ID"),rs1.getInt("Prod_ID")));
			System.out.println(mib1);
			}
			}
			session.setAttribute("MsgB", mib1);
			
			RequestDispatcher rd = request.getRequestDispatcher("MsgB.jsp");
			rd.forward(request, response);

			// Close all the connections
			stmnt1.close();
			stmnt2.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}