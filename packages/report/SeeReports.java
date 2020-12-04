package report;

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

import PostAd.DatabaseConnection;
@WebServlet("/SeeReports")

/*
 * this servlet obtaines the reports from db and shows it to the admin by redirecting the admin to a 
 */
public class SeeReports extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FetchReports FR = new FetchReports();
		HttpSession session = request.getSession();
		System.out.println(FR.getInfo());
//setting the FR.getInfo() so the reports can be displayed on the jsp page		
		session.setAttribute("ViewReport", FR.getInfo());
//Redirect to a page where Ads are shown to the Admin		
		RequestDispatcher rd = request.getRequestDispatcher("ViewReports.jsp");
		rd.forward(request, response);
		
		
		
	}
}