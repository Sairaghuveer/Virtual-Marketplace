package adminMessage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class navigateMessageAdmin which naviagtes the admin to a jsp page where admin can reply to user message
 * 
 * same as navigatemessageSeller
 */
@WebServlet("/navigateMessageAdmin")
public class navigateMessageAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(request.getParameter("Message_ID")!=null){
		int Msg_ID=Integer.parseInt(request.getParameter("Message_ID"));
		HttpSession session = request.getSession();
		session.setAttribute("Message_ID", Msg_ID);
//Redirect to a page which is similar to Sellermessage.jsp shown below.
//Sellermessage.jsp has to be modified to a page where it is from admin to user or viceversa communications
		response.sendRedirect("AdminMessage.jsp");
		System.out.println("Opening message box");
	}	

	}

}
