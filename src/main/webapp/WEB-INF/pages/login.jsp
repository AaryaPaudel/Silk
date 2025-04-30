<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>
    <div class="container">
        <div class="login-section">
            <h2>Welcome Back!</h2>
            <form action="${pageContext.request.contextPath}/login" method="post">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required>
                    <a href="#" class="forgot-password">Forgot Password?</a>
                </div>
                <button type="submit">Login</button>
            </form>
        </div>
        <div class="register-section">
            <h2>New to the Silk Family?</h2>
            <p>Register now to enjoy our artisanal ice cream!</p>
            <a href="${pageContext.request.contextPath}/register">
               <button>Register Now</button>
            </a>
        </div>
    </div>
</body>
</html>
