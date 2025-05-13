<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/userprofile.css">
</head>
<body>
     <%-- Navigation Bar (copied from menu.jsp for consistency) --%>
    <nav>
        <div class="logo">
            <img src="${pageContext.request.contextPath}/resources/images/SilkLogo.png" alt="Silk Logo"/>
        </div>
        <div class="pages">
            <a href="${pageContext.request.contextPath}/home">Home</a>
            <a href="${pageContext.request.contextPath}/menu">Menu</a>
            <a href="${pageContext.request.contextPath}/find">Find Us</a>
            <a href="${pageContext.request.contextPath}/about">About Us</a>
        </div>
        <div class="login">
            <button onclick="location.href='login.jsp'">Login</button>
        </div>
        <c:if test="${not empty sessionScope.user}">
            <div class="profile-icon">
                <a href="${pageContext.request.contextPath}/userprofile">
                    <img src="${pageContext.request.contextPath}/resources/images/${sessionScope.user.imageUrl}" alt="User Profile" style="width:50px;height:50px;">
                </a>
            </div>
        </c:if>
    </nav>

    <main class="findus-container">
        <h1>User Profile</h1>
        <div class="container">
        <h2>Welcome, ${user.firstName} ${user.lastName}!</h2>
        <div class="profile-section">
            <div class="form-group" style="text-align: center;">
                <img src="${pageContext.request.contextPath}/resources/images/${user.imageUrl}" alt="User Profile" style="width:100px;height:100px; border-radius: 50%;">
            </div>
        <c:if test="${not empty message}">
            <p class="success">${message}</p>
        </c:if>
        <c:if test="${not empty error}">
            <p class="error">${error}</p>
        </c:if>

        <div id="profile-data">
            <div class="form-group">
                <label for="firstName">First Name:</label>
                <p>${user.firstName}</p>
            </div>
            <div class="form-group">
                <label for="lastName">Last Name:</label>
                <p>${user.lastName}</p>
            </div>
            <div class="form-group">
                <label for="birthDate">Birth Date:</label>
                <p>${user.birthDate}</p>
            </div>
            <div class="form-group">
                <label for="phoneNumber">Phone Number:</label>
                <p>${user.phonenumber}</p>
            </div>
            <div class="form-group">
                <label for="address">Address:</label>
                <p>${user.address}</p>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <p>${user.email}</p>
            </div>
             <div class="form-group">
                <label for="username">Username:</label>
                <p>${user.username}</p>
            </div>
            <button id="edit-button">Edit Profile</button>
        </div>

        <div id="edit-profile" style="display:none;">
            <form action="${pageContext.request.contextPath}/userprofile" method="post" enctype="multipart/form-data">
            	<c:if test="${not empty error}">
            		<p class="error">${error}</p>
            	</c:if>
                <div class="form-group">
                    <label for="firstName">First Name</label>
                    <input type="text" id="firstName" name="firstName" value="${not empty requestScope.firstName ? requestScope.firstName : user.firstName}" required>
                </div>
                <div class="form-group">
                    <label for="lastName">Last Name</label>
                    <input type="text" id="lastName" name="lastName" value="${not empty requestScope.lastName ? requestScope.lastName : user.lastName}" required>
                </div>
                 <div class="form-group">
                    <label for="birthDate">Birth Date</label>
                    <input type="date" id="birthDate" name="birthDate" value="${not empty requestScope.birthDateStr ? requestScope.birthDateStr : user.birthDate}" required>
                </div>
                <div class="form-group">
                    <label for="phoneNumber">Phone Number</label>
                    <input type="tel" id="phoneNumber" name="phonenumber" value="${not empty requestScope.phonenumber ? requestScope.phonenumber : user.phonenumber}" required>
                </div>
                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="text" id="address" name="address" value="${not empty requestScope.address ? requestScope.address : user.address}" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" value="${not empty requestScope.email ? requestScope.email : user.email}" required>
                </div>
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" value="${not empty requestScope.username ? requestScope.username : user.username}" required>
                </div>
                <div class="form-group">
                    <label for="photo">Update Your Photo</label>
                    <input type="file" id="photo" name="image" accept="image/*">
                </div>
                <button type="submit">Save Profile</button>
                <button type="button" id="cancel-button">Cancel</button>
            </form>
        </div>
    </div>
    </main>
    <script>
        document.getElementById('edit-button').addEventListener('click', function() {
            document.getElementById('profile-data').style.display = 'none';
            document.getElementById('edit-profile').style.display = 'block';
        });

        document.getElementById('cancel-button').addEventListener('click', function() {
            document.getElementById('edit-profile').style.display = 'none';
            document.getElementById('profile-data').style.display = 'block';
        });
    </script>
</body>
</html>
