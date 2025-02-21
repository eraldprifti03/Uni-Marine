<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Uni_Marine_java.*" %>
<%
String vesselName = request.getParameter("vesselName");
String imoString = request.getParameter("imo");
String crewSizeString = request.getParameter("crewSize");
String capacityString = request.getParameter("capacity");
String flag = request.getParameter("flag");
String companyName = request.getParameter("Conmpany Name");

Vessel vessel = null;
Vessels vessels = new Vessels();

try {
    // Validate crewSize
    if (!crewSizeString.matches("\\d+")) {
        throw new Exception("Crew Size must be a valid integer");
    }

    // Validate capacity
    if (!capacityString.matches("\\d+")) {
        throw new Exception("Capacity must be a valid integer");
    }

    Integer imo = Integer.parseInt(imoString);
    Integer crewSize = Integer.parseInt(crewSizeString);
    Integer capacity = Integer.parseInt(capacityString);

    vessel = new Vessel(imo, vesselName, crewSize, flag, capacity);
    vessels.register(vessel, companyName);

    request.setAttribute("message", "Registration successful!");
    %>
    <jsp:forward page="assignVessels.jsp" />
<%
} catch (Exception e) {
    request.setAttribute("message", e.getMessage());
    %>
    <jsp:forward page="assignVessels.jsp" />
<%
}
%>
