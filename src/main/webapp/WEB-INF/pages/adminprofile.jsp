<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Profile</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminprofile.css">
</head>
<body>
    <nav>
        <div class="logo">
            <img src="${pageContext.request.contextPath}/resources/images/SilkLogo.png" alt="Silk Logo"/> 
        </div>
        <div class="pages">
            <a href="${pageContext.request.contextPath}/dashboard">Dashboard</a>
            <a href="${pageContext.request.contextPath}/managemenu">Manage Menu</a>
            <a href="${pageContext.request.contextPath}/orders">Orders</a>
            <a href="${pageContext.request.contextPath}/adminprofile">Admin Profile</a>
        </div>
        <div class="login">
        <a href = "${pageContext.request.contextPath}/logout">
            <button>Logout</button>
            </a>
        </div>
    </nav>
    <main>
        <div class="container">
            <section class="profile-section">
                <h2>Admin Profile</h2>
                <div class="profile-image">
                    <img src="${pageContext.request.contextPath}/resources/images/admin.JPG" alt="Admin Profile Picture" style="width: 150px; height: 150px; border-radius: 50%;">                
                </div>
                <div class="profile-details">
                    <p><strong>First Name:</strong> ${admin.firstName}</p>
                    <p><strong>Last Name:</strong> ${admin.lastName}</p>
                    <p><strong>Username:</strong> ${admin.username}</p>
                    <p><strong>Email:</strong> ${admin.email}</p>
                    <p><strong>Phone Number:</strong> ${admin.phonenumber}</p>
                    <p><strong>Address:</strong> ${admin.address}</p>
                    <p><strong>Birth Date:</strong> ${admin.birthDate}</p>
                </div>
            </section>

            <section class="edit-profile-section">
                <h2>Edit Profile</h2>
                <form action="adminprofile" method="post">
                    <label for="firstName">First Name:</label>
                    <input type="text" id="firstName" name="firstName" value="${admin.firstName}" required><br>

                    <label for="lastName">Last Name:</label>
                    <input type="text" id="lastName" name="lastName" value="${admin.lastName}" required><br>

                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="${admin.email}" required><br>

                    <label for="phonenumber">Phone Number:</label>
                    <input type="text" id="phonenumber" name="phonenumber" value="${admin.phonenumber}" required><br>

                    <label for="address">Address:</label>
                    <input type="text" id="address" name="address" value="${admin.address}" required><br>

                    <label for="birthDate">Birth Date:</label>
                    <input type="date" id="birthDate" name="birthDate" value="${admin.birthDate}" required><br>

                    <input type="submit" value="Update Profile">
                </form>
            </section>
        </div>
    </main>
</body>
</html>
