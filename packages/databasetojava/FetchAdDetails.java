package databasetojava;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Servlet implementation class FetchAdDetails
 */
@WebServlet("/FetchAdDetails")
public class FetchAdDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String ProductName= request.getParameter("Prod_Name");
		FetchAdConnect fac = new FetchAdConnect();
		List<DisplayInfo> da=fac.getInfo(ProductName);
		request.setAttribute("AdData", da);
		
		RequestDispatcher rd = request.getRequestDispatcher("ShowAds.jsp");
		rd.forward(request, response);
		
		
	}

}
