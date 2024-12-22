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
     
      .text{
     	
      	font-size:20px;
      	}
     .texte{
     	color:#fb8500;
      	font-size:20px;
     
     }
     .texte:hover
     {
     color:#00008B;
     text-decoration:none;
    
     }
     
      @media screen and  (max-width: 767.98px) { 
     .brtext
     {
     font-size:13px;
     }
     
     
     }
     
     </style>
     <script>
if(window.history.forward( 1)!=null)
	window.history.forward(1);

</script>
  </head>
  <body>
    <%@include file="/include/adminNavbar.jsp"%>
     
     <%
     int t=0,sno=0;
  response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
 
  AdminUser zx=new AdminUser();
   if(session.getAttribute("aduser")==null)
  {
 	 response.sendRedirect("AdminLogin.jsp?link=pro");
  }
  else
  {
 	 zx=(AdminUser)session.getAttribute("aduser");
 	 %>
 	 <div class="container-fluid" style="margin-top:120px;">
    
    <div class="container-fluid p-5" style="max-width:1500px;">
     <div class="container-fluid border-bottom mb-3" style="border-color:#cccccc" >
  <p class="text font-weight-bold " style="margin:0;font-size:2.3rem ;color:#fb8500;">Confirmation</p>
  </div> 
  
  <div class="container-fluid mt-4" >
  
  <p  class="text" style="font-size:25px">Book Issued Successfully</p>
  <p class="text " >Back to <a class="texte" href="IncommingOrders.jsp">Incoming Orders</a></p>
 	 </div>
 	 <%
  
  }
  %>
  
   <%@include file="/include/footer.jsp" %>
</body>
</html>