<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="dao.DbQuery" %>
      
      <%@page import="helper.Mess"%>
<%@page import="java.sql.*" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="ISO-8859-1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
    body
    {
        background-color: #131313;
    }
    .button
    {
    background-color: #fb8500;
    font-weight: 500;
    padding: 0.4rem 1.4rem;
    border-radius: 30px;
    font-size: 1.3rem;
    color: #fff; 
    }
    .button:hover{
    background: #fff;
    color: black;
  
} 
.txtr{
  color: #fff;
 
}
.txta{
  color: #fb8500;
  
}
.txta:hover
{
  color: #fff;
}

    </style>
    <title>Login</title>
    <link rel="icon" href="images/lalogo.svg" type="image/icon type">
  </head>
  <body>

<%
String link=request.getParameter("link");
String id=request.getParameter("id");
%>
    <div class="text-center mt-5">
    <%
	        
	        Mess rr=(Mess)session.getAttribute("msg");
	        
	        if(rr!=null)
	        {
	        	%>
	        		 <div class="alert <%=rr.getCl() %> p-2" role="alert"  style="max-width:450px;">
	        	     <%=rr.getMsg() %>
	        	   </div>
				<% 
	       	
	      
	        }
	        session.removeAttribute("msg");
	       	
	        %>
        
        <form class="form-signin" style="max-width: 300px;margin: auto;" action="/Laba/AdminLogin" method="post">
          <img class="mb-4" src="images/lalogo.svg" alt="" width="72" height="72">
          <h1 class="h3 mb-3 font-weight-normal text-light">Please sign in</h1>
         
          <input type="email" id="inputEmail" class="form-control" name="email" placeholder="Email address" required="" autofocus="">
         
          <input type="password" id="inputPassword" name="pass" class="form-control mt-4" placeholder="Password" required="">
          
           <input type="hidden"  name="link" value="<%=link%>">
            <input type="hidden"  name="id" value="<%=id%>">
          <button class="button btn mt-3" type="submit">Sign in</button>
          <p class="txtr text mt-3 " style="margin:0;"><a class="txta fw-bold" href="/Laba/login.jsp">Not Admin login!</a></p>
          <p class="mt-4 mb-3 text-muted">© 2021 Laba Co...</p>
        </form>
  </div>
      
  

 
 <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>


<script>

		$(document).ready(function(){
			console.log("loaded")
		});



</script>
  </body>
</html>