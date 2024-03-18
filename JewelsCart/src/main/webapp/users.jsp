<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.in.model.User"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="org.hibernate.query.Query"%>
<%@ page import="org.hibernate.Transaction"%>
<%@ page import="org.hibernate.Session"%>
<%@ page import="org.hibernate.SessionFactory"%>
<%@ page import="org.hibernate.cfg.Configuration"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Users List</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<body>
<%@ include file="adminnav.html" %>
<%
Configuration cfg = new Configuration();
cfg.configure("hiber.cfg.xml");
SessionFactory sf = cfg.buildSessionFactory();
Session sc = sf.openSession();
Transaction tx = sc.beginTransaction();
Query q = sc.createQuery("from com.in.model.User");
ArrayList<User> li = (ArrayList<User>)q.list();
%>
<br>
<div class="container">
 
  <table class="table table-bordered">
    <thead>
      <tr>
        <th scope="col">Sr. No.</th>
        <th scope="col">First Name</th>
        <th scope="col">Last Name</th>
        <th scope="col">Gender</th>
        <th scope="col">DOB</th>
        <th scope="col">Mobile No.</th>
        
      </tr>
    </thead>
    <tbody>
      <% 

      SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy", Locale.ENGLISH);
    
         for(User u : li) { 
          Date dob = u.getDob();
            String formattedDob = (dob != null) ? sdf.format(dob) : "";
            %>
      <tr>
        <td><%= u.getId() %></td>
        <td><%= u.getFirstName() %></td>
        <td><%= u.getLastname() %></td>
        <td><%= u.getGender() %></td>
        <td><%= formattedDob %></td>
        <td><%= u.getMob() %></td>
      </tr>
      <% } %>
    </tbody>
  </table>
</div>
<!-- Bootstrap JavaScript Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
