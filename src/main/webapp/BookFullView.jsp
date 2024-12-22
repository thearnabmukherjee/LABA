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
     <link rel="stylesheet" href="/Laba/style/hstyle.css" type="text/css">
     <title>Orders Details | Laba</title>
     <link rel="icon" href="images/lalogo.svg" type="image/icon type">
     
     <style type="text/css">
   
   
     .bty1
     {
      background: #00bf86;
    width:10rem;
   
     }
     .byt{
     	
     	font-size:25px;
     	width:100%;
     	
     
     }
      .brt{
     	color:#fff;
     	font-size:25px;
     	background:#00bf86;
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
     color:#00bf86;
     display:inline-block;
     }
     .colr
     {
     margin-left:30px;
     }
     
     .btn-r
     {
     background:#00bf86;
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
  <%@include file="include/navbar.jsp" %>
     
     <%
     
     int t=0,sno=0,book_id;
     
     Date date = new Date();
  
 	
 	 book_id=Integer.parseInt(request.getParameter("book_id")); 

 	 
 	 
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
  <p class="text font-weight-bold " style="margin:0;font-size:2rem">Book Details</p>
  </div> 
 	 <%
  try
  {
	  Connection con=DbQuery.connect();
  	Statement stm=con.createStatement();
  	ResultSet rs=stm.executeQuery("select * from books where id='"+book_id+"'");
  	
  	if(rs.next())
  	{
  		/* String b_name,u_name,o_date,u_email;
  		u_name="Null";
  		b_name=rs.getString(2);
  		o_date=rs.getString(16);
  		u_email=rs.getString(8);
  		long millis=System.currentTimeMillis();  
  		Date i_date=new java.sql.Date(millis);   */
  		
  	
  		
  	  	
  		%>
  		
  		<div class="row mt-3 p-3 justify-content-center ">
  		<div calss=" mx-auto justify-content-center align-items-center text-center col col-lg-3 col-md-3 col-12">
  		 <img src="Pictures/booksPic/<%=rs.getString(6)%>" class="img-fluid imgi" alt="..." style="">
	      
  		
  		</div>
  		<div class="col colr text-center text-md-left text-lg-left  mt-3 mt-md-0 mt-lg-0 col col-lg-8 col-md-8 col-12">
  		<p class="text font-weight-bold" style="margin:0 ;font-size:30px" ><%=rs.getString(2) %></p>
	        <p class="text" style="margin:0;margin-bottom:1rem;font-size:1rem" >By: <%=rs.getString(7) %></p>
	        <div class="row ">
  			<div class="col m-0"> <p class="text" style="margin:0;margin-bottom:0.9rem;font-size:23px" ><b>Price :</b><i class="fa fa-rupee" style="font-size:20px"></i><%=rs.getString(3) %>  </i></a></p></div>
  		</div>
	        
  			<div class="row m-0"> <p class="text" style="margin:0;font-size:20px" ><b>Description :</b>  </i></a></p></div>
  			<div class="row m-0"> <p class="text" style="margin:0;margin-bottom:0.9rem;font-size:20px" ><%=rs.getString(4) %> </p></div>
  		   
	       <div class="container-fluid mt-3">
	       <div class="row ">
	        
  			<div class="col-12 col-md-12 col-lg-12 m-0"><a class="btn brt" href="AddtoCart?pr_id=<%=rs.getInt(1) %>">Add to cart</a></div>
  			
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
 
  
  
  
  %>
   </div>
   </div>
  
<%@include file="include/footer.jsp" %>
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