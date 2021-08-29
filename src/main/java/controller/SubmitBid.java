package controller;

import java.io.IOException;
import java.util.HashSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;

/**
 * Servlet implementation class SubmitBid
 */
public class SubmitBid extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubmitBid() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		UserDao dbcon = new UserDao();
		System.out.println("kalwdsejglkhdfkgadflkhjlawkjghjawjshgskf");
		int bidAmount = Integer.parseInt(request.getParameter("bidAmount"));
		int productID = Integer.parseInt(request.getParameter("productID"));
		int userID = dbcon.getUserId(request.getParameter("userID"));
		System.out.println("submit bid "+bidAmount+"  "+productID+"  "+userID);
		HashSet<Integer> activeBidders = dbcon.getActiveBidders(productID);
		System.out.println("activeBidders"+activeBidders);
		if(activeBidders.contains(userID))
		{
			dbcon.updateBid(userID, productID, bidAmount);
		}
		else
		{
			dbcon.makeNewBid(userID, productID, bidAmount);
		}
		//dbcon.makeNewBid(userID, productID, bidAmount);
		//response.sendRedirect("biddingPage.jsp?productID="+productID);
	}

}
