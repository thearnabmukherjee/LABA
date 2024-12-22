<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="dao.DbQuery" %>
      <%@page import="java.sql.*" %>
      <%@page import="helper.Mess"%>
      <%@page import="entities.AdminUser"%>
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
     <title>Incoming Orders | Laba</title>
     <link rel="icon" href="images/lalogo.svg" type="image/icon type">
     
     <style type="text/css">
     
     .bty1
     {
      background: #fb8500;
    width:10rem;
   
     }
     .byt{
     	color:#fb8500;
     	outline-color:#fb8500;
     	box-shadow: 0px 0px 0px 1.4px;
     	
     
     }
     .byt:hover
     {
     color:#fff;
     background:#fb8500;
     }
     
      @media screen and  (max-width: 767.98px) { 
     .brtext
     {
     font-size:13px;
     }
     
     
     }
     
     </style>
  </head>
  <body>
    <%@include file="/include/adminNavbar.jsp"%>
     
     <%
     int t=0,sno=0;
     String ser;
  response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
 
  AdminUser zx=new AdminUser();
   if(session.getAttribute("aduser")==null)
  {
 	 response.sendRedirect("AdminLogin.jsp?link=pro");
  }
  else
  {
 	 zx=(AdminUser)session.getAttribute("aduser");
 	 ser=request.getParameter("search");
  

  %>
    <div class="container-fluid" style="margin-top:120px;">
    
    <div class="container-fluid p-5" style="max-width:1500px;">
     <div class="container-fluid border-bottom mb-3" style="border-color:#cccccc" >
  <p class="text font-weight-bold " style="margin:0;font-size:2rem">Incoming Orders</p>
  </div> 
    
    <form class="form" action="SearchIssuedOrders.jsp" method="POST">
<div class="row mx-auto justify-content-center align-items-center text-center container  ">
      <input class="form-control col-lg-10 col-md-10 col-12 mt-2" type="search" placeholder="Search Orders (Name,User,author....)" name="search" aria-label="Search">
      <button class="btn bty1 col-lg-2 col-md-2 col-6 mt-2 text-light" type="submit">Search</button>
      </div>
    </form>
    
    <%
    try
    {
    	
    	Connection con=DbQuery.connect();
    	Statement stm=con.createStatement();
    	ResultSet rs=stm.executeQuery("select * from books inner join cart on books.id=cart.pr_id and cart.status='Issued' where pr_name like '%"+ser+"%' or pr_des like '%"+ser+"%'or pr_author like '%"+ser+"%' or email like '%"+ser+"%' and cart.pickupdate is not null ORDER BY cart.cart_id DESC ");
    	
    	while(rs.next())
    	{
    		sno=sno+1;
    		t=1;
    	%>
    	<div class="container border rounded  mb-2 mt-4"  style="border-color:#cccccc;">
	<div class="row border-bottom  py-2 mx-auto align-item-center " style="border-color:#cccccc;">
	<div class="col col-lg-4 col-md-3 col-4 ">
	<div class="row ">
	<p class=" text font-weight-bold brtext" style="margin:0">Order Date:</p>
	</div>
	<div class="row ">
	<p class=" text brtext" style="margin:0"><%=rs.getString(16) %></p>
	</div>
	</div>
	<div class="col col-lg-4 col-md-3 col-4  ">
	<div class="row mx-auto align-item-center justify-content-center">
	<p class=" text  font-weight-bold brtext" style="margin:0">Total Price:</p>
	</div>
	<div class="row mx-auto align-item-center justify-content-center">
	<p class=" text brtext" style="margin:0;font-size:16px"><i class="fa fa-rupee" style="font-size:15px"></i><%=rs.getString(12) %></p>
	</div>
	</div>
	<div class="col col-lg-4 col-md-3 col-4 ">
	<div class="row mxa-auto align-item-end justify-content-end">
	<p class=" text  font-weight-bold brtext" style="margin:0">PickUp Location:</p>
	</div>
	<div class="row mx-auto align-item-end justify-content-end">
	<p class=" text brtext" style="margin:0"><%=rs.getString(13) %></p>
	</div>
	</div>
	</div>
	<div class="row py-3">
			 <div class="col mx-auto  align-items-center text-center col-lg-3 col-md-5 col-12 ">
	      <img src="/Laba/Pictures/booksPic/<%=rs.getString(6)%>" class="img-fluid" alt="..." style="max-width:200px; max-height:200px;object-fit:contain;">
	      </div> 
	       <div class="col text-center text-md-left text-lg-left  mt-3 mt-md-0 mt-lg-0 col-lg-5 col-md-5 col-12  ">
	        <h5 class="text font-weight-bold" style="margin:0 ;font-size:25px" ><%=rs.getString(2) %></h5>
	        <p class="text" style="margin:0;font-size:1rem" >By: <%=rs.getString(7) %></p>
	        
	        <div class="row">
	        <div class="col col-lg-12 col-md-12 col-6"><p class="text" style="margin:0 ;font-size:18px" ><b>Quantity :</b><%=rs.getString(10) %>  </i></a></p></div>
	        <div class="col col-lg-12 col-md-12 col-6"> <p class="text" style="margin:0;font-size:18px" ><b>Price :</b><i class="fa fa-rupee" style="font-size:15px"></i><%=rs.getString(11) %>  </i></a></p></div>
	        </div>
	       <div class="row">
	       <div class="col col-lg-12 col-md-12 col-12"> <p class="text" style="margin:0;font-size:18px" ><b>Email :</b><%=rs.getString(8) %></p></div>
	        </div>
	       
	        </div>
	        <div class="col text-center text-md-left text-lg-left  mt-1 mt-md-0 mt-lg-0 col-lg-4 col-md-4 col-12 border-md-top  ">
			
				
				<div class="row mx-auto align-item-center mb-2 " style="max-width:150px" >
	        <div class="col col-lg-6 col-md-6 col-6"><p class=" text font-weight-bold" style="margin:0;font-size:20px">Status:</p></div>
	        <div class="col col-lg-6 col-md-6 col-6"> <p class=" text" style="margin:0;color:#00bf86;font-size:20px"><%=rs.getString(15) %></p></div>
	        </div>
			<div class="row mx-auto text-center justify-content-center rowyt">
			<div class="col col-lg-12 col-md-12 col-12">
			<a href="ProceedWithOrder.jsp?cart_id=<%=rs.getInt(19)%>" class=" btn byt">Proceed With Order</a>
			</div>
			</div>	
				
				
				
			
	        
	        
	        
	      </div>
	    </div>
	    </div>
	    
    	
    	
    	<%
    	
    	
    	
    	}
    	
    	if(t==0)
    	{%>
    	
    		 <div class="container-fluid">
    		 <div class="alert alert-primary %>" role="alert">
    		  No Book found with that name.
    		</div>
    		</div>
    	<%}
    	
    }catch(Exception e)
    {
    	System.out.print(e);
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