<%@page import="dao.DbQuery"%>
<%@page import="entities.Users"%>
<%@page import="helper.Mess"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
    <%@ taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
  <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" href="style/hstyle.css" type="text/css">
    <title>Laba </title>
    <link rel="icon" href="images/lalogo.svg" type="image/icon type">
    <title>Profile | Laba </title>
       <style>
       
        body
    {
        background-color: #000;
    }
       .ytr
       {
       display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    text-align: center;
       }
		.proa a {
			background: #00bf86;
			font-weight: 500;
			padding: 0.6rem 1.7rem;
			border-radius: 30px;
			text-decoration: none;
			color: #fff;
			font-size: 1.3rem;
		}
		.proa a:hover{
    		
   			 color: #000;

		}
		.prob a {
			border-color: 00bf7f;
			border-width: 2px;
			font-weight: 500;
			padding: 0.6rem 1.7rem;
			border-radius: 30px;
			text-decoration: none;
			color: #f8f9fa;
			font-size: 1.3rem;
		}
		.prob a:hover{
    		
   			 color: #00bf7f;

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
		
		
        a{
        text-decoration: none;
    }

    a:hover, a:focus{
        text-decoration: none;
    }
        .proCon
        {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            gap: 10px;
        }

        .head
        {
            width: 100%;
            display: flex;
            justify-content: flex-start;
            align-items: center;

        }
        .head h2
        {
            font-size: 1.9rem;
            font-weight: 600;
            color: #f8f9fa;
        }

        .profile{
            width: 100%;
        }
        .proImage
        {
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 5px;
            
        }
        .proImage img{
            width: 200px;
            height: 200px;
            object-fit: cover;
            border-radius: 50%;

        }

        .proContent
        {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            flex-direction: column;
            gap: 30px;
            padding: 5px;
        }

        .proName 
        {
            display: flex;
            width: 100%;
            align-items: center;
            justify-content: space-between;

        }
        .proName input
        {
            width: 48%;

        }

        .proBtn
        {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            width: 100%;

        }
       
        .update
        {
            width: 80%;
            height: 45px;
            background-color: #fb8500;
            border:1px solid #fb8500;
            border-radius: 5px;
            display: flex;
            justify-content: center;
            align-items: center;
            transition: all 0.3s ease 0s;

        }  
        .update span:hover
        {
            color: #000;

        } 
        .update span
        {
            font-size: 1.3rem;
            color: #f8f9fa;

        }
        .logout
        {
            font-size: 1.2rem;
            color: white;
        }
        .logout:hover
        {
            color: #fb8500;
        }
</style>
  </head>
  <body>
     <%@include file="include/navbar.jsp" %>
     
     
     <%
     
     response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
     Users rr=new Users();
     if(session.getAttribute("email")==null)
     {
    	 response.sendRedirect("login.jsp?link=pro");
     }
     else
     {
    	 rr=new Users(session.getAttribute("email").toString(),session.getAttribute("pass").toString());
    	 rr=DbQuery.getData(rr);
    	 
     }
    
     %>
     <div class="container-fluid " style="max-width: 900px;margin-top:150px">
     
     <div class="container-fluid">
      <%
	        
	        Mess rr1=(Mess)session.getAttribute("msg");
	        
	        if(rr1!=null)
	        {
	        	%>
	        		 <div class="alert <%=rr1.getCl() %> p-2" role="alert">
	        	     <%=rr1.getMsg() %>
	        	   </div>
				<% }
	        session.removeAttribute("msg");	
	      		%>
     </div>
     
      <div class="container proCon" >

        <div class="head">
            <h2>My Profile</h2>
        </div>
        <div class="profile row">
            <div class="col-12 col-md-5 col-lg-5">
                <div class="proImage">
                    <img src="/Laba/Pictures/ProfilePic/<%=rr.getPro_pic()%>" alt="">
                </div>
            </div>
            <div class="col-12 col-md-7 col-lg-7">
                <div class="proContent">
                    <div class="proName">
                        <input type="text" class="form-control " placeholder="First name" value="<%=rr.getFname() %>"disabled>
                        <input type="text" class="form-control " placeholder="Last name" value="<%=rr.getLname() %>"disabled>

                    </div>
                    <input type="text" class="form-control" placeholder="Email"value="<%=rr.getEmail() %>" disabled>
                    <input type="password" class="form-control" placeholder="Password"value="<%=rr.getPass() %>" disabled>
                    <input type="text" class="form-control" placeholder="City"value="<%=rr.getCity() %>" disabled>
                    <div class="proBtn">            
                            <a href="update.jsp" class="update" data-toggle="modal" data-target="#exampleModal"><span> Update</span></a>
                            <a class="logout" href="/Laba/AdminLogout">Logout! </a>
                    </div>
                </div>
            </div>
        </div>


    </div>



</div>
<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Open modal for @mdo</button>
 -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header bas">
        <h5 class="modal-title text-light" id="exampleModalLabel">Update Profile</h5>
        <button type="button " class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form  method="post" action="UpdateProfile" id="frs" enctype="multipart/form-data">
        	
        	<div class="container-fluid text-center mb-2">
        	<div class="proImage">
                    <img src="Pictures/ProfilePic/<%=rr.getPro_pic() %>" alt="">
                </div>
   	 
		 <div class="form-group align-items-center">
      <input type="file" class="form-control-file" name="pro_pic">
      </div>
</div>

		
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">First Name:</label>
            <input type="text" class="form-control" name="fname" value="<%=rr.getFname() %>">
            <input type="hidden" class="form-control" name="id" value="<%=rr.getId() %>">
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label"> Last Name:</label>
            <input type="text" class="form-control" name="lname" value="<%=rr.getLname() %>" >
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label"> Password:</label>
            <input type="text" class="form-control" name="pass" value="<%=rr.getPass() %>">
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">Address:</label>
            <textarea class="form-control" id="city" name="city"><%=rr.getCity() %></textarea>
          </div>
       
     
 		<div class="container-fluid text-center">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btng text-light">Update</button>
        </div>
         </form>
          </div>
         
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