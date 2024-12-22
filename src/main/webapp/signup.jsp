<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
   <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
        background-color: #00bf86;
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
      color: #00bf86;
      
    }
    .txta:hover
    {
      color: #fff;
    }
    
        </style>
    <title>Signup</title>
    <link rel="icon" href="images/lalogo.svg" type="image/icon type">
  </head>
  <body>
    <div class="text-center mt-5">
        
        <form class="form-signin " style="max-width: 300px;margin: auto;" method="post" action="SignUp" id="frm">
          <img class="mb-4" src="images/lalogo.svg" alt="" width="72" height="72">
          <h1 class="h3 mb-3 font-weight-normal text-light">Please Sign Up</h1>
          <input type="text" id="inputFname" class="form-control mt-3" name="fname" placeholder="First Name" required="" autofocus="">
          <input type="text" id="inputLname" class="form-control mt-3" name="lname" placeholder="Last Name" required="" >
          <input type="email" id="inputEmail" class="form-control mt-3" name="email" placeholder="Email address" required="" >
          <input type="text" id="inputCity" class="form-control mt-3" name="city" placeholder="City" required="" >
          <input type="password" id="inputPassword" class="form-control mt-3" name="pass" placeholder="Password" required="">
          <button class="button btn mt-4" type="submit">Sign Up</button>
          <p class="txtr text mt-4">Already a Member <a class="txta fw-bold" href="login.jsp">Login</a></p>
          <p class="mt-4 mb-3 text-muted">© 2021 Laba Co...</p>
        </form>
  </div>
 
     <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>


<script>

		$(document).ready(function(){
			
			$('#frm').on('submit',function(event){
				event.preventDefault();
				
				let form=new FormData(this);
				$.ajax({
					url:"SignUp",
					type:'POST',
					data:form,
					success:function(data,textStatus,jqXHR){
						console.log(data);
						window.location="login.jsp"
					},
					error:function(jqXHR,textStatus,error)
					{
						console.log(jqXHR);
					},
					processData:false,
					contentType:false
				});
				
			});
		});



</script>
  </body>
</html>