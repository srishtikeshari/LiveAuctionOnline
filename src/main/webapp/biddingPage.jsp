<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List" %>   
    <%@ page import="model.Product" %>
    <%@ page import="java.util.ArrayList" %>
     <%@ page import="java.time.LocalTime" %>
     <%@ page import=" static java.time.temporal.ChronoUnit.MINUTES"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- <meta http-equiv="refresh" content="35"> -->

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
        
        .timer{
        		
        		height: 40px;
                width: 280px;
                background-image: linear-gradient(#1266f1, #1266f1);
                /* box-shadow: inset 0 0 10px #0000000; */
                color: white;
                border: 4x solid black;
                line-height: 40px;
                text-align:center;
                font-size: 27px;
                border-radius: 4px;
                /* margin-top: 0px; */
                /* box-shadow: 1px 1px 0px #000,
                2px 2px 0px #000,
                3px 3px 0px #000,
                4px 4px 0px #000,
                5px 5px 0px #000,
                6px 6px 0px #000; */
        }
        
        .partition1{
        	height: 40px;   
        }
        .timer-text{
        	font-size: 18px;
        	text-align: center;
        	margin-top: 110px;
        	font-weight: bold;
        }
        
        .centerBid
        {
        	margin-left:7px;
        	margin-right:7px;
        }
        
        .sideBox
        {
        	background-color:gainsboro;
        }
        #prodDescBox{
        min-height:110px;
        
        }
        
        input[type="text"]:disabled{background-color:white;}
        
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
        
    <%
    	int userID = -1;
	    if(session.getAttribute("userID") != null)
	    {
	 	   userID = (Integer)session.getAttribute("userID");
	    }
	    int productID = 0;
    	Product product;
    	String pName="";
    	String pDesc="";
    	int bBasePrice=0;
    	String pEndTime="";
    	int sellerID = -1;
		if (request.getParameter("productID") != null)
	    {  
	          productID = Integer.valueOf(request.getParameter("productID"));
	          UserDao userDao = new UserDao();
	          product = userDao.getProductInfo(productID);
	          pName = product.getProductName();
	          pDesc = product.getProductDescription();
	          bBasePrice = product.getProductMinPrice();
	          pEndTime = product.getStopTime();
	          sellerID = product.getSellerId();
	   }
	   System.out.println("bBasePrice="+bBasePrice);
    	
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
                
                //Product Info Set
                
                var prodName="<%out.print(pName);%>";
                var prodDesc="<%out.print(pDesc);%>";
                var prodBasePrice=<%out.print(bBasePrice);%>
                var uID=<%out.print(userID);%>
                var sID=<%out.print(sellerID);%>
                
                if(sID == uID)
                {
                	disableBiddingButton("Can't bid on your own product!");
                }
                
                $('#prodNameBox').text(prodName);
                $('#prodDescBox').text(prodDesc);
                $('#basePriceBox').text(prodBasePrice);
                
                //alert("<%out.print(pEndTime);%>");
                loadBidTable();
               
                
                
                
            });
    
    function disableBiddingButton(message)
    {
    	$('#add10').prop("disabled", true);
		$('#add20').prop("disabled", true);
		$('#add30').prop("disabled", true);
		$('#add40').prop("disabled", true);
		$('#add50').prop("disabled", true);
		
		$('#mul2').prop("disabled", true);
		$('#mul3').prop("disabled", true);
		$('#mul5').prop("disabled", true);
		
		$('#bidTextArea').css("visibility", "hidden");
		$('#bidPriceLabel').css("visibility", "hidden");
		
		$('#lockBidButton').text(message);
		$('#lockBidButton').prop("disabled", true);
		$('#lockBidButton').addClass('btn btn-danger  mt-md-3');
		
		
		
    }
    </script>
    
    <script>
		function loadBidTable()
		{
			var prodID=<%out.print(productID);%>
			var s="HGHG";     
	        s="<%out.print(session.getAttribute("username"));%>";
			
			$.ajax({
		    	url: "RetrieveBids",
		    	data:{sendProductID:prodID},
		    	success: function(result){
		    		
		    					
		    					var l = Object.keys(result).length;
		    					var maxBidValue =<%out.print(bBasePrice);%>
		    					var content = '';
		    					
		    					
		    					for (var i = 0; i < l; i++) {
		    						if(s==result[i]["userName"])
		    						{
		    							content += "<tr style='background-color:#ccff99'><td>"+result[i]["userName"]+"</td><td>"+result[i]["bidAmount"]+"</td></tr>";
		    						}
		    						else
		    						{
		    							content += "<tr><td>"+result[i]["userName"]+"</td><td>"+result[i]["bidAmount"]+"</td></tr>";	
		    						}
		    						
		    						if(result[i]["bidAmount"] >= maxBidValue)
		    						{
		    							maxBidValue = result[i]["bidAmount"];
		    						}
		    						
								}
		    					console.log(parseInt($("#currentPrice").html()));
		    					if(maxBidValue!=parseInt($("#currentPrice").html()))
		    						$('#lockBidButton').prop('disabled', true)
		    					
		    					$("#rankTable tbody").html(content)
	    						$('#highestBidBox').text(maxBidValue);	
		    					$('#currentPrice').text(maxBidValue);
		    					$('#add10').text("+"+Math.trunc(maxBidValue*0.1));
		    					$('#add20').text("+"+Math.trunc(maxBidValue*0.2));
		    					$('#add30').text("+"+Math.trunc(maxBidValue*0.3));
		    					$('#add40').text("+"+Math.trunc(maxBidValue*0.4));
		    					$('#add50').text("+"+Math.trunc(maxBidValue*0.5));
		    					
		    					
		    					if(l > 0)
		    						changeWinnerinModal(result);
		    					
		    			 }
		  			});
			
		}
		
		function submitBid()
		{
			console.log("submitBid ajax call");
			var productID=<%out.print(productID);%>
			var userID="<%out.print((String)session.getAttribute("username"));%>";
			var bidAmount=document.getElementById("bidTextArea").value;
			$.ajax({
				method: "POST",
		    	url: "SubmitBid",
		    	data:{userID:userID, productID:productID, bidAmount:bidAmount},
		    	"success": function() {
		    		loadBidTable();
		            console.log("submit bid successfull");}

		        });
			
		}
		
		function notifyWinner()
		{
			console.log("Before ajax of notify winner");
			var productID=<%out.print(productID);%>
			$.ajax({
				method: "POST",
		    	url: "NotifyWinner",
		    	data:{productID:productID},
		    	"success": function() {
		    		
		            console.log("Winner has been notified!");}

		        });
			
		}
		var t = 1;
		
	</script> 
	
	<script>
	
	function checkBidEnd(){
	    // function to check if the bidding has ended
			//console.log("bid End time: <% out.print(pEndTime); %>");
	    	console.log("CheckBidEnd called");
			var today = new Date();
			var hour = today.getHours();
			if(hour >= 12){
				hour = hour - 12;
			}
			var minutes =  today.getMinutes();
			var endtime = "<% out.print(pEndTime); %>";
			var endhour = parseInt(endtime.slice(0,2));
			if(endhour > 12){
				endhour = endhour -12;
			}
			var endmin = parseInt(endtime.slice(3,5));
			//console.log("current time:",hour,minutes);
			if(hour > endhour){
					//t = 2;
					console.log("modal shown 1");					
					console.log("Bidding has ended");
					if (t==1)
					{ 
						notifyWinner();
					  	t = 0;
					}
					$('#bidEndModal').show();
					document.getElementById("countdown1").style.display="none";
					
			}
			else if (hour == endhour){
				if(minutes >= endmin){
					//t = 2;
					console.log("Bidding has ended");					  
					if (t==1)
						{
							notifyWinner();
							t = 0;
						}
					
					$('#bidEndModal').show();
					document.getElementById("countdown1").style.display="none";
				}
			}
		}
	
	
	
	function changeWinnerinModal(result)
	{
		$('#winnerName').text("Winner: "+result[0]["userName"]);
		$('#closingPrice').text("Closing Price "+result[0]["bidAmount"]);
	}
	</script>
	
	
	
	<script>
    
    $(document).ready(function()
            {
		    	setInterval(function(){
		    		loadBidTable();
		    	}, 3000);           
            });
    </script> 
	
	<script>
    
    $(document).ready(function()
            {
		    	setInterval(function(){
		    		checkBidEnd();
		    	}, 1000);           
            });
    </script> 
	
	
	
	<script>
    
    $(document).ready(function()
            {
		    	   
    	var s = "<%out.print(session.getAttribute("username"));%>";
    	if(s == "null")
    	{
    		disableBiddingButton("Can't bid without logging in!");
    	}
    	
    	
  	$("#add10").click(function(){
  	    // placing bid 20% higher than the current highest bid
  	    	
  			console.log(s);
  			//if (s != "null")
  				$('#lockBidButton').prop('disabled', false);
  			price = parseInt($("#currentPrice").html());
  			$("#bidTextArea").val( Math.trunc(price*1.1) );
  		});
	$("#add20").click(function(){
    // placing bid 20% higher than the current highest bid
    	
		//if (s != "null")
			$('#lockBidButton').prop('disabled', false);
		price = parseInt($("#currentPrice").html());
		$("#bidTextArea").val( Math.trunc(price*1.2) );
	});
	$("#add30").click(function(){
	    // placing bid 20% higher than the current highest bid
	    	
			//if (s != "null")
				$('#lockBidButton').prop('disabled', false);
			price = parseInt($("#currentPrice").html());
			$("#bidTextArea").val( Math.trunc(price*1.3) );
		});
	$("#add40").click(function(){
	    // placing bid 20% higher than the current highest bid
	    	
			//if (s != "null")
				$('#lockBidButton').prop('disabled', false);
			price = parseInt($("#currentPrice").html());
			$("#bidTextArea").val( Math.trunc(price*1.4));
		});
	$("#add50").click(function(){
    // placing bid 50% higher than the current highest bid
		console.log("add50 clicked");
    
		//if (s != "null")
			$('#lockBidButton').prop('disabled', false);
		price = parseInt($("#currentPrice").html());
		$("#bidTextArea").val( Math.trunc(price*1.5) );
		
	});
	$("#mul2").click(function(){
	    // placing bid 20% higher than the current highest bid
	    	
			//if (s != "null")
				$('#lockBidButton').prop('disabled', false);
			price = parseInt($("#currentPrice").html());
			$("#bidTextArea").val( Math.trunc(price*2) );
		});
	$("#mul3").click(function(){
	    // placing bid 20% higher than the current highest bid
	    	
			//if (s != "null")
				$('#lockBidButton').prop('disabled', false);
			price = parseInt($("#currentPrice").html());
			$("#bidTextArea").val( Math.trunc(price*3) );
		});
	$("#mul5").click(function(){
	    // placing bid 20% higher than the current highest bid
	    	
			//if (s != "null")
				$('#lockBidButton').prop('disabled', false);
			price = parseInt($("#currentPrice").html());
			$("#bidTextArea").val( Math.trunc(price*5) );
		});
	
	
	
	
	
	
	
		    	

            
});//ready() function end
    </script>
    <!-- modal code for the bidding end -->
	<div class="modal" id="bidEndModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
       
        <h4 class="modal-title" id="myModalLabel">Bidding Ended</h4>
      </div>
      
      <div class="modal-body text-center">
        
        <h2 id="winnerName"></h2>
        <h2 id="closingPrice"></h2>
        <h4>You no longer have access to this page</h4>
      </div>
      <div class="modal-footer">
        <a href="index.jsp"><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></a>
      </div>

    </div>
  </div>
