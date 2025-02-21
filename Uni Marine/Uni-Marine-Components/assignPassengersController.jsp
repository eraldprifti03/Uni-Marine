<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ page import="java.io.*, java.util.List,
java.util.ArrayList"%> <%@ page errorPage="ErrorHandler.jsp"%> <%@ page
import="org.apache.commons.fileupload.FileItem,
org.apache.commons.fileupload.FileItemFactory,
org.apache.commons.fileupload.servlet.ServletFileUpload,
org.apache.commons.fileupload.disk.DiskFileItemFactory"%> <%@ page
import="Uni_Marine_java.*" %> <%@ page isELIgnored="false" %> <%@ page
trimDirectiveWhitespaces="true" %> <%@ page import="java.io.BufferedReader,
java.io.InputStreamReader" %> <% if
(ServletFileUpload.isMultipartContent(request)) { FileItemFactory factory = new
DiskFileItemFactory(); ServletFileUpload upload = new
ServletFileUpload(factory); List<FileItem>
  items = upload.parseRequest(request); for (FileItem item : items) { if
  (!item.isFormField()) { BufferedReader reader = null; try { reader = new
  BufferedReader(new InputStreamReader(item.getInputStream())); String line;
  while ((line = reader.readLine()) != null) { String[] data = line.split(",");
  if (data.length != 6) { throw
new Exception("The csv file must follow this format:<table><tr><th>Firstname</th><th>Lastname</th><th>Age</th><th>Ethnicity</th><th>IMO</th><th>RouteID</th></tr></table>"); 
    } String
  firstName = data[0].trim(); String lastName = data[1].trim(); String ageStr =
  data[2].trim(); String ethnicity = data[3].trim(); String imoStr =
  data[4].trim(); String routeIDStr = data[5].trim(); if (firstName.isEmpty() ||
  lastName.isEmpty() || ageStr.isEmpty() || ethnicity.isEmpty() ||
  imoStr.isEmpty() || routeIDStr.isEmpty()) { throw new Exception("A column was left empty"); } int
  age = Integer.parseInt(ageStr); int imo = Integer.parseInt(imoStr); int
  routeID = Integer.parseInt(routeIDStr); Passenger passenger = new
  Passenger(firstName, lastName, age, ethnicity, imo, routeID); Passengers
  passengers = new Passengers(); passengers.register(passenger); } } catch
  (Exception e) { e.printStackTrace(); request.setAttribute("message",
  e.getMessage()); %><jsp:forward page="assignPassengers.jsp" /><% } finally {
  if (reader != null) { try { reader.close(); } catch (IOException e) {
  e.printStackTrace(); } } } } } response.sendRedirect("Uni-Marine.jsp"); } %>
</FileItem>
