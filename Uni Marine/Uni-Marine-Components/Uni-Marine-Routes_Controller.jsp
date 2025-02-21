<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="Uni_Marine_java.*" %>



<% 
String from = request.getParameter("Beginning");
String to = request.getParameter("Destination");


if (from == null || from.equals("") || to==null || to.equals("")) {
    
    %>
    <jsp:forward page="Uni-Marine-Routes.jsp"/>
<%
    return;
}


Route route = new Route();
PortService portService = new PortService();



Port port1 = portService.getPortByID(Integer.parseInt(from));
Port port2 = portService.getPortByID(Integer.parseInt(to));
request.setAttribute("from",port1.getName());
request.setAttribute("to",port2.getName());


String time = route.getEstTime(port1.getId(),port2.getId());
request.setAttribute("estTime",time);

%>
<jsp:forward page="Uni-Marine-Routes.jsp"/>


