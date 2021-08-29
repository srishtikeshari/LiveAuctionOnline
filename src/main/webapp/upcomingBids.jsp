<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List" %>
    <%@ page import="model.Product" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="java.time.LocalTime" %>
    <%@ page import="java.text.SimpleDateFormat" %>
    <%@ page import="java.util.Date" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" type="text/css">
    <!-- MDB -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.2.0/mdb.min.css" rel="stylesheet" />
    <style>
        .bd-placeholder-img {
          font-size: 1.125rem;
          text-anchor: middle;
          -webkit-user-select: none;
          -moz-user-select: none;
          -ms-user-select: none;
          user-select: none;
        }
  
        @media (min-width: 768px) {
          .bd-placeholder-img-lg {
            font-size: 3.5rem;
          }
        }
      </style>
      <!-- Custom styles for this template -->
      
    <link href="css\navbar.css" rel="stylesheet">
    <title>Welcome!</title>
  </head>
  <body>
   <%
   			System.out.println(session.getAttribute("username"));
        try {
                String n = null;
                if (request.getParameter("authorize") != null) 
                {
                    n = request.getParameter("authorize");
                    if (n.equals("yes")) 
                    {
                    	System.out.println("username"+(String)session.getAttribute("username"));
       				 	%>
        					<script>alert("Welcome");</script>
        					
       				 	<%
                	}
                    else
                    {
                    	%>
    						<script>alert("Incorrect username or password");</script>
   				 		<%
                    }
            	}
                if (request.getParameter("registered") != null) 
                {
                    n = request.getParameter("registered");
                    if (n.equals("true")) 
                    {
       				 	%>
        					<script>alert("You are successfuly Registered!");</script>
       				 	<%
                	}
                    else
                    {
                    	%>
    						<script>alert("An error occurred. Please try again.");</script>
   				 		<%
                    }
            	}
                
                if (request.getParameter("prodreg") != null) 
                {
                    n = request.getParameter("prodreg");
                    if (n.equals("true")) 
                    {
       				 	%>
        					<script>alert("Product Added Successfully!");</script>
       				 	<%
                	}
                    else
                    {
                    	%>
    						<script>alert("An error occurred. Please try again.");</script>
   				 		<%
                    }
            	}
                
            } catch (Exception e) {
                out.println(e);
            }
        %>
        
        
        
    <script>
    
    $(document).ready(function()
            {
          var s="HGHG";     
           s="<%out.print(session.getAttribute("username"));%>";
           console.log(s);
                if(s=="null")
                {
                    //alert("ksd");
                    document.getElementById("signinbutton").style.display="inline";
                }
                else    
               	{
                   document.getElementById("signinbutton").style.display="none";
                    document.getElementById("drop").style.display="inline";
                    
                }
            });
    
    
    </script>
    <%@include  file="navbar.html" %>  
      <%
      String currentUser = (String)session.getAttribute("username");
      request.setAttribute("currentUser",currentUser); %>
      <jsp:include page="/MyUpcomingBids" />
      <%
      System.out.println("Kaito");
       List<Product> productList = (List<Product>)request.getAttribute("myUpcomingBids");
       System.out.println(productList);
       LocalTime currTime = LocalTime.now();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
	    Date date = new Date();  
	    System.out.println(formatter.format(date));
		System.out.println("current time "+currTime);
       
       %>
                    

      
            <div class="container">
                   
                   		<%
                   		
                 	 	
                 	 	for(int i = 0; i < productList.size(); i++)
                 	 	{
                 	 		Product product = (Product)productList.get(i);
                 	 		%>
                 	 		<div class="card mt-3 shadow p-3 mb-5 bg-white rounded" >
        <div class="row">
            <div class="col-md-4">
                <img class="card-img-top" src="getImage.jsp?id=<% out.print(product.getProductID()); %>" alt="Card image cap" >
            </div>
        
        <div class="col-md-5 ">
            <div class="container">
                <label class="category"><b>Name:</b></label> <label ><% out.print(product.getProductName()); %></label><br>
                <label class="category"><b>Category:</b></label> <label class="category"><% out.print(product.getProductName()); %></label><br>
                
                <label class="category "><b>Description:</b></label> <div style='overflow:auto; width:400px;height:120px;'><% out.print(product.getProductDescription()); %></div>                
              </div>
              </div>
              <div class="col-md-3 ">
                <div class="container">
                    
                    <label class="category" ><b>Bid-price:</b></label> <label class="category"><% out.print(product.getProductMinPrice()); %></label><br>
                    <label class="category mt-md-3"><b>Bidding date:</b></label> <label class="category"><% out.print(product.getBiddingDate()); %></label><br>
                    <label class="category mt-md-3"><b>Start Time:</b></label> <label class="category"><% out.print(product.getStartTime()); %></label><br>
                    
				     <%   
        
                     if(formatter.format(date).toString().equals(product.getBiddingDate()))
					                        	{
					                        		LocalTime start = LocalTime.parse(product.getStartTime());
					                        		LocalTime stop = LocalTime.parse(product.getStopTime());
					                        		if((start.compareTo(currTime)) < 0 && (stop.compareTo(currTime) > 0))
					                        		{
					                        			%>
					                        			<form action="biddingPage.jsp">
					                        				<button class="btn btn-secondary  mt-md-3">Enter Auction</button>
					                        				<input type="hidden" value="<%=product.getProductID()%>" name="productID">
					                        			</form>
					                        			<%
					                        		}
					                        	}	 	
                     	 		
                     	 		
           
				     %>  		
                   
                      
              </div>
            </div>
          </div></div>
          <% 
                     	 	}
                     	 %>
                     	 </div>

  
   <!-- Optional JavaScript; choose one of the two! -->
   <div style="height:400px"></div>
   <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
   <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
            <!-- MDB -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.2.0/mdb.min.js"></script>

  
 </body>
</html>
 