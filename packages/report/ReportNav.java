package report;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ReportNav")
/*
 * this servlet is used to navigate the user where the reason for reporting the ad can be selected
 */
public class ReportNav extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		int Prod_ID =Integer.parseInt(request.getParameter("Report"));
//Setting the prodId in session so it can be used to enter details into db in ReportAd.java		
		session.setAttribute("Prod_ID", Prod_ID);
//Redirect to page where reporting reason can be selected		
		response.sendRedirect("Report.jsp");
	}

}
