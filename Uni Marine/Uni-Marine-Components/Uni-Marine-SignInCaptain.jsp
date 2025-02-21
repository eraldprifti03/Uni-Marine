<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ page errorPage="ErrorHandler.jsp"%> <%@ page
import="Uni_Marine_java.*" %> <% String username
=request.getParameter("captainUsername"); String
password=request.getParameter("captainUsername"); CaptainDAO userdao = new
CaptainDAO(); try { Captain user = userdao.authenticate(username,password);
session.setAttribute("userObj2023Captain", user);
response.sendRedirect("Uni-Marine.jsp"); return; } catch(Exception e) {
request.setAttribute("message",e.getMessage()); %>
<jsp:forward page="Uni-Marine-Sign-In.jsp" />
<% } %>
