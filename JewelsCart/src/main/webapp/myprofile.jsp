<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.in.model.User"%>
<%@ page import="java.util.List" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: black;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .profile-details {
            margin-bottom: 20px;
        }

        .profile-details label {
            font-weight: bold;
            display: inline-block;
            width: 120px; /* Adjust the width as needed */
            vertical-align: top;
        }

        .profile-details p {
            display: inline-block;
            margin: 5px 0;
            width: calc(100% - 120px); /* Adjust the width to account for the label width */
            vertical-align: top;
        }
    </style>
</head>
<body>
<%
HttpSession h=request.getSession();
String email=(String) h.getAttribute("email");
String pass = (String) h.getAttribute("pswd");
if ("admin@gmail.com".equals(email)) {
%>
<%@ include file="adminnav.html" %>
<%
} else {
%>
<%@ include file="usernav.html" %>
<%
}
%>
<%
 
    Configuration cfg = new Configuration();
    cfg.configure("hiber.cfg.xml");
    SessionFactory sf = cfg.buildSessionFactory();
    Session sc = sf.openSession();
    Transaction tx = sc.beginTransaction();

    Query query = sc.createQuery("from com.in.model.User where email = :email");
    query.setParameter("email",email);
    User u = (User) query.uniqueResult();

%>
<div class="container">
    <h1>My Profile</h1>
    <div class="profile-details">
        <label for="firstName">First Name:</label>
        <p id="firstName"><%= u.getFirstName() %></p><br>

        <label for="lastName">Last Name:</label>
        <p id="lastName"><%= u.getLastname() %></p><br>

        <label for="gender">Gender:</label>
        <p id="gender"><%= u.getGender() %></p><br>

        <label for="dob">Date of Birth:</label>
        <p id="dob"><%= u.getDob() %></p><br>

        <label for="mobile">Mobile:</label>
        <p id="mobile"><%= u.getMob() %></p><br>

        <label for="email">Email:</label>
        <p id="email"><%= u.getEmail() %></p><br>
    </div>
</div>
</body>
</html>
