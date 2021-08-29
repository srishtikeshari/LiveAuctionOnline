<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List" %>
    <%@ page import="model.Product" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="java.time.LocalTime" %>
    <%@ page import="java.text.SimpleDateFormat" %>
    <%@ page import="java.util.Date" %>
    <%@ page import="java.util.HashSet" %>
    <%@ page import="dao.UserDao" %>
    
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel = "stylesheet" type = "text/css" href = "css/bootstrap.min.css">
   
    <!-- Style CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" type="text/css">
    <link rel = "stylesheet" type = "text/css" href = "css/style.css">

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
        
        .animated{
        animation: 1.8s infinite beatHeart
        }
        
        @keyframes beatHeart {
  	        0% {
    transform: scale(1);
  }
  5% {
    transform: scale(1.1);
  }
  10% {
    transform: scale(1);
  }
  15% {
    transform: scale(1.2);
  }
  50% {
    transform: scale(1);
  }
  100% {
    transform: scale(1);
  }
	}
	
      </style>
      <!-- Custom styles for this template -->
      
    <link href="css\navbar.css" rel="stylesheet">
    
     <style>
    
    
		  .sidenav {
		  height: 100%; /* Full-height: remove this if you want "auto" height */
		  width: 15%; /* Set the width of the sidebar */
		  position: fixed;  /*Fixed Sidebar (stay in place on scroll) */
		  top: 57px; /* Stay at the top */
		  left: 0;
		  overflow-x: hidden; /* Disable horizontal scroll */
		  padding-top: 10px;
		  padding:1%;
		  padding-top:1%;
		}
		.product-info{
				  	margin-left:15%;
				  }
				  .searchbutton
				  {
				  	margin-left:15%;
				  }
				  .slidecontainer {
				  width: 100%;
				  
				}
		.navBack{
		z-index:-1;
		background-color:#262626;
		color:#262626;
		position:fixed;
		height:57px;
		top:0px;
		width:15%;
	}


    </style>
    
    
    
    
    <script type="text/javascript">
	    $(document).ready(function(){
	    var slider = document.getElementById('myRange');
	    
	    var output = document.getElementById('demo');
	    console.log("value"+output);
	    output.innerHTML = "0 - "+slider.value; // Display the default slider value
	
	    // Update the current slider value (each time you drag the slider handle)
	    slider.oninput = function() {
	      var val="0 - "+this.value;	
	      output.innerHTML = val;
	      console.log(val);
	    }
	    
	    } ); 
    </script>
    
    
    <title>Online Auction</title>
    

	
	
    
  </head>
  
  
  
  <body>
  <%LocalTime myObj = LocalTime.now();
  System.out.println(myObj); %>
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
      <% if(request.getParameter("applyfilter") == null)
    	{
    	  HashSet<String> hs = new HashSet<>();
    	  request.setAttribute("filteredPrice",100000);
    	  request.setAttribute("filteredCategories",hs);
    	  %>
      		<jsp:include page="/GetProducts" />
      	<%
      	System.out.println("inside if ");
      	} %>
      <%
       List<Product> productList = (List<Product>)request.getAttribute("productList");
       System.out.println(productList);
       int userID = -1;
       if(session.getAttribute("userID") != null)
       {
    	   userID = (Integer)session.getAttribute("userID");
       }
       LocalTime currTime = LocalTime.now();
 		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
 	    Date date = new Date();  
 	    System.out.println(formatter.format(date));
 		System.out.println("current time "+currTime);
       	
       %>
       
       <!-- UI -->
       <div class="navBack" style="background-color: #262626; color:#262626;">ABCDEFGH</div>
       <form action="ApplyFilter">  
