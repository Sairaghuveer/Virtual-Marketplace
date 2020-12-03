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
import java.util.List;
import java.util.ArrayList;
import java.util.Collections;

import PostAd.DatabaseConnection;
/**
 * Servlet implementation class messageInterfaceA to be used as for admin personal only
 * 
 * same as messageInterfaceS
 * 
 * No messageInterfaceB like file or servlet is there because no need to loop to a user as there
 * is only one admin(seller)
 */
@WebServlet("/messageInterfaceA")
public class messageInterfaceA extends HttpServlet {
	private static final long serialVersionUID = 1L;

	String query1 = "SELECT distinct(User_ID) FROM virtualmart.admin_messages WHERE Admin_ID = 2";
//Obtain all the userIds who contacted the admin
	String query2 = "SELECT distinct(u.User_Name), u.User_ID FROM virtualmart.users u JOIN virtualmart.admin_messages m ON u.User_ID = m.User_ID WHERE m.User_ID = ?;";
//Obtain all the usernames and userIds who contacted the admin from the db
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
//initializeDatabase is a method which connects the program and the database			
			Connection conn = DatabaseConnection.initializeDatabase();
			System.out.println("connection done");
			HttpSession session = request.getSession();
			PreparedStatement stmnt1 = conn.prepareStatement(query1);
			PreparedStatement stmnt2 = conn.prepareStatement(query2);
			ResultSet rs1 = stmnt1.executeQuery();
			ArrayList<AdminUser> amb1 = new ArrayList<AdminUser>();
			while (rs1.next()) {
				System.out.println("in while");
				stmnt2.setInt(1, rs1.getInt("User_ID"));
				System.out.println(rs1.getInt("User_ID"));
				ResultSet rs2 = stmnt2.executeQuery();
				if(rs2.next()) {
				System.out.println(rs2.getString("User_Name"));
				amb1.add(new AdminUser(rs2.getString("User_Name"), rs2.getInt("User_ID")));
				System.out.println(amb1);
			}}
			
//Set the Attribute from MsgS to MsgA as what was done in the messaging for buyer and seller

			session.setAttribute("MsgA", amb1);
			System.out.println("MsgA");
//Change the redirecting page to what it wil be like between admin and user
			RequestDispatcher rd = request.getRequestDispatcher("MsgA.jsp");
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
