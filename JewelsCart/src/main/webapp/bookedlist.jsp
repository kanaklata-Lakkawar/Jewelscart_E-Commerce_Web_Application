<%@page import="com.in.model.Payment"%>
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
Query q = sc.createQuery("from com.in.model.Payment");
ArrayList<Payment> li = (ArrayList<Payment>)q.list();
%>
<br>
<div class="container">
 
  <table class="table table-bordered">
    <thead>
    <tr>
            <th colspan="3">Customer Info</th>
            <th colspan="3">Product Details</th>
            <th colspan="3">Payment Details</th>
             <th colspan="3">Delivery Address Info</th>
        </tr>
      <tr>
        <th scope="col">Sr. No.</th>
        <th scope="col">Image</th>
        
        <th scope="col">Email</th>
        <th scope="col">Item</th>
        <th scope="col">Qty</th>
        <th scope="col">Price</th>
        
        <th scope="col">Card Holder</th>
        <th scope="col">Card Number</th>
        <th scope="col">CVV</th>
         <th scope="col">Address</th>
        <th scope="col">Pincode</th>
        
      </tr>
    </thead>
    <tbody>
      <% 

      SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy", Locale.ENGLISH);
    
         for(Payment p : li) { 
          Date exp = p.getExpiryDate();
            String formattedDob = (exp != null) ? sdf.format(exp) : "";
            %>
      <tr>
       <td><%= p.getPayId() %></td>
        <td><img src="./upload/<%=p.getImageName()%>" width="200" height="200"></td>
       
        <td><%= p.getEmail() %></td>
        <td><%= p.getItem() %></td>
        <td><%= p.getQty() %></td>
        <td><%= p.getPrice() %></td>
        <td><%= p.getCardHolderName() %></td>
        <td><%= p.getCardNumber() %></td>
        <td><%= p.getCvv() %></td>
        <td><%= p.getAddress() %></td>
         <td><%= p.getPincode() %></td>
      </tr>
      <% } %>
    </tbody>
  </table>
</div>
<!-- Bootstrap JavaScript Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
