<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ page import="Uni_Marine_java.*" %>
<%@ page import="java.util.List" %>

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
      }

      table {
        font-family: arial, sans-serif;
        border-collapse: collapse;
        width: 80%; /* Adjust the width as needed */
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
        margin-top: -400px; /* Adjust the top margin as needed to control the vertical positioning */
      }

      .search-container input {
        width: 200px; /* Adjust the width as needed */
        padding: 8px;
      }

      .search-container button {
        background-color: #007bff;
        color: white;
        padding: 15px 16px;
        border: none;
        cursor: pointer;
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
        </div>
      </nav>
    </header>
    <table>
      <tr>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Age</th>
        <th>Ethnicity</th>
        <th>IMO</th>
        <th>RouteID</th>
      </tr>
      <%
    Passengers passengers = new Passengers();
    String givenImo = request.getParameter("search");
    List<Passenger> allpassengers = passengers.getPassengers(givenImo);
      for(Passenger myPassenger : allpassengers){
%>
      <tr>
        <td><%=myPassenger.getFirstName() %></td>
              <td><%=myPassenger.getLastName() %></td>
              <td><%=myPassenger.getAge() %></td>
              <td><%=myPassenger.getEthnicity() %></td>
              <td><%=myPassenger.getImo() %></td>
              <td><%=myPassenger.getRouteID() %></td>

      </tr>
      <% } %>
    </table>
  </body>
</html>
