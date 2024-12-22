<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="dao.DbQuery" %>
      <%@page import="java.sql.*" %>
      <%@page import="helper.Mess"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
   <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" href="style/hstyle.css" type="text/css">
     <title>Confirm Order | Laba</title>
     <link rel="icon" href="images/lalogo.svg" type="image/icon type">
     
     <style>
     
     
     .button
    {
    background-color: #00bf86;
    font-weight: 500;
    width:100%;
    padding: 0.4rem 1.4rem;
    border-radius: 30px;
    font-size: 1.3rem;
    color: #fff; 
    }
    .button:hover{
   
    color: black;
  
}
</style>
<script>
if(window.history.forward( 1)!=null)
	window.history.forward(1);

</script>
  </head>
  <body>
    <%@include file="include/navbar.jsp" %>
 <div class="container-fluid " style="margin-top:150px">
 
<div class="container-fluid border border-dark rounded  p-4" style="max-width:900ps">

<p class="text font-weight-bold" style="color:#00bf86;font-size:1.8rem">Order Confirmed
<p class="text" style=";font-size:1.3rem" > Your order is Confirmed You can Pick You boooks from the Pickup Location.<br>
 You can find Your Book Orders in Your Accounts <a href="Orders.jsp" style="text-decoration:none;color:#00bf86">Orders</a></p>
</div >

<div class="container-fluid mt-2 mb-5" style="max-width:900ps">
<div class="row mx-4">
<a class=" button btn" href="BooksIndex.jsp">Continue Shoping</a>
</div>
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