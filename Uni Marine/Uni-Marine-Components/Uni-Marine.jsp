<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Uni_Marine_java.*" %>

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
        <meta charset="UTF-8">
        <meta name="viwport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/Uni-Marine.css"> 
       
    </head>
    <body>
      <div id="body"> 
        <header class="d-flex flex-column h-100">
          <%
              if (session.getAttribute("userObj2023") != null) {
                User usr = (User) session.getAttribute("userObj2023");
              %>
          <nav class="navbar">
            <div class="container-fluid">
              <a class="navbar-brand">
                <strong>Uni Marine</strong>
              </a>
              <a class="nav-link" href="Uni-Marine.jsp" style="text-decoration: none;">Home</a>
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
              <a class="nav-link" href="Uni-Marine-Routes.jsp" style="text-decoration: none;">Routes</a>
              <a class="nav-link" href="Uni-Marine-Sign-In.jsp"style="text-decoration: none;">Sign In/Up</a>
              <a class="nav-link navbar-right" href="Uni-Marine-Logout.jsp"style=" float:right">Sign Out</a>
              <a class="nav-link navbar-right" style="text-decoration: none; float:right">Sign in as <%=usr.getUsername() %> </a>
            </div>
          </nav>
          <% } else if (session.getAttribute("userObj2023Captain") != null) {
            Captain usr = (Captain) session.getAttribute("userObj2023Captain");%>
            <nav class="navbar">
              <div class="container-fluid">
                <a class="navbar-brand">
                  <strong>Uni Marine</strong>
                </a>
                <a class="nav-link" href="Uni-Marine.jsp" style="text-decoration: none;">Home</a>
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
                <a class="nav-link" href="Uni-Marine-Routes.jsp" style="text-decoration: none;">Routes</a>
                <a class="nav-link" href="Uni-Marine-Sign-In.jsp"style="text-decoration: none;">Sign In/Up</a>
                <a class="nav-link navbar-right" href="Uni-Marine-Logout.jsp"style=" float:right">Sign Out</a>
                <a class="nav-link navbar-right" style="text-decoration: none; float:right">Sign in as <%=usr.getUsername() %> </a>
              </div>
            </nav>
            <% }else { %>
            <nav class="navbar">
              <div class="container-fluid">
                <a class="navbar-brand">
                  <strong>Uni Marine</strong>
                </a>
                <a class="nav-link" href="Uni-Marine.jsp" style="text-decoration: none;">Home</a>
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
                <a class="nav-link" href="Uni-Marine-Routes.jsp" style="text-decoration: none;">Routes</a>
                <a class="nav-link" href="Uni-Marine-Sign-In.jsp"style="text-decoration: none;">Sign In/Up</a>
              </div>
            </nav>
            <% } %>

        </header>

            <div id="main-content">
                <h1>Uni Marine LLC</h1>
                    <p class="fist-paragraph">
                        Καλώς ήρθατε στην ιστοσελίδα της ναυτιλιακής επιχείρησης: <strong>Uni Marine</strong>!                    
                    </p>

                </p>
                    <div class="image-wrapper">
                       <img src="images/ploio.jpg" alt="Logo-Uni-Marine">
                    </div>
              </div>

            </div>
            
          
    </body>

    </html>
 