</div>
	
    
    <%@include  file="navbar.html" %>      
       <div class="container" >
        
            <div class="row" style="margin-left:6%">
                <div class="col-md-3 shadow p-3" class="sideBox">
                    <div>
                    <img class="card-img-top" src="getImage.jsp?id=<% out.print(productID); %>" alt="Card image cap" style="width:280px; height:250px; object-fit:cover;">
                    </div>
                    <div class = "partition1"></div> <!-- partition between image and timer boxes   -->
                     <p id="some_div">
						      <div>
						      		<h4 class="timer-text">Time Remaining:</h4>
						            <p id = "countdown1" class = "timer col-md-12"></p>
						        </div>
						<%LocalTime myObj = LocalTime.now();
  							System.out.println(myObj);	
  							LocalTime stop = LocalTime.parse(pEndTime);
 							System.out.println(stop);
 							int hour = stop.getHour();
  							int differ = stop.getMinute();
  							System.out.println(differ);
  							int differsec = stop.getSecond();
  							System.out.println(differsec);
  							//differsec = 1000 * differsec;
  							differ = (hour*3600*1000)+ (differ * 60000); //+ (differsec*1000);
  							System.out.println(differ);
  							//System.out.println(differsec);
 						 %>
						        <script>
						            document.getElementById("countdown1").innerHTML = "BID COUNTDOWN";
						            var countdownUpto = <%out.print(differ);%>; /*add bid time here*/

									             var automaticCountdown1 = setInterval(function(){
									            	 var currentDate = new Date();  /*current time*/
									            	 h = currentDate.getHours(); // =>  30
									            	// console.log(h);
									            	 m = currentDate.getMinutes(); // =>  30
									            	// console.log(m);
									            	 s = currentDate.getSeconds(); // => 51
									            //	 console.log(s);
									            	 currentDate = (h*60*60*1000)+(m*60000)+(s*1000);
									                 var differenceInDate1 = countdownUpto - currentDate; /*in milli seconds*/ 
										            /*console.log(differenceInDate); inspect - console and see */
										         //   console.log(differenceInDate1);
										            var cHours = Math.floor((differenceInDate1%(1000*60*60*24))/(1000*60*60));
										           // console.log(cHours);
										            var cMinutes1 = Math.floor((differenceInDate1%(1000*60*60))/(1000*60));
										          //  console.log(cMinutes1);
										            var cSeconds1 = Math.floor((differenceInDate1%(1000*60))/1000);
										         //   console.log(cSeconds1);
										            //document.getElementById("countdown1").innerHTML =cHours + "hrs: "+ cMinutes1 + "m: "+ cSeconds1 + "s";
										            document.getElementById("countdown1").innerHTML =cMinutes1 + "m: "+ cSeconds1 + "s";
										            }, 1000); //to run this function in seconds not milliseconds    
						        </script> 

                     
                </div>

            
            <div class="col-md-5 centerBid shadow p-3">
                
                <b><label id="prodNameBox" style="font-size:30px;" class="category">Product Name</label></b>
                <!-- <div class="container"> -->
                    <div >
                
                <div id="prodDescBox">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Magni, explicabo unde! Aliquid, veniam magni tempora nulla ut distinctio ipsam illo ullam incidunt culpa deserunt vel velit nesciunt dolore quasi harum veritatis? Voluptatum ad illum corrupti, illo sequi itaque quae soluta.</div>                
            </div>
                <div  class="mt-lg-2" style = "font-size:19px;" >
                    <label class="category"><b>Current-Price: &#8377</b></label> 
                    <label id="currentPrice" class="category"><%out.print(bBasePrice);%></label><br>
                </div>
                <div  class="mt-lg-2" style = "font-size:19px; text-align:center" >
                    <label id="bidPriceLabel" class="category"><b>Your Bid Price: &#8377</b></label> 
                    <!--   <label id="bidTextArea" class="category"></label><br>-->
                    
                </div>
                        <div class="input-group mb-3" style="width:100%">
                   		<input type="button" class="btn btn-outline-primary btn-md" style="width:100%; font-size:30px" name="bidAmount" min="" id="bidTextArea" value="Place Your Bid">
				</div>
                 <script>
    
    
    
    
    </script>
    
                
                        <div class="button-group mb-3 input-group" role="group" style="width:100%">
                        
                        
                        		<input type="hidden" name="productID" value="<%out.print(productID);%>">
                        		<input type="hidden" name="userID" value="<%out.print((String)session.getAttribute("username"));%>">
                        		<button type="button" id="add10" data-mdb-toggle="tooltip" data-mdb-placement="top" title="Add 10%" class="btn btn-info" style="width:20%">+<%out.print((int)(bBasePrice*.1));%></button>
                        		<button type="button" id="add20" data-mdb-toggle="tooltip" data-mdb-placement="top" title="Add 20%" class="btn btn-info" style="width:20%" >+<%out.print((int)(bBasePrice*.2));%></button>
		                        <button type="button" id="add30" data-mdb-toggle="tooltip" data-mdb-placement="top" title="Add 30%" class="btn btn-info" style="width:20%" >+<%out.print((int)(bBasePrice*.3));%></button>
                        		<button type="button" id="add40" data-mdb-toggle="tooltip" data-mdb-placement="top" title="Add 40%" class="btn btn-info" style="width:20%" >+<%out.print((int)(bBasePrice*.4));%></button>
		                        <button type="button" id="add50" data-mdb-toggle="tooltip" data-mdb-placement="top" title="Add 50%" class="btn btn-info" style="width:20%" >+<%out.print((int)(bBasePrice*.5));%></button>
  							</div>
  						
  						
  						
                        
                
                        <div class="input-group mb-3" style="width:100%">
                                               
                        <input type="hidden" name="productID" value="<%out.print(productID);%>">
                        <input type="hidden" name="userID" value="<%out.print((String)session.getAttribute("username"));%>">
                        		<button type="button" id="mul2" data-mdb-toggle="tooltip" data-mdb-placement="bottom" title="Double the bid amount" class="btn btn-outline-secondary" style="width:33%">2x</button>
		                        <button type="button" id="mul3" data-mdb-toggle="tooltip" data-mdb-placement="bottom" title="Triple the bid amount" class="btn btn-outline-info" style="width:33%">3x</button>
                        		<button type="button" id="mul5" data-mdb-toggle="tooltip" data-mdb-placement="bottom" title="Just Give me the Product!" class="btn btn-outline-success" style="width:33%">5x</button>
  							
  						
  						
						</div>
                        
                        <button type="button" id="lockBidButton" class="btn btn-primary" onclick="submitBid()" style="width:100%;" disabled>Place Your Bid  <i class="fa fa-paper-plane"></i></button>
                  
                         
                    
                  
                
                  </div>
                  <div class="col-md-3 shadow p-3 " class="sideBox">
                    <div class="container">
                        <div >
                        <table class="table table-bordered table-hover table-light">
	                        <tr class="category"> 
	                        <th class="category" ><b>Initial Bid Price:  &#8377</b></th> 
                        	<th id="basePriceBox" class="category"><%out.print(bBasePrice);%></th></tr>
                        </table>
                        </div>
                        
                         <div id="bidRankList " style='overflow:auto; height:400px;' class="mt-md-3">
                            <div>
                              <table id="rankTable" class="table table-bordered "
                                data-reorderable-rows="true" aria-describedby="Bid Ranking Table">
                                <thead class="table-dark">
                                  <tr >
                                    <th scope="col" style="width: 50%">
                                      User
                                    </th>
                                    <th scope="col" data-sortable="true" style="width: 50%">
                                      Bid Amount
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
          
          
          </div>
          </div>
      
            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <!-- MDB -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.2.0/mdb.min.js"></script>
           
            
                 
       
    </body>
     </html>