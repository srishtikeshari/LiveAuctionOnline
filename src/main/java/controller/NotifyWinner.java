package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import model.Product;
/**
 * Servlet implementation class NotifyWinner
 */
public class NotifyWinner extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NotifyWinner() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UserDao dbcon = new UserDao();
		System.out.println("In Notify Winner");
		int productID = Integer.parseInt(request.getParameter("productID"));
		Product product = dbcon.getProductInfo(productID);
		String productName = product.getProductName();
		String productClosingPrice = product.getClosingPrice();
		String winnerID = product.getWinnerID();
		String winnerName = dbcon.getName(Integer.valueOf(winnerID));
		String winnerMailID = dbcon.getUserEmail(Integer.valueOf(winnerID));
		
		int sellerID = product.getSellerId();		
		String sellerMailID = dbcon.getUserEmail(sellerID);		
		String sellerName = dbcon.getName((sellerID));
		
		String mailSubjectWinner = "You made it!";
		
		String mailBodyWinner = "Congratulations "+winnerName+"!"
				+ "<br/><br/>We are happy to inform you that your bid for <b><i>"+ productName+ "</i></b> was at the top and you "
						+ "are now eligible to claim your right on the same. Here are the "
						+ "details of its seller- "
						+ "<br/><br/><b>Name: </b>"+ sellerName
						+ "<br/><b>Email-ID: </b>"+ sellerMailID
						+ "<br/><b>Bid Amount: </b>Rs. "+ productClosingPrice
				+ "<br/><br/>You can get in touch with the seller mentioned above and "
				+ "arrange for the further transactions. <b><i>OnlineAuction</i></b> shall <b>not "
				+ "be responsible</b> after this point for any further inconveniences encountered by "
				+ "either of the selling or buying parties."
				+ "<br/><br/>We hope you had a good experience bidding with us and we will try our best"
				+ " to just improve it more and more. For any suggestions or feedback, do not hesitate"
				+ " to write to us on this mail ID- onlineauctionooad@gmail.com.";
		
		String mailSubjectSeller = "You sold it!";	
		
		String mailBodySeller = "Congratulations "+sellerName+"!"
				+ "<br/><br/>We are happy to inform you that your <b><i>"+ productName+ "</i></b> that you had put on auction "
						+ "just got sold! Here are the "
						+ "details of its winner- "
						+ "<br/><br/><b>Name: </b>"+ winnerName
						+ "<br/><b>Email-ID: </b>"+ winnerMailID
						+ "<br/><b>Bid Amount: </b>"+ "Rs. "+ productClosingPrice
				+ "<br/><br/>You can get in touch with the winner mentioned above and "
				+ "arrange for the further transactions. <b><i>OnlineAuction</i></b> shall <b>not "
				+ "be responsible</b> after this point for any further inconveniences encountered by "
				+ "either of the selling or buying parties."
				+ "<br/><br/>We hope you had a good experience bidding with us and we will try our best"
				+ " to just improve it more and more. For any suggestions or feedback, do not hesitate"
				+ "to write to us on this mail ID- onlineauctionooad@gmail.com.";
		
		SendEmail winMailToSeller = new SendEmail(sellerMailID, mailSubjectSeller, mailBodySeller);
		SendEmail winMailToWinner = new SendEmail(winnerMailID, mailSubjectWinner, mailBodyWinner);
		
		//doGet(request, response);
	}

}
