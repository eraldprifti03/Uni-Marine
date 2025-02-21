<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ page errorPage="ErrorHandler.jsp"%> <%@ page
import="Uni_Marine_java.*" %> 
<% String username = request.getParameter("ownerUsername"); 
String password = request.getParameter("ownerPassword"); 
UserDAO userdao = new UserDAO();
try 
{ 
    User user = userdao.authenticate(username,password);
session.setAttribute("userObj2023", user);
response.sendRedirect("Uni-Marine.jsp");

} catch(Exception e) {
    request.setAttribute("message",e.getMessage());
    %>

<jsp:forward page="Uni-Marine-Sign-In.jsp" />
<% } %>
