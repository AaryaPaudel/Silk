<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Page</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
</head>
<body>
    <div class="container">
        <div class="register-section">
            <h2>Welcome to the Silk Family!</h2>
            <% String error = (String) request.getAttribute("error"); %>
			<% if (error != null) { %>
			    <div class="error-message">
			        <p style="color:red;"><%= error %></p>
			    </div>
			<% } %>
            <form action="${pageContext.request.contextPath}/register" method="post" enctype = "multipart/form-data">
                <div class="form-group">
                    <label for="firstName">First Name</label>
                    <input type="text" id="firstName" name="firstName" value="${firstName}" required>
                </div>
                <div class="form-group">
                    <label for="lastName">Last Name</label>
                    <input type="text" id="lastName" name="lastName" value="${lastName}" required>
                </div>
                <div class="form-group">
                    <label for="birthDate">Birth Date</label>
                    <input type="date" id="birthDate" name="birthDate" value="${birthDate}" required>
                </div>
                <div class="form-group">
                    <label for="phoneNumber">Phone Number</label>
                    <input type="tel" id="phoneNumber" name="phonenumber" value="${phonenumber}" required>
                </div>
                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="text" id="address" name="address" value="${address}" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" value="${email}" required>
                </div>
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" value="${username}" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <div class="form-group">
                    <label for="photo">Add Your Photo</label>
                    <input type="file" id="photo" name="image" accept="image/*">
                </div>
                <button type="submit">Register</button>
            </form>
        </div>
        <div class="login-section">
            <h2>Already a Member?</h2>
            <p>Login to enjoy our artisanal ice cream!</p>
            <a href="${pageContext.request.contextPath}/login">
               <button>Login Now</button>
             </a>
        </div>
    </div>
</body>
</html>
