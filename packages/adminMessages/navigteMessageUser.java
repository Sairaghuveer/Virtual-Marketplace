package adminMessage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class navigteMessageUser
 * 
 * same as navigatemessage
 */
@WebServlet("/navigteMessageUser")
public class navigteMessageUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if( request.getParameter("Contact Us")!=null) {
//Redirect to a page which is similar to ContactAdmin.jsp page where users can enter their message
		response.sendRedirect("ContactAdmin.jsp");
		System.out.println("Opening message box");
		}
	}

}
