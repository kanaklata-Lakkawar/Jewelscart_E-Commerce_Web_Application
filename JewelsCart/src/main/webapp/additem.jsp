<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Item</title>
<%@include file="adminnav.html" %>
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
String message = (String) request.getAttribute("message5");
if (message != null) {
%>
   <br><div class='alert alert-success' role='alert'><%=message %></div>
<%}%>
<div class="container">
<h2 style="color:black">Add Item</h2>
<form action="additemserv" method="post" enctype="multipart/form-data">
  <div>
    <label for="itemName">Item Name:</label><br>
    <input type="text" id="itemname" name="itemName" class="input-field">
  </div><br>
  
  <div>
    <label for="description">Description:</label><br>
    <input type="text" id="description" name="description" class="input-field">
  </div><br>
  
  <div>
    <label for="price">Price:</label><br>
    <input type="text" id="price" name="price" class="input-field">
  </div><br>
  
  <div>
    <label for="quantity">Quantity:</label><br>
    <input type="text" id="quantity" name="quantity" class="input-field">
  </div><br>
  
  <div>
    <label for="category">Category:</label><br>
    <select id="category" name="category" class="input-field">
      <option value="ring">Ring</option>
      <option value="necklace">Necklace</option>
      <option value="earring">Earring</option>
      <option value="bangle">Bangle</option>
    </select>
  </div><br>
  
  <div>
    <label for="material">Material:</label><br>
    <select id="material" name="material" class="input-field">
      <option value="gold">Gold</option>
      <option value="silver">Silver</option>
      <option value="platinum">Platinum</option>
    </select>
  </div><br>
  
  <div>
    <label for="imageUpload">Upload Image:</label><br>
    <input type="file" id="imageUpload" name="image" class="input-field">
  </div><br>
  
  <div>
    <input type="submit" value="Submit">
  </div>
</form>

</div>

</body>
</html>
