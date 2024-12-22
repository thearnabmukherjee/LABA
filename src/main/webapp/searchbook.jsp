<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="dao.DbQuery" %>
      <%@page import="helper.Mess"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="style/hstyle.css" type="text/css">
    <title>Books | Laba </title>
    <link rel="icon" href="images/lalogo.svg" type="image/icon type">
    <style>
   body
    {
        background-color: #fff;
    }
    .btn1
    {
    background: #00bf86;
    color:#fff;
   	width:12rem;
    }
    .btn1:hover
    {
    color:#000;
   
    }
     .card-a
    {
    display: block;
    max-width:20rem;
    max-height:19rem;
    cursor:pointer;
    text-decoration:none;
    color:#000;
    }
    .card-a:hover
    {
     text-decoration:none;
     color:#000;
   
    }
    .txt-ne
    {
    margin:0;
    margin-top:8px;
    font-size: 1.5rem;
    }
    .txt
    {
    font-size: 1.5rem;
    color:#FF8000
    }
    
    .ale
    {
    font-size:0.3rem;
    width:10rem;
    }
    .yyt
    {
    padding:0px !important;
    flex: 0.5 0.5 auto !important;
    }
 .cont
  {
  padding-right:0px !important;;
  padding-left:0px !important;;
  }
  
   @media screen and  (max-width: 767.98px) { 
     .btn1
     {
     width:9rem;
     font-size:18px;
     }
     .txt-ne
     {
   
    font-size: 1.1rem;
     }
      .txt-li
     {
   
    font-size: 0.95rem;
     }
     }
   </style>
    
   
</head>
<body>
 <%@include file="include/navbar.jsp" %>
 <div class="container-fluid" style="margin-top:130px" >
<form class="form" action="searchbook.jsp" method="POST">
<div class="row mx-auto justify-content-center align-items-center text-center container p-2 ">
      <input class="form-control col-lg-8 col-md-8 col-10 mt-2" type="search" placeholder="Search Book" name="search" aria-label="Search">
      <button class="btn btn1 col-lg-2 col-md-2 col-3 mt-2 text-light" type="submit">Search</button>
      </div>
    </form>
<div>
<div class="container-fluid p-2" >
 
    <div class=" container-fluid row mx-auto justify-content-center align-items-center text-center ">
    
  <%--  <c:out value="${row.pr_pic }"></c:out> --%>
   
   
    
   
 <%
 int t=0;
 
 try
 {
	 String ser=request.getParameter("search");
	 Connection con=DbQuery.connect();
	 Statement stm=con.createStatement();
	 String ss="select * from books where pr_name like '%"+ser+"%' or pr_des like '%"+ser+"%' ";
	 ResultSet rs=stm.executeQuery(ss);
	 while(rs.next())
	 {
		 t=1;%>
	 <div class="card col-lg-3 col-md-3 col-5 m-2" style="max-width:20rem;height:26rem">
	       <a class="card-body card-a px-2 pt-2 " href="BookFullView.jsp?book_id=<%=rs.getInt(1) %>">
	        <img src="Pictures/booksPic/<%=rs.getString(6) %>" class="img-fluid" alt="..." style=" height:12rem;object-fit: contain;">
	        <p class="card-title txt-ne font-weight-bold"><%=rs.getString(2) %></p>
	        <p class="text card-title txt-li" style="margin:0;">By:<%=rs.getString(7) %></p>
	        <p class="card-text txt"><i class="fa fa-rupee" style="font-size:20px"></i> <%=rs.getString(3) %></p>
	        </a>
	        <div class="card-body row align-items-center justify-content-center mx-auto yyt" >
	        
	        <a href="AddtoCart?pr_id=<%=rs.getInt(1) %>" class=" btn btn1">Add to cart</a>
	        
	        </div>
	        <%
	        
	        Mess rr=(Mess)session.getAttribute("msg");
	        
	        if(rr!=null)
	        {
	        	if(rr.getId()==rs.getInt(1))
				{%>
	        		 <div class="alert <%=rr.getCl() %> p-2" role="alert">
	        	     <%=rr.getMsg() %>
	        	   </div>
				<% }
	       	
	      
	        }
	       	
	        %>
	        
	        
	      
	    </div>
		
	<% }
	 session.removeAttribute("msg");
 }catch(Exception e)
 {
	 System.out.print(e);
 }
 
 if(t==0)
 {%>
	  <div class="container-fluid">
 <div class="alert alert-primary %>" role="alert">
  No Book found with that name.
</div>
</div>
 <% }
 %>
  </div>
    </div>
  </div>
  </div>
<%@include file="include/footer.jsp" %>



 

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

</body>
</html>