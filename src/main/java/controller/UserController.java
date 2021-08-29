package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import model.User;

/**
 * Servlet implementation class UserController
 */
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String username = (String)request.getParameter("username");
		String password = (String)request.getParameter("password");
		System.out.println(username+" "+password);
		String[] url = request.getHeader("referer").split(" ");
		UserDao dbcon  = new UserDao();
		boolean authorized = dbcon.checklogin(username, password);
		if(authorized)
		{
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			int userID = dbcon.getUserId(username);
			session.setAttribute("userID", userID);
			//System.out.println(url[url.length-1]+"?authorize=yes");
			//System.out.println(url[url.length-1].split("\\?")+" "+url[url.length-1].split("\\?").length);
			//System.out.println(url[url.length-1]+"?authorize=yes");
			
			if(url[url.length-1].split("\\?").length > 1)
			{
				String newURL = url[url.length-1].split("\\&")[0].replace("authorize=no", "");
				response.sendRedirect(newURL+"&authorize=yes");
			}
			else
			{
				response.sendRedirect(url[url.length-1]+"?authorize=yes");
			}
		}
		else
		{
			if(url[url.length-1].split("\\?").length > 1)
			{
				String newURL = url[url.length-1].split("\\&")[0].replace("authorize=no", "");
				response.sendRedirect(newURL+"&authorize=no");
			}
			else
			{
				response.sendRedirect(url[url.length-1]+"?authorize=no");
			}
		}
	}

}


























