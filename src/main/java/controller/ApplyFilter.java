package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import dao.UserDao;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ApplyFilter
 */
public class ApplyFilter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApplyFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UserDao dbcon = new UserDao();
		if(request.getParameter("clearFilters") != null)
		{
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		else
		{
			List<String> categories = dbcon.getCategories();
			HashSet<String> filteredCategories = new HashSet<>(); 
			List<String> selectedCategories = new ArrayList<>();
			String search = "";
			
			for(int i = 0; i < categories.size(); i++)
			{
				if(request.getParameter(categories.get(i)) != null)
				{
					selectedCategories.add(categories.get(i));
					filteredCategories.add(categories.get(i));
				}
			}
			request.setAttribute("filteredCategories", filteredCategories);
			int price = Integer.parseInt(request.getParameter("priceSlider"));
			request.setAttribute("filteredPrice", price);
			if(request.getParameter("search") != null)
			{
				search = request.getParameter("search");
				request.setAttribute("filteredNameSearch", search);
			}
			List<Product> productList = dbcon.applyFilter(selectedCategories, price, search);
			System.out.println("newList"+productList);
			request.setAttribute("productList", productList);
			System.out.println("Attribute in ApplyFiter"+request.getAttribute("productList"));
			//request.setAttribute("applyFilter","true"); 
			//response.sendRedirect("index.jsp");
			request.getRequestDispatcher("index.jsp?applyfilter=true").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
