<%@page import="java.util.List"%>
<%@page import="com.in.model.Payment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="bootstrap.css" />
  <!-- font awesome style -->
  <link href="css/font-awesome.min.css" rel="stylesheet" />
  <!-- Custom styles for this template -->
  <link href="style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="css/responsive.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="bootstrap.css" />
    <!-- Include Custom CSS -->
    <style>
        /* Define custom styles for better alignment */
        .shop_section {
            padding: 50px 0;
        }
        .box {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 15px;
            margin-bottom: 30px;
        }
        .box .img-box {
            text-align: center;
            margin-bottom: 15px;
        }
        .box .img-box img {
            max-width: 100%;
            height: auto;
        }
        .box .detail-box h5,
        .box .detail-box h6 {
            margin: 0;
        }
        .box .detail-box h6 {
            color: #888;
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
Configuration cfg = new Configuration();
cfg.configure("hiber.cfg.xml");
SessionFactory sf = cfg.buildSessionFactory();
Session sc = sf.openSession();
Transaction tx = sc.beginTransaction();
Query query = sc.createQuery("from com.in.model.Payment where email = :email");
query.setParameter("email", email);

List<Payment> payments = query.list();

%>

<!-- blog section -->

  
  
  <section class="shop_section">
        <div class="container">
            <div class="heading_container heading_center">
                <h2>Your Orders</h2>
            </div>
            <div class="row">
                <% for(Payment p : payments) { %>
                <div class="col-sm-6 col-md-4 col-lg-3">
                    <div class="box">
                        <div class="img-box">
                            <img src="./upload/<%=p.getImageName()%>" alt="Product Image">
                        </div>
                        <div class="detail-box">
                            <h5><%=p.getItem() %></h5> <br>
                            
                            
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
    </section>

  <!-- end blog section -->
</body>
</html>