<div class="container">
       <div style="display:inline"> 
                  
		<div class="sidenav shadow p-3" style="background-color: #262626; color:white;">
		
		  	<h4>Filters</h4>
		  	
		   	<label class="sidenav_labels" for="exampleFormControlSelect1">Product Category</label><br><br>
                <%
                	
                	UserDao newUser = new UserDao();
                	List<String> categoryList = newUser.getCategories();
                	HashSet<String> filteredCategories = (HashSet<String>)request.getAttribute("filteredCategories");
                	%>
                
                  <%for (int i=0;i<categoryList.size();i++){
                  	if(filteredCategories.contains(categoryList.get(i)))
                  	{%>
                  		<label><input type="checkbox" class="sidenav_names" id="<%out.print(categoryList.get(i));%>" name="<%out.print(categoryList.get(i));%>" value="<%out.print(categoryList.get(i));%>" checked> <%out.print(categoryList.get(i));%></label><br>
   				 	<%}
   				 	else
   				 	{%>
   				 		<label><input type="checkbox" class="sidenav_names" id="<%out.print(categoryList.get(i));%>" name="<%out.print(categoryList.get(i));%>" value="<%out.print(categoryList.get(i));%>"> <%out.print(categoryList.get(i));%></label><br>
   				 	
   				    <%
   				    } %> 
   				 <%} %><br>
   			<label class="sidenav_labels" for="exampleFormControlSelect1" >Price</label><br> 
   				 <div class="slidecontainer">
					  <input type="range" min="1" max="100000" value="<%out.print((int)request.getAttribute("filteredPrice"));%>"  id="myRange" name="priceSlider">
					  <p class="sidenav_names" id="demo" style="color:white;"></p>
					</div><br><br>
					<div class="text-center">
					<button class="btn btn-outline-info" >Apply</button>
					<button class="btn btn-outline-info" name="clearFilters">Clear</button>
					</div>
		</div>
		
		</div>
       </div>
      
      
      <div class = "container">
	  <!------------------------------------search bar ---------------------------------------------------->


      
      
            <div class="row" style="margin-left:5%">
              <div class="col-12">
        <div class="searchbutton">  
        <div class="input-group">      
        <div class="form-outline">
        <%if(request.getAttribute("filterNameSearch") != null)
        { %>          	
        <input class="form-control col-11" style="width: 980px;" id="form1" type="search" aria-label="Search" value=<%out.print(request.getAttribute("filteredNameSearch")); %> name="search"><%}
        else 
        {%>	
        	<input class="form-control col-11" style="width: 980px;" id="form1" type="search"  aria-label="Search" name="search"><%
        } %>
        <label class="form-label" for="form1">Search</label>
        </div>
        <button type="submit" class="btn btn-secondary">
    <i class="fa fa-search"></i>
  </button>
        </div>
        </div>
      </div>
      </div>
      </form>

      <!------------------------------------search bar ends------------------------------------------------->
      <br>
      <div class = "col-md-auto reel" style="margin-left:18%">
      
      <h1 class = "text-center" style= "font-family: sans-sherrif;"> Featured Products</h1>
      
		<div class = "row">
		 <!--Products-->
		 
		 <%
                     	 	
                     	 	for(int i = 0; i < productList.size(); i++)
                     	 	{
                     	 		
                     	 		Product product = (Product)productList.get(i);

              //while((out.print(product.getProductID()))!=(out.print(product.getSellerId()))){
         %>
         
		<div class = "col-md-4 product-grid shadow p-2">
			<div class = "image">
				
					<img src="getImage.jsp?id=<% out.print(product.getProductID()); %>" class="w-100" style="width:200px; height:400px; object-fit:contain;">
					<div class="overlay">
						<div class="detail"><% out.print(product.getProductDescription()); %></div>
					</div>
				
			</div>
			<br>
			<h5 class="text-center pnam"><label class="category"></label> <label ><% out.print(product.getProductName()); %></label></h5>
			<h5 class="text-center ppri"><label class="category" ><b>Bid-Price: &#8377</b></label> <label class="category"><% out.print(product.getProductMinPrice()); %></label></h5>
			<h5 class="text-center pcat"><label class="category"></label><label class="category lcol"><%out.print(product.getCategoryName());%></label></h5>
			<h5 class="text-center pbdate"><label class="category mt-md-3"><b>Bidding Starts On:</b></label> <label class="category"><% out.print(product.getBiddingDate()); %></label>
			<label class="category mt-md-3"><b>, </b></label> <label class="category"><% out.print(product.getStartTime()); %></label><br>
			</h5>
			<h5 class="text-center" style="	font-size:13px; opacity: .8; color:#660928;"><label class="category"></label> <label ><b><%=newUser.getProductRegistrationCount(product.getProductID())%></label> people already registered</b></h5>
			


                              <jsp:include page="/RegisteredProductList">
					                        	<jsp:param name="userID" value="<%=session.getAttribute(\"username\")%>" />
					                        </jsp:include>
					                        
					                       
					                        <button  style="display:none" class ="btn btn-primary mt-md-3 animated">Enter Auction</button>
					                        
					                        
					                        <%
					                        	List<Integer> regProductList = (List<Integer>)request.getAttribute("registeredProductID");
						                        LocalTime start = LocalTime.parse(product.getStartTime());
				                        		LocalTime stop = LocalTime.parse(product.getStopTime());
				                        		System.out.println(start+" stop"+stop);
					                        	if((formatter.format(date).toString().equals(product.getBiddingDate()))   &&   ((start.compareTo(currTime)) < 0 && (stop.compareTo(currTime) > 0)))
					                        	{
					                        		
					                        			%>
					                        				<form action="biddingPage.jsp">
						                        				
						                        				<input type="hidden" value="<%=product.getProductID()%>" name="productID">
						                        				<button class="btn btn-secondary mt-md-3 bid animated" type="submit" style="background-color: #03506f;">Enter Auction</button>
					                        				</form>
					                        			<%
					                        	}
					                        	
					                        	
					                        	else if((formatter.format(date).toString().compareTo(product.getBiddingDate())) > 0 || ((formatter.format(date).toString().equals(product.getBiddingDate())) && stop.compareTo(currTime) < 0))
					                        	{
					                        		%>
					                        		<%
					                        			if(product.getClosingPrice()==null)
					                        			{
					                        		%>
					                        		<button class="btn btn-danger  mt-md-3 bid" disabled="disabled">Auction Ended without any bids</b></button>	
					                        		<%		
					                        			}
					                        			else
					                        			{
					                        		%>
					                        		<button class="btn btn-danger  mt-md-3 bid" disabled="disabled">Auction Ended at <b><u>&#8377 <%=product.getClosingPrice()%></u></b></button>
					                			
					                        	<%
					                        			} 
					                        	}
					                        	
					                        	
					                        	else if(regProductList.contains(product.getProductID()))
					                        	{
					                        %>
					                       
												<button class="btn btn-success  mt-md-3 bid" style="background-color: #03506f;" disabled="disabled">Registered</button>					                   			
					                        
					                        <% } else if(product.getSellerId() == userID) { %>
					                        
												<button class="btn btn-primary  mt-md-3 bid" style="background-color: #03506f;" disabled="disabled">Own Product</button>					                   			
					                        
					                        <% } else if(session.getAttribute("username") != null) { %>
					                        	
												<form action = "RegForProducts" method="post">
					                         		<button class="btn btn-success  mt-md-3 bid" style="background-color: #03506f;" id="<%=product.getProductID()%> ">Register</button>
					                        		<input type='hidden' name='productID' value="<%=product.getProductID()%>">
					                        	</form>						                   			
					                        <%}else{
					                        %>
					                        
					                        	<button class="btn btn-danger  mt-md-3 bid" disabled="disabled" style="background-color: #03506f;">Register</button>
					                        
					                        <% } %>
					        
                      </div>
      
      
      
      
      
       		<% 
              // }
                     	 	}
                     	 %>
      		</div>
      </div>
      </div>
      <!---------------------------------------------------------------------------------------------------->
          
          <!-- UI -->

  
   <!-- Optional JavaScript; choose one of the two! -->
   <div style="height:400px"></div>
   <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
   <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
            <!-- MDB -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.2.0/mdb.min.js"></script>

  
 </body>
</html>
 