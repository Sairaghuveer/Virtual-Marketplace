package valid;


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

import valid.DatabaseConnection;
	// Import Database Connection Class file 


	// Servlet Name 
@WebServlet("/Simple") 
	public class LoginClass extends HttpServlet { 
		private static final long serialVersionUID = 1L; 

			protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
			{ 
				try { 
		
					// Initialize the database 
					Connection con = DatabaseConnection.initializeDatabase(); 
		
					// Create a SQL query to insert data into demo table 
					// demo table consists of two columns, so two '?' is used 
					PreparedStatement stmnt = con.prepareStatement("INSERT INTO virtualmart.users(User_Name, User_Pass, First_Name,Last_Name, Gender,Email, Phone_Number) VALUES(?, ?, ?, ?, ?, ?, ?)"); 
					stmnt.setString(1,request.getParameter("User_Name"));
					stmnt.setString(2,request.getParameter("User_Pass"));
					stmnt.setString(3,request.getParameter("First_Name"));
					stmnt.setString(4,request.getParameter("Last_Name"));
					stmnt.setString(5,request.getParameter("Gender"));
					stmnt.setString(6,request.getParameter("Email"));
					stmnt.setInt(7,Integer.valueOf((request.getParameter("Phone_Number"))));
					
					// to make changes in database 
					stmnt.executeUpdate(); 
						
					// Close all the connections 
					stmnt.close(); 
					con.close(); 
					// Get a writer pointer 
					// to display the successful result 
					response.sendRedirect("Login.jsp");
					//PrintWriter out = response.getWriter(); 
					//out.println("<html><body><b>User account creation successful" + "</b></body></html>"); 
				} 
				catch (Exception e) {
					e.printStackTrace(); 
				} 
		}


	} 
	
	


