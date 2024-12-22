<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="dao.DbQuery" %>
      <%@page import="java.sql.*" %>
      <%@page import="helper.Mess"%>
      <%@page import="entities.AdminUser"%>
      <%@page import="java.util.Date"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
     <link rel="stylesheet" href="/Laba/style/adminstyle.css" type="text/css">
     <title>Orders Details | Laba</title>
     <link rel="icon" href="images/lalogo.svg" type="image/icon type">
     
     <style type="text/css">
     
     .bty1
     {
      background: #fb8500;
    width:10rem;
   
     }
     .byt{
     	
     	font-size:25px;
     	width:100%;
     	
     
     }
      .brt{
     	color:#fff;
     	font-size:25px;
     	background:#fb8500;
     	margin-right:5px;
     	width:100%;
     	
     
     }
     .imgi
     {
     max-width:350px; 
     max-height:350px;
     object-fit:contain;
     }
   
     .brt:hover
     {
     color:#000;
     
     }
     
     .text4
     {
     margin:0;margin-bottom:0.3rem;font-size:22px;
     color:#fb8500;
     display:inline-block;
     }
     .colr
     {
     margin-left:30px;
     }
     
     .btn-r
     {
     background:#fb8500;
     }
     .btn-r:hover
     {
     color:#fff;
     }
     @media screen and  (max-width: 767.98px) { 
		.imgi
     {
     max-width:300px; 
     max-height:300px;
     object-fit:contain;
     }
     .colr
     {
     margin-left:0px;
     }
     
     .brt
     {
     width:100%;
     margin-right:0px;
     margin-bottom:10px;
     }
     .byt
     {
     width:100%
     }
		
		 }
     </style>
  </head>
  <body>
  <%@include file="/include/adminNavbar.jsp"%>
     
     <%
     
     int t=0,sno=0,cart_id;
     
     Date date = new Date();
  response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
 
  AdminUser zx=new AdminUser();
   if(session.getAttribute("aduser")==null)
  {
 	 response.sendRedirect("AdminLogin.jsp?link=pro");
  }
  else
  {
 	 zx=(AdminUser)session.getAttribute("aduser");
 	 cart_id=Integer.parseInt(request.getParameter("cart_id")); 

 	 
 	 
     %>
     
 	
 	  <div class="container-fluid" style="margin-top:120px;">
    
    <div class="container-fluid p-5" style="max-width:1500px;">
    <%
     Mess rr=(Mess)session.getAttribute("msg");
     
     if(rr!=null)
     {
     	%>
     	<div class="container-fluid">
     		 <div class="alert <%=rr.getCl() %> p-2" role="alert">
     	     <%=rr.getMsg() %>
     	   </div>
     	   </div>
			
			<% 
         }
     session.removeAttribute("msg");	
     %>
     <div class="container-fluid border-bottom mb-3" style="border-color:#cccccc" >
  <p class="text font-weight-bold " style="margin:0;font-size:2rem">Order Details</p>
  </div> 
 	 <%
  try
  {
	  Connection con=DbQuery.connect();
  	Statement stm=con.createStatement();
  	ResultSet rs=stm.executeQuery("select * from books inner join cart on books.id=cart.pr_id and cart.cart_id='"+cart_id+"' and cart.orderdate is not null ");
  	
  	if(rs.next())
  	{
  		String b_name,u_name,o_date,u_email;
  		u_name="Null";
  		b_name=rs.getString(2);
  		o_date=rs.getString(16);
  		u_email=rs.getString(8);
  		long millis=System.currentTimeMillis();  
  		Date i_date=new java.sql.Date(millis);  
  		
  	
  		
  	  	
  		%>
  		
  		<div class="row mt-3 p-3 justify-content-center ">
  		<div calss=" mx-auto justify-content-center align-items-center text-center col col-lg-3 col-md-3 col-12">
  		 <img src="/Laba/Pictures/booksPic/<%=rs.getString(6)%>" class="img-fluid imgi" alt="..." style="">
	      
  		
  		</div>
  		<div class="col colr text-center text-md-left text-lg-left  mt-3 mt-md-0 mt-lg-0 col col-lg-8 col-md-8 col-12">
  		<p class="text font-weight-bold" style="margin:0 ;font-size:30px" ><%=rs.getString(2) %></p>
	        <p class="text" style="margin:0;margin-bottom:1rem;font-size:1rem" >By: <%=rs.getString(7) %></p>
	        <div class="row ">
  			<div class="col m-0"><p class="text" style="margin:0 ;margin-bottom:0.3rem;font-size:20px" ><b>Quantity :</b><%=rs.getString(10) %>  </i></a></p></div>
  			<div class="col m-0"> <p class="text" style="margin:0;margin-bottom:0.9rem;font-size:20px" ><b>Price :</b><i class="fa fa-rupee" style="font-size:15px"></i><%=rs.getString(11) %>  </i></a></p></div>
  		</div>
	        <div class="row ">
  			<div class="col m-0"> <p class="text" style="margin:0;margin-bottom:0.9rem;font-size:20px" ><b>Order Date :</b><%=rs.getString(16) %>  </i></a></p></div>
  		
  		</div>
	        
  			<div class="row " style="max-width:320px">
  			<div class="col m-0"> <p class="text" style="margin:0;margin-bottom:0.3rem;font-size:22px;display:inline-block;" ><b>Total Price :</b> <font color="#fb8500"> <i class="fa fa-rupee" style="font-size:17px;"></i><%=rs.getString(12) %> </font></p></div>
  			
  		</div>
  		
  			<div class="container-fluid border-bottom border-top mb-3 mt-3" style="border-color:#cccccc" >
			  <p class="text font-weight-bold " style="margin:0;font-size:25px">Ordered By</p>
			  </div> 
			  
			  <%
			  ResultSet rs2=stm.executeQuery("select * from users where email='"+rs.getString(8)+"' ");
			  if(rs2.next())
			  {
				
				  u_name=rs2.getString(2)+" "+rs2.getString(3);
			  
			  %>
			  
			   <div class="row ">
  			<div class="col m-0"><p class="text" style="margin:0;margin-bottom:1rem;font-size:20px" >Name:<b> <%=rs2.getString(2)+" "+rs2.getString(3) %></b></p></div>
  			<div class="col m-0"> <p class="text" style="margin:0;margin-bottom:1rem;font-size:20px" >Phone :<b> <%=rs2.getString(8) %></b></p> </div>
  			
  		</div>
		     
	       	
	       	
	       <%} %>
	       
	       <div class="container-fluid mt-3">
	       <div class="row ">
  			<div class="col-12 col-md-6 col-lg-6 m-0"><a class="btn brt" data-toggle="modal" data-target="#issuebook">Return Book</a></div>
  			
  		</div>
	       
	       
	       
	       </div>
  		</div>
  		</div>
  		<!-- Modal issue book -->
<div class="modal fade" id="issuebook" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title font-weight-bold" id="staticBackdropLabel">Issue Book</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <p class="text" style="margin:0;margin-bottom:1rem;font-size:20px" ><b>Book Name:</b> <%=b_name %></p>
        <p class="text" style="margin:0;margin-bottom:1rem;font-size:20px" ><b>Name:</b> <%=u_name %></p>
        <p class="text" style="margin:0;margin-bottom:1rem;font-size:20px" ><b>Email:</b> <%=u_email %></p>
        <p class="text" style="margin:0;margin-bottom:1rem;font-size:20px" ><b>Order date :</b> <%=o_date %></p>
         <p class="text" style="margin:0;margin-bottom:1rem;font-size:20px" ><b>Issue date :</b> <%=i_date %></p>
             <p class="text" style="margin:0;margin-bottom:1rem;font-size:20px" ><b>Current Status :</b><font color="#00bf86"> Issued</font></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a type="button" class="btn btn-r text-light" href="/Laba/ReturnBook?cart_id=<%=cart_id%>">Return Book</a>
      </div>
    </div>
  </div>
</div>
  
  <!-- Modal cancel order-->
<div class="modal fade" id="cancelorder" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title font-weight-bold" id="staticBackdropLabel">Cancel Order</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <p class="text" style="margin:0;margin-bottom:1rem;font-size:20px" ><b>Do you really want to cancel this order..!</b></p>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a type="button" class="btn btn-danger"  href="/Laba/CancelOrder?cart_id=<%=cart_id%>">Cancel Order </a>
      </div>
    </div>
  </div>
</div>
  		<%
  	}
	  
  }catch(Exception e)
 
  {
	System.out.println("error getting data");	  
  }
  }
  
  
  
  %>
   </div>
   </div>
  
 <%@include file="/include/footer.jsp" %>
  <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    -->
</body>
</html>