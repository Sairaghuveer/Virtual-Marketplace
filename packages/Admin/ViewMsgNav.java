package admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 * This Servlet is used to navigate the user to view an Ad
 */


@WebServlet("/ViewMsgNav")
public class ViewMsgNav extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int UserID=(int) session.getAttribute("UserID");
// The user Id is obtained from the session and the product id is obtained from the jsp page
		int prod_ID = Integer.parseInt(request.getParameter("prod_ID"));
		session.setAttribute("prod_ID", prod_ID);
//The UserId is checked whether the user is an Admin or a User and is redirected accordingly
		if(UserID==2) {
			request.getRequestDispatcher("AdminViewAd.jsp").forward(request, response);
				
		}
		else {
			request.getRequestDispatcher("ViewAd.jsp").forward(request, response);
		}
		
		
		
		
	}

}
