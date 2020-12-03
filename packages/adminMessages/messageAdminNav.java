package adminMessage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class messageAdminNav 
 * 
 * same as messageNav to navigate the admin to select which messages he wants to see
 */
@WebServlet("/messageAdminNav")
public class messageAdminNav extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//uids refer to user id where previously we passed prod id and now we pass user id
		//uids is sent as parameter for that particular user to chat with the admin
		if(request.getParameter("uids")!=null){
			//Redirect to a page which is similar to MessageSelect.jsp shown below.
			//MessageSelect.jsp has to be modified to a page where it is from admin to user or viceversa communications
			//in both line 24 and 28
			response.sendRedirect("MessageSelect.jsp");
			
		}
		else {
			response.sendRedirect("MessageSelect.jsp");
			
		}
		
		
	}

}
