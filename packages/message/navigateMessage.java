package message;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class navigateMessage
 */
@WebServlet("/navigateMessage")
public class navigateMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		if( request.getParameter("Contact Seller")!=null) {
		response.sendRedirect("message.jsp");
		System.out.println("Opening message box");
		}
		else {
			
			response.sendRedirect("message.jsp");
			System.out.println("Opening message box");
		}
		
		
		
	}

}
