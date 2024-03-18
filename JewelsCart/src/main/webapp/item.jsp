<%@page import="com.in.model.Product"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="usernav.html" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Product Details</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }
    .container {
        display: flex;
        align-items: center;
        justify-content: center;
        margin-top: 50px;
    }
    
    
    .product-price {
        font-size: 24px;
        margin-top: 20px;
    }
   .product-info {
   
    
    flex: 1;
    padding-left: 20px; /* Adjust the padding */
    margin-top: 100px;
    max-width: 400px;
    
}



.product-details {
    margin-top: 20px;
    background-color: #f9f9f9;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
    position: absolute; /* Position the product details absolute */
    bottom: 0; /* Align to the bottom of the container */
    left: 0; /* Align to the left of the container */
    width: 100%; /* Occupy full width */
}

.form-container {
    width:600px; /* Adjust the width of the form container */
    background-color: black;
    border-radius: 8px;
    box-shadow: 0px 0px 10px 0px rgba(255,255,255,0.3);
    padding: 20px;
    color: white;
    margin-right: 100px; /* Add margin to separate from product details */
     margin-top: 5px;
}
  






.product-details h3 {
    font-size: 24px;
       
}

.product-details h1 {
    font-size: 18px;
    color: #333;
}

.product-details p {
    font-size: 16px;
    color: #666;
    margin-bottom: 10px;
}

.product-details span {
    font-weight: bold;
    color: #fd9c6b; /* Set color for price and quantity */
}
    .book-button {
        margin-top: 20px;
        padding: 10px 20px;
        font-size: 18px;
        background-color: #fd9c6b;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    .book-button:hover {
        background-color: #fd9c6b;
    }
    
    .form-container form {
        margin-top: 20px;
        padding: 20px;
    }
    .form-container label {
        color: white; /* Set label color to white */
    }
    .form-container .input-field {
        width: 100%;
        padding: 10px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
        background-color: white; /* Set input field background color to white */
        color: black;
    }
    .form-container input[type="submit"] {
        background-color: #fd9c6b;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        width: 100%;
    }
    .form-container input[type="submit"]:hover {
        background-color: #fd9c6b;
    }
   

    
</style>
</head>
<body>
<%



String productId = request.getParameter("pId");
    
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
    <div class="product-info">
        <div class="product-image-container">
            <img class="product-image" src="./upload/<%=p.getImageName()%>" alt="Product Image">
            <div class="">
                <h3>Product Details</h3>
         
                <p><strong>Item Name:</strong> <%=p.getItemname() %></p>
                <p><strong>Description:</strong> <%=p.getDescription() %></p>
                <p><strong>Material:</strong> <%=p.getMaterial() %></p>
                <p><strong>Price:</strong> <span><%=p.getPrice() %></span></p>
                <p><strong>Available:</strong> <span><%=p.getQuantity() %></span></p>
            </div>
        </div>
    </div>
    <div class="form-container">
        <h2 style="color: white">Payment Details</h2>
        <form action="addpayment" method="post">
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" class="input-field" required>
            <label for="pincode">Pin Code:</label>
            <input type="text" id="pincode" name="pincode" class="input-field" required>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" class="input-field" required>
            <label for="cardNumber">Card Number:</label>
            <input type="text" id="cardNumber" name="cardNumber" class="input-field" required>
            <label for="cardHolderName">Cardholder Name:</label>
            <input type="text" id="cardHolderName" name="cardHolderName" class="input-field" required>
            <label for="cvv">CVV:</label>
            <input type="text" id="cvv" name="cvv" class="input-field" required>
            <label for="expiryDate">Expiry Date:</label>
            
            <input type="date" id="expiryDate" name="expiryDate" class="input-field" placeholder="MM/YY" required>
                  
            
            <input type="hidden" id="name" name="item" class="input-field" value="<%=p.getItemname()%>">
            <input type="hidden" id="name" name="price" class="input-field" value="<%=p.getPrice()%>">
            <input type="hidden" id="name" name="qty" class="input-field" value="<%=p.getQuantity()%>">
              
             <input type="hidden" id="imageName" name="image" value="<%=p.getImageName()%>">
                    
            <input type="submit" value="Pay">
        </form>
    </div>
</div>


</body>
</html>
