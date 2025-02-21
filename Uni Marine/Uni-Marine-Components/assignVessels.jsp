<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="Uni_Marine_java.*" %>


<%
if (session.getAttribute("userObj2023Captain") != null) {
  request.setAttribute("message","Only owners are authorized to access this resource.");

%> 
<jsp:forward page="Uni-Marine-Sign-In.jsp"/> 
<%

} else if (session.getAttribute("userObj2023") == null) {
  request.setAttribute("message","You are not authorized to access this resource. Please login.");
%>
<jsp:forward page="Uni-Marine-Sign-In.jsp"/> 
<%

}
 
User user = (User) session.getAttribute("userObj2023");
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
      .input-submit {
        text-align: center;
        width: 200px;
        margin-inline-start: auto;
        position: relative;
        top: -60px;
        left: 250px;
      }
      .login-header header {
        margin-top: -100px;
      }
      .input-box {
        position: relative;
        left: 350px;
        top: -70px;
      }
      .login-header {
        position: relative;
        top: -20px;
        left: 370px;
      }
    </style>
    <title>Uni Marine</title>
    <meta charset="UTF-8" />
    <meta name="viwport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/Sign-Up.css" />
  </head>
  <body>
    <div id="body">
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
   
        <div id="login-box">
          <div class="login-header">
            <header>Assign Vessel's Info</header>
          </div>
          <% if(request.getAttribute("message") != null) { %>		
           <div class="input-box"><h5 style="color: white;font-size:18px; text-align:center ; "><%=(String)request.getAttribute("message") %></h5> </div>
        <% } %>
          <form
          action="assignVesselsController.jsp"
          method="POST"
          class="form-horizontal"
        >
          <div class="input-box">
            <input
              type="text"
              class="input-field"
              name="vesselName"
              placeholder="Vessel's Name"
              autocomplete="off"
              required
            />
          </div>

          <div class="input-box">
            <input
              type="text"
              class="input-field"
              name="imo"
              placeholder="IMO code"
              autocomplete="off"
              required
            />
          </div>

          <div class="input-box">
            <input
              type="text"
              class="input-field"
              name="crewSize"
              placeholder="Crew size"
              autocomplete="off"
              required
            />
          </div>
          <div class="input-box">
            <input
              type="text"
              class="input-field"
              name="capacity"
              placeholder="Capacity"
              autocomplete="off"
              required
            />
          </div>
          <div class="input-box">
            <input
              type="text"
              class="input-field"
              name="flag"
              placeholder="Flag"
              autocomplete="off"
              required
            />
          </div>
         
          <div class="input-box">
            <input
            readonly value="<%= user.getCompanyName() %>"
              type="text"
              class="input-field"
              name="Conmpany Name"
              placeholder="Company Name"
              autocomplete="off"
              required
            />
          </div>
          <div class="input-submit">
            <button id="submit Button">Submit</button>
          </div>
        </div>
      </form>
    </div>
  </body>
</html>
