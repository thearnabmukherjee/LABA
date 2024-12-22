<%@page import="entities.AdminUser"%>
<%@page import="helper.Mess"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
        <link rel="stylesheet" href="/Laba/style/adminstyle.css" type="text/css">
    <title>Add Books | Laba </title>
    <link rel="icon" href="images/lalogo.svg" type="image/icon type">
     <link rel="stylesheet" type="text/css" href="/Laba/style/addbook.css">
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
			background:#fb8500;
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
   
    color: black;
  
}


    </style>
</head>
<body>
 <%@include file="/include/adminNavbar.jsp" %>
 
  <%
  response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
 
  AdminUser zx=new AdminUser();
  response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
  if(session.getAttribute("aduser")==null)
  {
 	 response.sendRedirect("AdminLogin.jsp?link=pro");
  }
  else
  {
 	 zx=(AdminUser)session.getAttribute("aduser");
 	 
  }
 
 
  %>
 <div class="container-fluid " style="max-width: 900px;margin-top:150px">
 <%
     Mess rr=(Mess)session.getAttribute("msg");
     
     if(rr!=null)
     {%>
     <div class="container-fluid">
 <div class="alert <%=rr.getCl() %>" role="alert">
  <%=rr.getMsg() %>
</div>
</div>
    <% 	
    session.removeAttribute("msg");
     }
    
    
     %>
 
<div class="container-fluid">
<h2 class="text-light font-weight-bold "> Add New Book</h2>
</div>
  <div class="row align-items-center">
  <form method="post" action="/Laba/AddBook" id="frs" enctype='multipart/form-data'>
  <div class="row px-3">
    <div class="col col-lg-4 col-md-4 col-12 mt-4">
    <div class="drop-zone" >
        <span class="drop-zone__prompt">Drop Image Here or click to select</span> 
      
        <input type="file" name="myfile" id="" class="drop-zone__input">

    </div>
	
</div>
<div class="col col-lg-7 col-md-7 col-12">
  
    <div class="row">
      <div class="col">
        <input type="text"  class="form-control mt-4" placeholder="Book Name" name="pr_name" >
      	   </div>
      
       <div class="col">
        <input type="text" class="form-control mt-4" placeholder="Author" name="pr_author" >
      </div>
       <input type="text" class="form-control mt-4 ml-3 mr-3" placeholder="Price" name="pr_price" >
      <textarea class="form-control mt-4 ml-3 mr-3" id="exampleFormControlTextarea1" rows="3" placeholder="Description" name="pr_des"></textarea>
      
      <select class="form-control mt-4 ml-3 mr-3" name="pr_avai">
			 <option selected value="Available">Available</option>
			 <option value="Not Available">Not Available</option>
		</select>   	
    	
      <div class=" ytr container-fluid py-4 ">
      <div class=" proa col">
          <button class="button btn" type="submit">Add Book</button>
      </div>
      </div>
      </div>
    </div>
  </div>

  </form>
</div>
  </div>
  



</div>

 <%@include file="/include/footer.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
<script >
document.querySelectorAll(".drop-zone__input").forEach((inputElement) => {
    const dropZoneElement = inputElement.closest(".drop-zone");
  
    dropZoneElement.addEventListener("click", (e) => {
      inputElement.click();
    });
  
    inputElement.addEventListener("change", (e) => {
      if (inputElement.files.length) {
        updateThumbnail(dropZoneElement, inputElement.files[0]);
      }
    });
  
    dropZoneElement.addEventListener("dragover", (e) => {
      e.preventDefault();
      dropZoneElement.classList.add("drop-zone--over");
    });
  
    ["dragleave", "dragend"].forEach((type) => {
      dropZoneElement.addEventListener(type, (e) => {
        dropZoneElement.classList.remove("drop-zone--over");
      });
    });
  
    dropZoneElement.addEventListener("drop", (e) => {
      e.preventDefault();
  
      if (e.dataTransfer.files.length) {
        inputElement.files = e.dataTransfer.files;
        updateThumbnail(dropZoneElement, e.dataTransfer.files[0]);
      }
  
      dropZoneElement.classList.remove("drop-zone--over");
    });
  });
  
  function updateThumbnail(dropZoneElement, file) {
    let thumbnailElement = dropZoneElement.querySelector(".drop-zone__thumb");
  	console.log(file);
   
    if (dropZoneElement.querySelector(".drop-zone__prompt")) {
      dropZoneElement.querySelector(".drop-zone__prompt").remove();
    }
  
   
    if (!thumbnailElement) {
      thumbnailElement = document.createElement("div");
      thumbnailElement.classList.add("drop-zone__thumb");
      dropZoneElement.appendChild(thumbnailElement);
    }
  
    thumbnailElement.dataset.label = file.name;
  
    if (file.type.startsWith("image/")) {
      const reader = new FileReader();
  
      reader.readAsDataURL(file);
      console.log(reader.result);
      reader.onload = () => {
        thumbnailElement.style.backgroundImage = `url('${ reader.result }')`;
      };
    } else {
      thumbnailElement.style.backgroundImage = null;
    }
  }
  
</script>
</body>
</html>