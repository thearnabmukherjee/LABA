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
    max-height:43px;
    color:fff;
    text-decoration:none;
    font-size:1.3rem;
    
    }
     .btn1:hover
    {
   
    color:000;
    
    }
    .txt-ne
    {
    font-size: 1.7rem;
    }
    .txtp
    {
    font-size: 1.5rem;
    
    margin:0px;
    }
     .txtq
    {
    margin:2px;
    font-size: 1.5rem;
    }
    .cart_img{
    max-width:130px;
     max-height:200px;
     object-fit: contain;
    }
    .btn5
    {
    background: #00bf86;
  
    color:fff;
    text-decoration:none;
    font-size:1.3rem;
    
    }
    .btn-red
    {
    color:#ff0000;
    }
    .btn-gre
    {
    color:#00bf86;
    }
    
    .txt-pr{
    font-size:1.5rem;
    } 
     @media screen and  (max-width: 767.98px) { 
      .txt-pr{
    font-size:1.3rem;
    } 
     .btn1
    {
   width:18rem;
    max-height:43px;
   
    }
     .cart_img{
    max-width:130px;
    
    }
     
     }
   </style>
    
   
</head>
<body>
 <%@include file="include/navbar.jsp" %>
 
 
 <div class="container-fluid" style="margin-top:150px; max-width:1300px;" >


 
    
    
 
   
   
    
   
 <%
 int t=0,z=0;
 int total=0;
 int sno=0;
 try
 {
	if(session.getAttribute("email")==null)
 	{
 	response.sendRedirect("login.jsp?link=cart");
 	}
 else
 {
 	 
	 String email=session.getAttribute("email").toString();
	 Connection con=DbQuery.connect();
	 Statement stm=con.createStatement();
	 String ss="select sum(total) from cart where email='"+email+"' and address is NULL ";
	 ResultSet rs1=stm.executeQuery(ss);
	 while(rs1.next())
	 {
		 total=rs1.getInt(1);
		
	 }
	 
	%>
	<div class="container-fluid">
	 <%
	        
	        Mess rr1=(Mess)session.getAttribute("msgr");
	        
	        if(rr1!=null)
	        {
	        	%>
	        		 <div class="alert <%=rr1.getCl() %> p-2" role="alert">
	        	     <%=rr1.getMsg() %>
	        	   </div>
				<% }
	        session.removeAttribute("msgr");	
	      		%>
	</div>
	
	
	      
	       	
	<% 
	        if(total>0){
	        	 t=1;
	        %>
	        <div class="container-fuild">
	<div class="row mx-auto border rounded border p-3 mx-auto justify-content-center " style="border-color:#cccccc">
	 
	<p class="txt col-lg-8 col-md-8 col-10 txt-pr font-weight-bold">Total Price of cart: <font color="#FF8000">  <i class="fa fa-rupee" style="font-size:20px"></i><%out.print(total); %></font></p>
	 <a href="AddDetailstoOrder.jsp" class=" btn btn1 text-light  col-lg-3 col-md-3 col-10">Place your order</a>
	</div>
	
	
		
		<%}%>
		</div>
	
	
	
	
	<%
	ResultSet rs=stm.executeQuery("select * from books inner join cart on books.id=cart.pr_id and cart.email='"+email+"' and cart.address is NULL");
	while(rs.next())
	{
		sno=sno+1;
		t=1;
	
	%>
		 <div class="row mx-auto border rounded border p-md-2 p-lg-3 p-sm-2 p-2 mt-3 mb-5" style="border-color:#cccccc">
		
		 <div class="col col-lg-2 col-md-2 col-4 ">
	      <img src="Pictures/booksPic/<%=rs.getString(6)%>" class="img-fluid cart_img" alt="...">
	      </div> 
	       <div class="col col-lg-7 col-md-7 col-8">
	       <h5 class="text font-weight-bold" style="margin:0 ;font-size:25px" ><%=rs.getString(2) %></h5>
	        <p class="text" style="margin:0;font-size:1rem" >By: <%=rs.getString(7) %></p>
	        <p class=" txtq" ><a href="IncDec?id=<%=rs.getInt(1)%>&qun=dec"><i class='fa fa-minus-circle btn-red'></i></a> <%=rs.getString(10) %>  <a href="IncDec?id=<%=rs.getInt(1)%>&qun=inc"><i class='fa fa-plus-circle btn-gre'></i></a></p>
	        <p class=" txtp">Price : <font color="#FF8000"><i class="fa fa-rupee" style="font-size:20px"></i><%=rs.getString(12) %></font></p>
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
	        <div class="col col-lg-3 col-md-3 col-12 p-3 ">
	        <div class="row justify-content-center">
	        <a href="RemoveFromCart?id=<%=rs.getInt(1)%>" class=" btn btn-outline-danger text-red">Remove from Cart</a>
	        </div>
	      </div>
	    </div>
	    
	<%
	}
	session.removeAttribute("msg");
    if(t==0)
{%>
  <div class="container-fluid" style="max-width:1300px;">
<div class="alert alert-primary " role="alert">
No Books in cart.
</div>
<div class="row justify-content-center mb-5">
<a href="BooksIndex.jsp" class=" btn btn5 text-light">Add to cart</a>
</div>

</div>
<%}


 
 }
 }
 catch(Exception e)
 {
	 System.out.print(e);
 }
 %>
 

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
  
