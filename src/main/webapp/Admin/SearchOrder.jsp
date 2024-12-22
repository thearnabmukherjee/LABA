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
     
     </style>
  </head>
  <body>
    <%@include file="/include/adminNavbar.jsp"%>
     
     <%
  response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
 
  AdminUser zx=new AdminUser();
   if(session.getAttribute("aduser")==null)
  {
 	 response.sendRedirect("AdminLogin.jsp?link=pro");
  }
  else
  {
 	 zx=(AdminUser)session.getAttribute("aduser");
 	 
  }

  %>
    <div class="container-fluid" style="margin-top:120px;">
    
    <div class="container-fluid p-5" style="max-width:1500px">
     <div class="container-fluid border-bottom mb-3" style="border-color:#cccccc" >
  <p class="text font-weight-bold " style="margin:0;font-size:2rem">Incoming Orders</p>
  </div> 
    
    <form class="form" action="searchOrder.jsp" method="POST">
<div class="row mx-auto justify-content-center align-items-center text-center container p-2 ">
      <input class="form-control col-lg-9 col-md-9 col-10 mt-2" type="search" placeholder="Search Order" name="search" aria-label="Search">
      <button class="btn bty1 col-lg-2 col-md-2 col-3 mt-2 text-light" type="submit">Search</button>
      </div>
    </form>
    
    
    
    
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