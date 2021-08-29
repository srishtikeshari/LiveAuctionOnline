<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List" %>   
    <%@ page import="model.Product" %>
    <%@ page import="java.util.ArrayList" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
    
    
    <script>
	    function checkRegisteredUsers(id)	
	    {	
	    	var username="<%out.print((String)session.getAttribute("username"));%>";	
	    	$.ajax({	
	    		url: "GetRegisteredUsers",	
		    	data:{productID:id, username:username},	
		    	success: function(result){	
		    		console.log(result);	
		    		var l = Object.keys(result).length;	
					var content = '';	
						
						
					for (var i = 0; i < l; i++) {	
		
							content += "<tr><td>"+result[i]+"</td></tr>";		
								
					}	
					$("#registeredUsersTable tbody").html(content)	
		    		$("#registeredUsers").modal('show');	
		    	}	
		    		
	    			
	    	});	
	    }
    
    </script>
    
    
    <div class="modal" id="registeredUsers" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">	
	  <div class="modal-dialog">	
	    <div class="modal-content">	
	      <div class="modal-header">	
	       	
	        <h4 class="modal-title" id="myModalLabel">Registered Users</h4>	
	      </div>	
	      	
	      	
	        <div id="registeredUsersList " style='overflow:auto; height:400px;' class="mt-md-3">	
	                            <div>	
	                              <table id="registeredUsersTable" class="table table-bordered "	
	                                data-reorderable-rows="true" aria-describedby="Registered Users Table">	
	                                <thead class="table-dark">	
	                                  <tr >	
	                                    <th scope="col">	
	                                      User	
	                                    </th>	
	                                  </tr>	
	                                </thead>	
	                                <tbody>	
	                                 	
	                                </tbody>	
	                              </table>	
	                            </div>	
	                          </div>	
	        	
	        	
	      </div>	
		
	    </div>	
	  </div></div>
    
    
    <%@include  file="navbar.html" %>
      <%
      
      String currentUser = (String)session.getAttribute("username");
      request.setAttribute("currentUser",currentUser); %>
      <jsp:include page="/viewmyproducts" />
      <%
       System.out.println("dghgdf"); 
       List<Product> productList = (List<Product>)request.getAttribute("myProductList");
       System.out.println(productList); %>
                    

            <div class="container">
                   
                   		<%
                   		
                 	 	
                 	 	for(int i = 0; i < productList.size(); i++)
                 	 	{
                 	 		Product product = (Product)productList.get(i);
                 	 		%>
                 	 		<div class="card mt-3 shadow p-3 mb-5 bg-white rounded" >
                 	 		
        <div class="row">
            <div class="col-md-4">
                <img class="card-img-top" src="getImage.jsp?id=<% out.print(product.getProductID()); %>" alt="Image <% out.print(product.getProductID()); %>" >
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
                    <button class="btn btn-primary" id="<% out.print(product.getProductID()); %>" onclick="checkRegisteredUsers(this.id)">Check Registered Users</button>
				        
        
                     	 	
                     	 		
                     	 		
           
                     	 		
                   
                      
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
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
	            <!-- MDB -->	
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.2.0/mdb.min.js"></script>
  
 </body>
</html>
 