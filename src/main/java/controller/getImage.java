package controller;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Blob;
import java.sql.Connection;

/**
 * Servlet implementation class getImage
 */
public class getImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getImage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		 
//		String connectionURL = "jdbc:mysql://localhost:3307/onlineauction";
		String connectionURL = "jdbc:mysql://localhost:3306/onlineauction";
		String user = "root";
		String pass = "";

System.out.println("get image servelet called ");
		Connection con = null;
		 
		try{
		    Class.forName("com.mysql.jdbc.Driver");
		    con = (Connection) DriverManager.getConnection(connectionURL, user, pass);
		    
		    PreparedStatement ps = con.prepareStatement("select productPicture,productName from product where productID=?");
		    ps.setString(1, id);
		    ResultSet rs = ps.executeQuery();
		 
		    if(rs.next()){
		    	System.out.println("getImageJSP Name = "+rs.getString("productName"));
		        Blob blob = (Blob) rs.getBlob("productPicture");
		        byte byteArray[] = blob.getBytes(1, (int)blob.length());
		 
		        response.setContentType("image/gif");
		        OutputStream os = response.getOutputStream();
		        os.write(byteArray);
		        os.flush();
		        os.close();
		    }
		}
		catch(Exception e){
		    e.printStackTrace();
		}   
		finally{
		    if(con != null){
		        try{
		            con.close();
		        }
		        catch(Exception e){
		            e.printStackTrace();
		        }
		    }
		}
	}

}
