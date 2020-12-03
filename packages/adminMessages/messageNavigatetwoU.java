package adminMessage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class messageNavigatetwoU
 * 
 * same as navigatemessagetwo
 */
@WebServlet("/messageNavigatetwoU")
public class messageNavigatetwoU extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//When the user select contact us he will be redirected
		if( request.getParameter("Contact Us")!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("usid",  request.getParameter("Contact Us"));
//Redirect to a page which is similar to Messagetwo.jsp shown below.
//Messagetwo.jsp has to be modified to a page where it is from admin to user or viceversa communications
		response.sendRedirect("Messagetwo.jsp");
		System.out.println("Opening message box");
		}
		else {
			
			response.sendRedirect("message.jsp");
			System.out.println("Opening message box");
		}
		
	}

}
