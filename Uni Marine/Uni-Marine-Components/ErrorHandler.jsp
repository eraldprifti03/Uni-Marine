<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
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
          </div>
        </nav>
      </header>

      <!-- Page Title -->
      <div class="page-header">
        <h1>Oops something went wrong</h1>
      </div>

      <div class="row">
        <div class="col-xs-12">
          <h2>Description</h2>

          <% if(exception != null) { %>
          <p><code><%=exception %></code></p>
          <% } %>
        </div>
      </div>
    </div>
    <!-- /container -->
  </body>
</html>
