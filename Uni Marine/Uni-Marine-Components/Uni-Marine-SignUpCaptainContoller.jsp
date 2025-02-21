<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ page import="Uni_Marine_java.*" %>
<% 
String username = request.getParameter("username"); 
String password = request.getParameter("password"); 
String imoString = request.getParameter("imo"); 
Integer imo = Integer.parseInt(imoString); 
try{
Captain captain = new Captain(username,password,imo); 
CaptainDAO captainDao = new CaptainDAO(); 
captainDao.register(captain);
session.setAttribute("userObj2023Captain", captain);
response.sendRedirect("Uni-Marine.jsp");
return; 
} catch(Exception e)  { 
  request.setAttribute("message",e.getMessage());

%>
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
          <header><%=(String)request.getAttribute("message") %></header>
        </div>

        <div>
          <button onclick="location.href='http://ism.dmst.aueb.gr/ismgroup6/Uni-Marine-Sign-Up.jsp';" class="btn btn-primary">
              <span class="glyphicon glyphicon-chevron-left"></span> Back to the form
        </button>
          </button>



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


<% } %>
