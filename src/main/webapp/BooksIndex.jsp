<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="dao.DbQuery" %>
      <%@page import="helper.Mess"%>
<%@page import="java.sql.*" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="style/hstyle.css" type="text/css">
    <link rel="stylesheet" href="style/style.css" type="text/css">
    <link rel="stylesheet" href="style/card.css" type="text/css">
    <title>Books | Laba </title>
    <link rel="icon" href="images/lalogo.svg" type="image/icon type">
   <style>
       body
    {
        background-color: #fff;
    }
    .btn1
    {
   
    }
    .btn1:hover
    {
    color:#000;
   
    }
    
  
   </style>
    
   
</head>
<body>
 <%@include file="include/navbar.jsp" %>

 <div class="container-fluid d-flex justify-content-center top-con">
        <div class="search">
            <form class="searchBox" action="searchbook.jsp" method="POST">

                <input type="text" class="searchInput" type="search" placeholder="Search Books" name="search" aria-label="Search">
                <button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
            </form>
        </div>
    </div>

<div class="container">

        <div class="row bookGrid">
	<%
 int t=0;
 
 try
 {
	 
	 Connection con=DbQuery.connect();
	 Statement stm=con.createStatement();
	 String ss="select * from books";
	 ResultSet rs=stm.executeQuery(ss);
	 while(rs.next())
	 {
		 t=1;%>
            <div class="col-6 col-lg-3 col-md-4 ">
             <div class="border">
                <a class="bookCard" href="BookFullView.jsp?book_id=<%=rs.getInt(1) %>">
                    <div class="bookImage">
                        <img src="Pictures/booksPic/<%=rs.getString(6) %>" alt="No Image Found">
                    </div>
                    <div class="bookContent">
                        <h2><%=rs.getString(2) %></h2>
                        <p>By:<%=rs.getString(7) %></p>
                        <div class="bookRating">
                            <p><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i><i class="fa fa-star" aria-hidden="true"></i> <span>(25 Reviews)</span></p>
                        </div>
                        <div class="bookPrice">
                            <h3><i class="fa fa-rupee"></i><%=rs.getString(3) %></h3>
                            <span>(10% off)</span>
                        </div>

                    </div>
                </a>


                <div class="addToCartBtn">
                <%
	        
	        Mess rr=(Mess)session.getAttribute("msg");
	        
	        if(rr!=null)
	        {
	        	if(rr.getId()==rs.getInt(1))
				{%>
                    <p>Product was added to Cart</p>
                    <% }
	        }
	        %>
                    <a href="AddtoCart?pr_id=<%=rs.getInt(1) %>"><span> Add to cart </span></a>
                </div>


            </div>
            </div>
            <% }
	 session.removeAttribute("msg");
 }catch(Exception e)
 {
	 System.out.print(e);
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