<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="ErrorHandler.jsp"%>

<%@ page import="Uni_Marine_java.*,java.util.List" %>


<%
session.invalidate();
%>

<!DOCTYPE html>
<html>
  <head>

    <!-- automatically will redirect to Uni-Marine-Sign-In.jsp after 2 seconds -->
	<meta http-equiv="refresh" content="2;url=Uni-Marine-Sign-In.jsp" />
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

    <link rel="stylesheet" href="css/Routes.css" />
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

      <div id="login-box">
        <div class="login-header">
          <header>You have successfully logged out
        </header>
        </div>

      </div>
    </div>

<style>
input[type=text], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid  ;
  border-radius: 4px;
  box-sizing: border-box;
}
  
label{
color:whitesmoke;
}


</style>



  </body>
</html>
