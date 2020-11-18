package message;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class navigateMessageSeller
 */
@WebServlet("/navigateMessageSeller")
public class navigateMessageSeller extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(request.getParameter("Message_ID")!=null){
			int Msg_ID=Integer.parseInt(request.getParameter("Message_ID"));
			HttpSession session = request.getSession();
			session.setAttribute("Message_ID", Msg_ID);
			response.sendRedirect("Sellermessage.jsp");
			System.out.println("Opening message box");
		}
				
		
	}

}
