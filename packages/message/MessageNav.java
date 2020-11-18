package message;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MessageNac
 */
@WebServlet("/MessageNav")
public class MessageNav extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		if(request.getParameter("Prod_ID")!=null){
			response.sendRedirect("MessageSelect.jsp");
			
		}
		else {
			response.sendRedirect("MessageSelect.jsp");
			
		}
		
		
	}

}
