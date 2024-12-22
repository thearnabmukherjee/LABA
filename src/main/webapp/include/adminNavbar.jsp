
    <div class="container-fluid">
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
            <a class="navbar-brand " href="index.jsp">
                <img class="navbar-brand" src="images/lalogo.svg" alt="" width="50" height="50" >
              </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
          
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav mr-auto mb-2 mb-lg-0 ">
                <li class="nav-item active">
                  <a class="nav-link" href="index.jsp#vidhome">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="AdminBook.jsp">Books </a>
                  </li> 
                <li class="nav-item">
                  <a class="nav-link" href="addBook.jsp">Add Book</a>
                </li>
            </li>
            
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                   My Account
                  </a>
                  <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="AdminProfile.jsp">Profile</a>
                    <a class="dropdown-item" href="IncommingOrders.jsp">Orders</a>
                    <div class="dropdown-divider"></div>
                    <%if(session.getAttribute("aduser")==null)
                    	{%>
                    	<a class="dropdown-item" href="AdminLogin.jsp?link=log">Login</a>
                    	<%}
                    else
                    {%>
                    	 <a class="dropdown-item" href="/Laba/AdminLogout">Logout</a>
                    <%}
                    	%>
                   
                  </div>
                </li>
           
              </ul>
             
              <a class="btn " href="IncommingOrders.jsp">Orders</a>
            </div>
          </nav>
          </div>
          
  