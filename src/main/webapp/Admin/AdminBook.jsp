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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="/Laba/style/adminstyle.css" type="text/css">
    <title>Books | Laba </title>
    <link rel="icon" href="images/lalogo.svg" type="image/icon type">
      <style>
       body
    {
        background-color: #fff;
    }
    
       .card-a
    {
    display: block;
    max-width:20rem;
    max-height:20rem;
    cursor:pointer;
    text-decoration:none;
    color:#000;
    }
    .card-a:hover
    {
     text-decoration:none;
    color:#fb8500;
    }
    .btn1
    {
    background: #fb8500;
    width:10rem;
    }
    .txt-ne
    {
    margin:0;
    margin-top:8px;
    font-size: 1.5rem;
    }
    .txt
    {
    font-size: 1.6rem;
    color:#FF8000
    }
    
    .ale
    {
    font-size:0.3rem;
    width:10rem;
    }
        
     
		
		.btng
		{
		background: #00bf86;
		 
					
		}
		.btng:hover{
		 color: #000;
		}
		.bas
		{
		background-color: #131313;
		}
		 #navbarSupportedContent > ul > li:nth-child(2) > a
    {
    color: #fb8500;
    }

   </style>
  </head>
  <body data-spy="scroll" data-bs-target="#navbarSupportedContent">
  <%@include file="/include/adminNavbar.jsp" %>
  <%
  response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
 
  AdminUser rt=new AdminUser();
  response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
  if(session.getAttribute("aduser")==null)
  {
 	 response.sendRedirect("AdminLogin.jsp?link=pro");
  }
  else
  {
 	 rt=(AdminUser)session.getAttribute("aduser");
 	 
  }
 
 
  %>
  <div class="container-fluid" style="margin-top:130px" >
  
  <div class="container-fluid" style="max-width:1500px;">
     <div class="container-fluid border-bottom mb-3" style="border-color:#cccccc" >
  <p class="text font-weight-bold " style="margin:0;font-size:2rem">All Books</p>
  </div>
  
  
  <div class="container-fluid" style="max-width:1400px;" >
<form class="form" action="searchbook.jsp" method="POST">
<div class="row mx-auto justify-content-center align-items-center text-center container">
      <input class="form-control col-lg-10 col-md-10 col-12 mt-2" type="search" placeholder="Search Books" name="search" aria-label="Search">
      <button class="btn btn1 bty1 col-lg-2 col-md-2 col-6 mt-2  text-light" type="submit">Search</button>
      </div>
    </form>

 <div class="container-fluid p-1" style="max-width:1400px;" >
 
    <div class=" container-fluid row mx-auto justify-content-center align-items-center text-center ">
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
		 <div class="card col-lg-3 col-md-3 col-10 p-2 m-2 " style=" max-width:20rem;height:26rem">
	       <a class="card-body card-a p-2" href="AdminBookFullView.jsp?book_id=<%=rs.getString(1) %>">
	        <img src="/Laba/Pictures/booksPic/<%=rs.getString(6) %>" class="img-fluid" alt="..." style=" height:12rem;object-fit: contain;">
	        <p class="text card-title txt-ne" style=""><%=rs.getString(2) %></p>
	         <p class="text card-title txt-li" style="margin:0;">By:<%=rs.getString(7) %></p>
	        <p class="card-text txt font-weight-bold"><i class="fa fa-rupee" style="font-size:20px"></i> <%=rs.getString(3) %></p>
	        </a>
	        <div class="row">
	        <div class="col col-lg-12 col-md-12 col-12 ">
	        <a href="EditBook.jsp?pr_id=<%=rs.getInt(1) %>" class=" btn btn1 text-light">Edit Book</a>
	        </div>
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
%>
     </div>
    </div>
    
  </div>
  
<%  }catch(Exception e)
 {
	 System.out.print(e);
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