package admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import PostAd.seeAdDatabase;

/**
 * Servlet implementation class AdminViewAd
 */

/**
 * This servlet enables the admin to view a posted Ad
 */

@WebServlet("/AdminViewAd")
public class AdminViewAd extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//int prod = Integer.parseInt(request.getParameter("prod_ID"));
		seeAdDatabase sad = new seeAdDatabase();
		HttpSession session = request.getSession();
//The Admin is able to see the ad using the product ID of the selected Ad
		int prod = (int) session.getAttribute("prod_ID");
		session.setAttribute("SeeAd", sad.getInfo(prod));
//The servlet redirects the page to jsp page where the Admin can see an ad posted by the user and can perform other functionalities
		RequestDispatcher rd = request.getRequestDispatcher("AdminViewAd.jsp");
		rd.forward(request, response);
	}
}
