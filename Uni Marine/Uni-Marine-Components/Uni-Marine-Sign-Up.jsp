<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
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
    <meta charset="UTF-8" />
    <meta name="viwport" content="width=device-width, initial-scale=1.0" />
    <!-- <link rel="icon" type="image/x-icon" href="images/Logo-Eagle-Courier.jpg"> -->
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
          <header>Sign Up a an Owner</header>
        </div>
        <form
          action="Uni-Marine-SignUpController.jsp"
          method="POST"
          class="form-horizontal"
        >
          <div class="input-box">
            <input
              type="text"
              name="username"
              class="input-field"
              placeholder="Username"
              autocomplete="off"
              required
            />
          </div>

          <div class="input-box">
            <input
              type="password"
              name="password"
              class="input-field"
              placeholder="Password"
              autocomplete="off"
              required
            />
          </div>

          <div class="input-box">
            <input
              type="text"
              name="companyName"
              class="input-field"
              placeholder="Company Name"
              autocomplete="off"
              required
            />
          </div>

          <div class="input-submit">
            <button class="submit-btn" id="submit"></button>
            <label for="submit">Sign Up</label>
          </div>
        </form>
      </div>
      <div id="login-boxer">
        <div class="login-header">
          <header>Sign Up as a Captain</header>
        </div>
        <form
          action="Uni-Marine-SignUpCaptainContoller.jsp"
          method="POST"
          class="form-horizontal"
        >
          <div class="input-box">
            <input
              type="text"
              name="username"
              class="input-field"
              placeholder="Username"
              autocomplete="off"
              required
            />
          </div>

          <div class="input-box">
            <input
              type="password"
              name="password"
              class="input-field"
              placeholder="Password"
              autocomplete="off"
              required
            />
          </div>

          <div class="input-box">
            <input
              type="text"
              name="imo"
              class="input-field"
              placeholder="IMO code"
              autocomplete="off"
              required
            />
          </div>

          <div class="input-submit">
            <button class="submit-btn" id="submit"></button>
            <label for="submit">Sign Up</label>
          </div>
        </form>
      </div>
    </div>
  </body>
</html>
