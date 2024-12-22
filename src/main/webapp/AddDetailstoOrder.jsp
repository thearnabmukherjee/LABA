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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Order Details | Laba</title>
     <link rel="icon" href="images/lalogo.svg" type="image/icon type">
<style>
.navbar{
    background: #131313; 
    padding: 0.6rem 5rem;
   }
.txt
{
font-size:1.7rem;
font-weight: bold;
}
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
  
  <%
 int t=0;
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
		 t=1;
	 }

	 
	%>
  
  <div class="container-fluid">
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
         <a class="navbar-brand " href="index.jsp">
                <img class="navbar-brand" src="images/lalogo.svg" alt="" width="50" height="50" >
              </a>
         <p class="text text-light txt mt-2" >Order Details</p>
</nav>

</div>
<div class="container-fluid" style="margin-top:150px;">
<div class="container-fluid border border-light rounded mb-2 " style="background:#131313;max-width:910px">
 <div class="row">
<div class="col col-lg-8">
<p class="text text-light " style="font-size:1.5rem; font-weight: bold;">Book Details</p>
</div>
<div class="col col-lg-3">
<p class="text text-light " style="font-size:1.5rem; font-weight: bold;">Total Cost: <i class="fa fa-rupee" style="font-size:20px"></i><%out.print(total); %></p>
</div>
</div>
</div>
<div class="container-fluid" style="max-width:900px">


<table class="table">
  <thead class="thead-light">
    <tr>
      <th scope="col">#</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Quantity</th>
      <th scope="col">Total</th>
      
    </tr>
  </thead>
  <tbody>
  <%
	ResultSet rs=stm.executeQuery("select * from books inner join cart on books.id=cart.pr_id and cart.email='"+email+"' and cart.address is NULL");
	while(rs.next())
	{
		sno=sno+1;
		t=1;
	
	%>
    <tr>
      <th scope="row"><%out.print(sno); %></th>
      <td><%=rs.getString(2) %></td>
      <td><%=rs.getString(7) %></td>
      <td><i class="fa fa-rupee" style=""></i><%=rs.getString(11) %></td>
      <td><%=rs.getString(10) %></td>
      <td><i class="fa fa-rupee" style=""></i><%=rs.getString(12) %></td>
    </tr>
   <%} %>
  </tbody>
</table>


</div>

<div class="container-fluid border border-light rounded mt-5 mb-2 " style="background:#131313;max-width:910px">
<p class="text text-light " style="font-size:1.5rem;font-weight: bold;">PickUp Location and Recipient Details</p>
</div>
<% 
ResultSet rs3=stm.executeQuery("select * from users where email='"+email+"'");
	if(rs3.next())
	{
		
	
	%>
<div class="container-fluid "style="max-width:900px">
<form method="POST" action="PlaceOrder">
<div class="row">
<div class="col">
<input type="hidden" name="id" value="<%=rs3.getString(1) %>" >

<input type="text"  class="form-control mt-4" placeholder="First Name" name="fname" value="<%=rs3.getString(2) %>" >

</div>
<div class="col">
<input type="text"  class="form-control mt-4" placeholder="Last Name" name="lname" value="<%=rs3.getString(3) %>">
</div>
</div>

<div class="row"> 
<div class="col">
<input type="text"  class="form-control mt-4" placeholder="Phone" name="phone" value="<%=rs3.getString(8) %>" >
</div>
<div class="col">
<input type="text"  class="form-control mt-4" placeholder="Email" name="email" value="<%=rs3.getString(4) %>" readonly disabled >
</div>
<%}%>
</div>
<div class="row "> 
<select class="form-control m-3" name="location">
<option>--------Select Pickup Location----------</option>
<%
	ResultSet rs2=stm.executeQuery("select * from pickuplocation");
	while(rs2.next())
	{
		
	
	%>

  <option value="<%=rs2.getString(3)%>"><% out.print(rs2.getString(2)+","+rs2.getString(3));%></option>

<%} %>
</select>
</div>

<div class="row m-2 ">
<button class=" button btn" type="submit">Place Your Order</button>
</div>
</form>
</div>





</div>
<!--  main container-->

<% } }
 catch(Exception e)
 {
	 System.out.print(e);
 }
 %>
 
 <%@include file="include/footer.jsp" %>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>