<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="appError.jsp" %>
<%@ page import="Uni_Marine_java.*,java.util.List" %>



<!DOCTYPE html>
<html>
  <head>
    <style>
      .navbar {
        background-color: black;
        position: fixed;
        top: 0;
        left: 0;
        height: 55px;
        width: 100%;
      }
      .navbar a.nav-link {
        line-height: 50px;
        color: white;
      }
    </style>
    <title>Uni Marine</title>
    <meta charset="UTF-8" />
    <meta name="viwport" content="width=device-width, initial-scale=1.0" />
    <!-- <link rel="icon" type="image/x-icon" href="images/Logo-Eagle-Courier.jpg"> -->
    <link rel="stylesheet" href="css/Sign-In.css" />
  </head>
  <body>
    <div id="body">
      <header class="d-flex flex-column h-100">
        <nav class="navbar">
          <div class="container-fluid">
            <a class="navbar-brand">
              <strong>Uni Marine</strong>
            </a>
            <a
              class="nav-link active"
              id="first"
              aria-current="page"
              href="Uni-Marine.jsp"
              >Home</a
            >
            <div class="dropdown">
              <button class="dropbtn">Passengers</button>
              <div class="dropdown-content">
                <a href="fetchPassengers.jsp">Fetch</a>
                <a href="assignPassengers.jsp">Assign</a>
              </div>
            </div>
            <div class="dropdown">
              <button class="dropbtn">List Vessels</button>
              <div class="dropdown-content">
                <a href="fetchVessels.jsp">Fetch</a>
                <a href="assignVessels.jsp">Assign</a>
              </div>
            </div>
            <a class="nav-link" href="Uni-Marine-Routes.jsp">Routes</a>
            <a class="nav-link" href="Uni-Marine-Sign-In.jsp">Sign In/Up</a>
            <%
            if (session.getAttribute("userObj2023") != null) {
              User usr = (User) session.getAttribute("userObj2023");
            %>
            <a class="nav-link " href="Uni-Marine-Logout.jsp"style="text-decoration:underline; float:right">Sign Out </a>
            <a class="nav-link "  style=" float:right">Sign in as <%=usr.getUsername() %> </a>
            <% } else if(session.getAttribute("userObj2023Captain") != null) {
              Captain usr = (Captain) session.getAttribute("userObj2023Captain");%>
              <a
              class="nav-link"
              href="Uni-Marine-Logout.jsp"
              style="text-decoration: underline; float: right"
              >Sign Out
            </a>
            <a class="nav-link" style="float: right"
              >Sign in as <%=usr.getUsername() %>
            </a>
            <% } %> 
          </div>
        </nav>
      </header>
       <div>
        <% if(request.getAttribute("message") != null) { %>		
          <div class="input-box"><h3 style="color: white;font-size:18px; text-align:center ; "><%=(String)request.getAttribute("message") %></h3> </div>
      <% } %>
      <div id="login-box">

        

        <div class="login-header">
          <header style="text-align: left;">Sign In as an Owner</header>
        </div>
        <form class="form-signin" method="post" action="Sign_In_Controller.jsp">
        <div class="input-box">
          <input
            type="text"
            class="input-field"
            name="ownerUsername"
            placeholder="Username"
            autocomplete="off"
          />
        </div>
        
        <div class="input-box">
          <input
            type="password"
            class="input-field"
            name="ownerPassword"
            placeholder="Password"
            autocomplete="off"       
          />
        </div>

        
        <div class="input-submit">
          
          <button class="submit-btn" id="submit"></button>
          
          <label for="submit">Sign In</label>
        </div>

        <div class="sign-up-link">
          <p>
            Don't have an account? <a href="Uni-Marine-Sign-Up.jsp">Sign Up</a>
          </p>
        </div>
      </div>
   </div>
  </form>

   <div>
      <div id="login-boxer">
        <div class="login-header">
          <header style="text-align: left;">Sign In as a Captain</header>
        </div>
      <form class="form-signin" method="post" action="Uni-Marine-SignInCaptain.jsp">
       <div class="input-box">
          <input
            type="text"
            class="input-field"
            name="captainUsername"
            placeholder="Username"
            autocomplete="off"
           
          />
        </div>
    
        <div class="input-box">
          <input
            type="password"
            class="input-field"
            name="captainPassword"
            placeholder="Password"
            autocomplete="off"          />
        </div>

       

    

        <div class="input-submit">
          
          <button class="submit-btn" id="submit"></button>
          
          <label for="submit">Sign In</label>
        </div>
      </form>
        <div class="sign-up-link">
          <p>
            Don't have an account? <a href="Uni-Marine-Sign-Up.jsp">Sign Up</a>
          </p>
        </div>
      </div>
 </div>
    </div>
  </body>
</html>

