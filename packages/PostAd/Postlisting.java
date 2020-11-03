package PostAd;



import java.io.IOException; 
import java.io.PrintWriter; 
import java.sql.Connection; 
import java.sql.PreparedStatement; 

import javax.servlet.ServletException; 
import javax.servlet.annotation.WebServlet; 
import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import PostAd.DatabaseConnection;
// Import Database Connection Class file 

import Validate.LoginClass;
// Servlet Name 
@WebServlet("/Postlisting") 
public class Postlisting extends HttpServlet { 
	private static final long serialVersionUID = 1L; 

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
		{ 
			try { 
	
				// Initialize the database 
				Connection con = DatabaseConnection.initializeDatabase(); 
				HttpSession session = request.getSession();
				int UserIDinfo=(int) session.getAttribute("UserID");
				// Create a SQL query to insert data into demo table 
				// demo table consists of two columns, so two '?' is used 
				PreparedStatement stmnt = con.prepareStatement("INSERT INTO ads_posted(Prod_Name, Prod_Description, Prod_Price, Category_Name, Loc_ID, Item_Condition_ID, User_ID) VALUES(?, ?, ?, ?, ?, ?, ?)"); 
				stmnt.setString(1,request.getParameter("Prod_Name"));
				stmnt.setString(2,request.getParameter("Prod_Description"));
				stmnt.setInt(3,Integer.valueOf(request.getParameter("Prod_Price")));
				stmnt.setString(4,request.getParameter("Category_Name"));
				String checkLoc = request.getParameter("Loc_ID");
				String checkItem = request.getParameter("Item_Condition_ID");
				if (checkLoc.equals("Montreal")){
					int loc =1;
					stmnt.setInt(5, loc);
				}
				else {
					int loc =2;
					stmnt.setInt(5,loc);
				}
				if (checkItem.equals("New")){
					int Item =1;
					stmnt.setInt(6, Item);
				}
				else {
					int Item =2;
					stmnt.setInt(6,Item);
				}
				
				stmnt.setInt(7,UserIDinfo);
				//stmnt.setInt(7,Integer.valueOf(request.getParameter("Phone_Number")));
				
				// to make changes in database 
				stmnt.executeUpdate(); 
					
				// Close all the connections 
				stmnt.close(); 
				con.close(); 
	
				// Get a writer pointer 
				// to display the successful result 
				
				//HttpSession session = request.getSession();
				session.setAttribute("ProductName", request.getParameter("Prod_Name"));
				session.setAttribute("Prod_Description", request.getParameter("Prod_Description"));
				session.setAttribute("Category_Name", request.getParameter("Category_Name"));
				session.setAttribute("Item_Condition_ID", request.getParameter("Item_Condition_ID"));
				session.setAttribute("Item_Condition_ID", request.getParameter("Item_Condition_ID"));
				session.setAttribute("Loc_ID", request.getParameter("Loc_ID"));
				request.getRequestDispatcher("AdDetails.jsp").forward(request, response); 
				
				//PrintWriter out = response.getWriter(); 
				//out.println("<html><body><b>Ad posting successful" + "</b></body></html>"); 
			} 
			catch (Exception e) {
				e.printStackTrace(); 
			} 
	}

} 




