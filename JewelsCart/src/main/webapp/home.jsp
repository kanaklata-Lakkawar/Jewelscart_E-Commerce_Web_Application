<%@page import="com.in.model.Product"%>
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
<!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <link rel="icon" href="images/favicon.png" type="image/gif" />
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>Home (user)</title>

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="bootstrap.css" />
  <!-- font awesome style -->
  <link href="css/font-awesome.min.css" rel="stylesheet" />
  <!-- Custom styles for this template -->
  <link href="style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="css/responsive.css" rel="stylesheet" />


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
String message = (String) request.getAttribute("message1");
if (message != null) {
%>
   <br><div class='alert alert-success' role='alert'><%=message %></div>
<%}%>
<% 

String message1 =(String) request.getAttribute("message4");
if (message1 != null) {
%>
   <br><div class='alert alert-success' role='alert'><%=message1 %></div>
<%}
 
Configuration cfg = new Configuration();
cfg.configure("hiber.cfg.xml");
SessionFactory sf = cfg.buildSessionFactory();
Session sc = sf.openSession();
Transaction tx = sc.beginTransaction();
Query q = sc.createQuery("from com.in.model.Product");
ArrayList<Product> li = (ArrayList<Product>)q.list();
%>

      
 <!-- shop section -->

  <section class="shop_section layout_padding">
    <div class="container">
      <div class="heading_container heading_center">
        <h2>
          Latest Products
        </h2>
      </div>
      <div class="row">
      <% 
         for(Product p : li) { 
          
            %>
        <div class="col-sm-6 col-md-4 col-lg-3">
          <div class="box">
            <a href="item.jsp?pId=<%=p.getPid()%>">
         
           
              <div class="img-box">
                <img src="./upload/<%=p.getImageName()%>">
              </div>
              <div class="detail-box">
                <h6>
                 <%=p.getCategory() %>
                </h6>
                <h6>
                  Price
                  <span>
                    <%=p.getPrice()%> Rs.
                  </span>
                </h6>
                
              </div>
              <div class="new">
                <span>
                  New
                </span>
              </div>
            </a>
          </div>
        </div>
        
             <% } %>
        
    </div>
  </section>

  <!-- end shop section -->
</body>
</html>