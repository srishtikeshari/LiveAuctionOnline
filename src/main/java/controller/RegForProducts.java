package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import dao.UserDao;

/**
 * Servlet implementation class RegForProducts
 */


public class RegForProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegForProducts() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int productID = Integer.valueOf(request.getParameter("productID"));
		int userID = (int) request.getSession().getAttribute("userID");
		//System.out.print(productID + " " + userID);
		
		UserDao dbcon = new UserDao();
		
		int result = dbcon.addRegisterationRecord(userID, productID);
		
		String toAddress = dbcon.getUserEmail(userID);	
		String name = dbcon.getName(userID);
		String productName = dbcon.getProductName(productID);
		String biddingDate = dbcon.getBiddingDate(productID);
		String biddingTime = dbcon.getBiddingTime(productID);		
		String mailSubject = "OnlineAuction- Auction participation confirmed";
		String mailBody = "Dear " + name + ","
				+ "<br/><br/>Thank you for showing interest in participating in the auction of \""
				+ productName + "\"."
				+ "<br/><br/>The date and timing of the auction is as below: "
				+ "<br/> <b> Date: </b>"+ biddingDate + "<br/> <b>Time: </b>" + biddingTime +"</b>"
				+ "<br/><br/>Please note that the auction shall last for 10 minutes and shall begin automatically"
				+ "at the time mentioned above. We recommend you to login into the portal"
				+ " 5 minutes before the bidding time to avoid the last-minute hassle."
				+ " Make sure you have steady internet connection throughout the "
				+ "process so that you can secure your bid properly."
				+ "<br/><br/>Should you have any questions or feedback, do not hesitate to write us "
				+ "by replying to this mail.";
		
		SendEmail ProdRegMail = new SendEmail(toAddress, mailSubject, mailBody);
		
		PrintWriter out = response.getWriter();
		if(result != -1)
		{
			response.sendRedirect("index.jsp");
		}
		else 
		{
			out.print("Something went wrong");
		}
			
		
		
	}

}
