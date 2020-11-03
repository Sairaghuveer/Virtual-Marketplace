package valid;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginTest")
public class LoginTest extends HttpServlet {
	LoginValid lov = new LoginValid();
	DatabaseUserID duid = new DatabaseUserID();
	private static final long serialVersionUID = 1L;
 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String User_Name= request.getParameter("User_Name");
		String User_Pass= request.getParameter("User_Pass");
		
		if(lov.check(User_Name, User_Pass)==true) {
			ForUserID Id= duid.getInfo(User_Name);
			HttpSession session = request.getSession();
			session.setAttribute("UserID", Id.User_ID);
			//request.getRequestDispatcher("Postlisting").forward(request, response);
			request.getRequestDispatcher("UserResponse.jsp").forward(request, response); 
		}
		else {
			
			response.sendRedirect("index.jsp");
		}
		
		
			}

}

