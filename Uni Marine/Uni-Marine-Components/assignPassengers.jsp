<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ page import="Uni_Marine_java.*" %> <%@ page
errorPage="ErrorHandler.jsp"%> 

<% if (session.getAttribute("userObj2023") ==
null && session.getAttribute("userObj2023Captain") == null ) {
request.setAttribute("message","You are not authorized to visit this resource.Please Login."); %>
<jsp:forward page="Uni-Marine-Sign-In.jsp" />

<% } %>

<!DOCTYPE html>
<html>
  <head>
    <style>
      body {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        background-color: #f0f0f0;
      }

      table {
        font-family: arial, sans-serif;
        border-collapse: collapse;
        width: 80%;
        background-color: aliceblue;
      }

      th {
        border: 1px solid #ebebeb;
        text-align: left;
        padding: 8px;
        font-weight: bold;
      }

      td {
        border: 1px solid #f6f0f0;
        text-align: left;
        padding: 8px;
      }

      tr:nth-child(even) {
        background-color: #fffcfc;
      }

      .search-container {
        text-align: center;
        margin-top: -100px;
      }

      .search-container input {
        width: 200px;
        padding: 8px;
      }

      .search-container button {
        background-color: #007bff;
        color: white;
        padding: 15px 16px;
        border: none;
        cursor: pointer;
      }

      h2 {
        color: white;
        margin-top: -300px;
      }
    </style>
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/List-Vessels.css" />
  </head>
  <body>
    <header class="d-flex flex-column h-100">
      <nav class="navbar">
        <div class="container-fluid">
          <a class="navbar-brand">
            <strong>Uni Marine</strong>
          </a>
          <a class="nav-link active" href="Uni-Marine.jsp">Home</a>
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
          <% if (session.getAttribute("userObj2023") != null) {
             User usr = (User) session.getAttribute("userObj2023"); %>
          <a
            class="nav-link"
            href="Uni-Marine-Logout.jsp"
            style="text-decoration: underline; float: right"
            >Sign Out
          </a>
          <a class="nav-link" style="float: right"
            >Sign in as <%=usr.getUsername() %>
          </a>
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
    <form
      action="assignPassengersController.jsp"
      method="post"
      enctype="multipart/form-data"
    >
      <h2>Put your CSV file with passenger's info</h2>
      <input type="file" name="file" accept=".csv" />
      <button type="submit">Upload</button>
    </form>

    <% if(request.getAttribute("message") != null) { %>
    <div class="input-box">
      <h5 style="font-size: 18px; text-align: center">
        <%=(String)request.getAttribute("message") %>
      </h5>
    </div>
    <% } %>
  </body>
</html>
