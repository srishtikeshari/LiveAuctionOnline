package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import model.User;

/**
 * Servlet implementation class registerController
 */
public class registerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatch = request.getRequestDispatcher("registration.jsp");
		dispatch.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = (String)request.getParameter("username");
		String password = (String)request.getParameter("password");
		String name = (String)request.getParameter("name");
		int pincode  = Integer.parseInt((String)request.getParameter("pincode"));
		String country = (String)request.getParameter("country");
		String state = (String)request.getParameter("state");
		String city = (String)request.getParameter("city");
		String street = (String)request.getParameter("street");
		String birthdate = (String)request.getParameter("birthdate");
		String contactno = (String)request.getParameter("contactno");
		String email = (String)request.getParameter("email");
		//userId auto increment
		
		User user = new User();
		user.setBirthdate(birthdate);
		user.setCity(city);
		user.setContactNo(contactno);
		user.setCountry(country);
		user.setEmail(email);
		user.setName(name);
		user.setPassword(password);
		user.setPincode(pincode);
		user.setState(state);
		user.setStreet(street);
		user.setUsername(username);
		
		UserDao dbcon = new UserDao();
		int result = dbcon.registeruser(user);
		
		String mailSubject = "Registration Successful";
		String mailBody = "Dear " + name 
        		+ ",<br/><br/>" + "Thank you for"
        		+ " registering at our <b><i>OnlineAuction</i></b> portal!"
        		+ "<br/><br/>You can now use this portal to its full potential. Here is how-"
        		+ "<br/><br/>" + "Interested in buying some of the listed products?"
        		+ "<br/>" + "You can participate in the auction of the product that you are "
        		+ "interested in by clicking on the \"Register\" button "
        		+ "given next to the product description."
        		+ "<br/><br/>" + "Interested in putting your product(s) on auction?"
        		+ "<br/>" + "You can click on the \"Add Product\" button visible in the top of the website"
        		+ " and fill in the necessary product details. This makes your product visible in the "
        		+ "\"Upcoming Bids\" section of the portal so that the interested buyers can register fot it."
        		+ "<br/><br/>Should you have any questions or feedback, "
        		+ "do not hesitate to write us by replying to this mail.";
		
		SendEmail regMail = new SendEmail(email, mailSubject, mailBody);
		
		HttpSession session = request.getSession();
		session.setAttribute("username", username);
		int userID = dbcon.getUserId(username);
		session.setAttribute("userID", userID);
		if(result < 1)
		{
			response.sendRedirect("index.jsp?registered=false");
		}
		else
		{
			response.sendRedirect("index.jsp?registered=true");
		}
	}

}
