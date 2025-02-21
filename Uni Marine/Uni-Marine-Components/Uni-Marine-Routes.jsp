<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="Uni_Marine_java.*,java.util.List" %>

<%
PortService portService = new PortService();
List<Port> ports = portService.getPorts();

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
          <header>Estimated journey time</header>
        </div>



<div>
  <%
	if (request.getAttribute("estTime") == null) {	
%>
        <form method="get" action="Uni-Marine-Routes_Controller.jsp">
<div >
  

 <label for="Beginning">Beginning </label>
    <select id=port" name="Beginning">
      <option value="">--- From ---</option>
      <%
                  for (Port port: ports) {
      %>
                                          <option value="<%=port.getId() %>"><%=port.getName() %></option>
      <%
                  }
      %>  
      

    </select>
    


<label for="Destination">Destination</label>
    <select id=port" name="Destination">
      <option value="">--- To ---</option>
      <%
                  for (Port port: ports) {
      %>
                                          <option value="<%=port.getId() %>"><%=port.getName() %></option>
      <%
                  }
      %> 
    </select>
  
  </div>

        <div class="input-submit">
          <button type="submit" class="submit-btn" id="submit"></button>
          <label for="submit">Calculate</label>
        </div>

        <div class="input-box">
          <input type="text" id="outputResult" name="outputResult" placeholder="Estimated time" autocomplete="off" readonly>
    
          </div>
        
        </form>

        <% } else {
          %>
          <form method="get" action="Uni-Marine-Routes_Controller.jsp">
            <div >
              
            
             <label for="Beginning">Beginning </label>
                <select id=port" name="Beginning">
                  <option value=""><%=(String)request.getAttribute("from") %></option>
                  <%
                              for (Port port: ports) {
                  %>
                                                      <option value="<%=port.getId() %>"><%=port.getName() %></option>
                  <%
                              }
                  %>  
                  
            
                </select>
                
            
            
            <label for="Destination">Destination</label>
                <select id=port" name="Destination">
                  <option value=""><%=(String)request.getAttribute("to") %></option>
                  <%
                              for (Port port: ports) {
                  %>
                                                      <option value="<%=port.getId() %>"><%=port.getName() %></option>
                  <%
                              }
                  %> 
                </select>
              
              </div>
            
                    <div class="input-submit">
                      <button type="submit" class="submit-btn" id="submit"></button>
                      <label for="submit">Calculate</label>
                    </div>
            
      
                     
                      <div class="input-box">
                        <input type="text" id="outputResult" name="outputResult"  autocomplete="off" readonly value="${estTime}">
                  
                        </div>

                    </form>

                    <%
                  }
                  %>
   
    
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
