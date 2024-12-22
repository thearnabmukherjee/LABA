<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="dao.DbQuery"%>
<%@page import="entities.AdminUser"%>
<%@page import="helper.Mess"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="/Laba/style/adminstyle.css" type="text/css">
    <title>Laba </title>
    <link rel="icon" href="images/lalogo.svg" type="image/icon type">
    <style>
     a{
        text-decoration: none;
    }

    a:hover, a:focus{
        text-decoration: none;
    }
.cat-con
{
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;

}
    .catTitle
    {
        width: 100%;
        display: flex;
        justify-content: center;
        align-items: center;

    }

    .catCard
    {
        display: flex;
        justify-content: center;
        align-items: center;
        position: relative;
        flex-direction: column;
       text-decoration: none;
        width: 100%;
          box-shadow: rgba(50, 50, 93, 0.25) 0px 6px 12px -2px, rgba(0, 0, 0, 0.3) 0px 3px 7px -3px;
         gap:10px;
         border:none;
         border-radius:10px
         

    }
    
    .catImg
    {
        width: 95%;
        display:flex;
        justify-content: center;
        align-items: center;
        
    }
    .catImg img
    {
        width: 100%;
        height: 200px;
        object-fit: contain;

    }
    .catContent
    {
      
       
        width: 100%;
        z-index: 2;
        height: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
      

    }

    .catContent p{
        font-size: 1.3rem;
        color: #000;
        
    }
    .catContent p:hover, .catCard:hover
    {
        color: #fb8500;
       
    }
    
    .ftr
    {
    position:absolute;
    bottom:0;
    right:0;
    width:100%
    }


    </style>
  </head>
  <body data-spy="scroll" data-bs-target="#navbarSupportedContent">
  <%@include file="/include/adminNavbar.jsp" %>
  <%
  response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
 
  AdminUser rr=new AdminUser();
  response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
  if(session.getAttribute("aduser")==null)
  {
 	 response.sendRedirect("AdminLogin.jsp?link=pro");
  }
  else
  {
 	 rr=(AdminUser)session.getAttribute("aduser");
 	 
  }
 
 
  %>
  
    <div class="container cat-con" style="margin-top:160px;">
    
    <div class="catTitle mb-5">
        <h2 class="text font-weight-bold">Services</h2>
    </div>

    <div class="row" style="width: 100%;">
        <div class="col-12 col-lg-4 col-md-4">
            <a class="catCard" href="IncommingOrders.jsp" >
                <div class="catImg">
                    <img src="/Laba/images/incomingOrder.svg" alt="">
                </div>
                <div class="catContent">
                    <p class="">Incoming Order</p>
                </div>
            </a>
        </div>
        <div class="col-12 col-lg-4 col-md-4">
            <a class="catCard" href="IssuedBooks.jsp" >
                <div class="catImg">
                    <img src="/Laba/images/issuedOrder.svg" alt="">
                </div>
                <div class="catContent">
                    <p class="">Issued Books</p>
                </div>
            </a>
        </div>

        <div class="col-12 col-lg-4 col-md-4">
            <a class="catCard" href="CancelledOrders.jsp" >
                <div class="catImg">
                    <img src="/Laba/images/cancelledOrder.svg" alt="">
                </div>
                <div class="catContent">
                    <p class="">Cancelled Order</p>
                </div>
            </a>
        </div>
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
