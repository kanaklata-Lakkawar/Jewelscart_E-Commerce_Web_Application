<!DOCTYPE html>
<%@page import="com.in.model.Product"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Product Details</title>
<style>
    body {
        background-color: black;
        color: white;
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }
    .container {
        background-color: white;
        max-width: 400px;
        margin: 50px auto;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0px 0px 10px 0px rgba(255,255,255,0.3);
    }
    form {
        margin-top: 20px;
    }
    h1 {
        text-align: center;
    }
    label {
        color: black;
    }
    .input-field {
        width: 100%;
        padding: 10px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
        background-color: white;
        color: black;
    }
    input[type="submit"] {
        background-color: #fd9c6b;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        width: 100%;
    }
    input[type="submit"]:hover {
        background-color: #fd9c6b;
    }
</style>
</head>
<body>

<%
String productId = request.getParameter("pid");

Configuration cfg = new Configuration();
        cfg.configure("hiber.cfg.xml");
        SessionFactory sf = cfg.buildSessionFactory();
        Session sc = sf.openSession();
        Transaction tx = sc.beginTransaction();

       
        Query query = sc.createQuery("from com.in.model.Product where pid = :productId");
        query.setParameter("productId", Integer.parseInt(productId));
        Product p = (Product) query.uniqueResult();
%>

<div class="container">
<h2 style="color: black">Edit Product Details</h2>
    <form action="editserv" method="get">
       <label for="fname">Product Category:</label>
        <input type="text" id="fname" name="category" class="input-field" value="<%=p.getCategory() %>">

        <label for="lname">Description:</label>
        <input type="text" id="lname" name="description" class="input-field"  value="<%=p.getDescription() %>">

       
        <label for="email">Name:</label>
        <input type="text" id="email" name="item" class="input-field"  value="<%=p.getItemname() %>">

        <label for="password">Material:</label>
        <input type=text id="password" name="material" class="input-field"  value="<%=p.getMaterial() %>">

<label for="password">Price:</label>
        <input type="text" id="password" name="price" class="input-field"  value="<%=p.getPrice() %>">

        <label for="Quantity">Quantity:</label>
        <input type="tel" id="mobile" name="qty" class="input-field"  value="<%=p.getQuantity()%>">
 
        <input type="text" id="fname" name="id" class="input-field" value="<%=productId %>">
        
        <input type="submit" value="Save">
    </form>
</div>

</body>
</html>
