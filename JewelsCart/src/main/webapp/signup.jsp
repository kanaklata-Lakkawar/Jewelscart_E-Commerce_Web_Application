<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registration Form</title>
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
String message1 = (String) request.getAttribute("message2");
%>

<br>
<% if (message1!=null) {
%>
<div style="text-align: center;">
	<div class='alert alert-success' role='alert'>
  <%=message1 %>
</div>
</div>
<% 
}
%>


<div class="container">
<h2 style="color: black">Registration Form</h2>
    <form action="regserv" method="get" onsubmit="return validateForm()">
       <label for="fname">First Name:</label>
        <input type="text" id="fname" name="fname" class="input-field" required>

        <label for="lname">Last Name:</label>
        <input type="text" id="lname" name="lname" class="input-field" required>

       
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" class="input-field" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" class="input-field" required>

<label for="password">Confirm Password:</label>
        <input type="password" id="confirmPassword" name="pass" class="input-field" required>

        <label for="mobile">Mobile:</label>
        <input type="tel" id="mobile" name="mob" class="input-field" pattern="[0-9]{10}" required>

        <label for="gender">Gender:</label>
        <select id="gender" name="gender" class="input-field" required>
            <option value="">Select</option>
            <option value="male">Male</option>
            <option value="female">Female</option>
            <option value="other">Other</option>
        </select>

        <label for="dob">Date of Birth:</label>
        <input type="date" id="dob" name="dob" class="input-field" required>
        <input type="submit" value="Signup">
    </form>
</div>

<script>
    function validateForm() {
        var password = document.getElementById("password").value;
        var confirmPassword = document.getElementById("confirmPassword").value;
        if (password !== confirmPassword) {
            alert("Passwords do not match!");
            return false;
        }
        return true;
    }
</script>

</body>
</html>
