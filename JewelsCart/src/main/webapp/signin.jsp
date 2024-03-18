<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Form</title>
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
String message = (String) request.getAttribute("message");

if (message != null) {
%>
   <br>
   <div style="text-align: center;">
  <br>
  <div class='alert alert-success' role='alert'>
    <%=message %>
  </div>
</div>
<%}

String name= request.getParameter("name");
%>
<div class="container">
<h2 style="color: black">Login Form</h2>
    <form action="signinserv" method="get">
      
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" class="input-field" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" class="input-field" required>
        


        
        <input type="submit" value="Signin">
    </form>
</div>

</body>
</html>
