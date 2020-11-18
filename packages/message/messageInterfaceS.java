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
import java.util.List;
import java.util.ArrayList;
import java.util.Collections;

import PostAd.DatabaseConnection;

@WebServlet("/messageInterfaceS")
public class messageInterfaceS extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String query1 = "SELECT distinct(Buyer_ID), Prod_ID FROM virtualmart.messages WHERE Seller_ID = ?";
	String query2 = "SELECT distinct(u.User_Name), ap.Prod_Name FROM virtualmart.users u "
			+ "JOIN virtualmart.messages m ON u.User_ID = m.Buyer_ID JOIN virtualmart.ads_"
			+ "posted ap ON ap.Prod_ID = m.Prod_ID WHERE m.Prod_ID = ? AND m.Buyer_ID = ?";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		int Seller_ID = (int) session.getAttribute("UserID");
		System.out.println(Seller_ID);
		try {
			Connection conn = DatabaseConnection.initializeDatabase();
			System.out.println("connection done");
			PreparedStatement stmnt1 = conn.prepareStatement(query1);
			PreparedStatement stmnt2 = conn.prepareStatement(query2);
			stmnt1.setInt(1, Seller_ID);
			ResultSet rs1 = stmnt1.executeQuery();
			ArrayList<MessageInterfaceBean> mib1 = new ArrayList<MessageInterfaceBean>();
			while (rs1.next()) {
				System.out.println("in while");
				stmnt2.setInt(1, rs1.getInt("Prod_ID"));
				System.out.println(rs1.getInt("Prod_ID"));
				
				stmnt2.setInt(2, rs1.getInt("Buyer_ID"));
				System.out.println(rs1.getInt("Buyer_ID"));
				ResultSet rs2 = stmnt2.executeQuery();
				if(rs2.next()) {
				System.out.println(rs2.getString("User_Name"));
				mib1.add(new MessageInterfaceBean(rs2.getString("User_Name"),rs2.getString("Prod_Name"),rs1.getInt("Buyer_ID"),rs1.getInt("Prod_ID")));
				System.out.println(mib1);
			}}
			
			session.setAttribute("MsgS", mib1);
			System.out.println("MsgS");
			RequestDispatcher rd = request.getRequestDispatcher("MsgS.jsp");
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