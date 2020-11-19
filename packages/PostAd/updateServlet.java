package PostAd;
import Show.databaseID;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Show.databaseID;

/**
 * Servlet implementation class updateServlet
 */
@WebServlet("/updateServlet")
public class updateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int a=Integer.valueOf(request.getParameter("Edit Ad"));
		System.out.println(a);
		HttpSession session = request.getSession();
		databaseID did = new databaseID();
		did.getInfo(a);
		System.out.println(did.getInfo(a));
		session.setAttribute("Edit", did.getInfo(a));
		
		
		RequestDispatcher rd = request.getRequestDispatcher("Edit.jsp");
		rd.forward(request, response);
		
		
		
		
	}

}
