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
        <a href = "${pageContext.request.contextPath}/logout">
            <button>Logout</button>
            </a>
        </div>
        <c:if test="${not empty sessionScope.user}">
	    	<div class="profile-icon" style="display: flex; align-items: center;">
	        <a href="${pageContext.request.contextPath}/userprofile" style="display: inline-block;">
	            <img src="${pageContext.request.contextPath}/resources/images/icon.jpg" 
	                 alt="User Profile"
	                 style="width: 50px; height: 50px; border-radius: 50%; object-fit: cover; border: 2px solid #ccc;">
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
        <c:if test="${not empty requestScope.error}">
            <p class="error">${requestScope.error}</p>
        </c:if>
         <c:if test="${not empty requestScope.updateError}">
            <p class="error">${requestScope.updateError}</p>
        </c:if>

        <c:if test="${empty param.edit}">
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
        <a href="${pageContext.request.contextPath}/userprofile?edit=true">
            <button type="button">Edit Profile</button>
        </a>
    </div>
</c:if>

<c:if test="${param.edit eq 'true'}">
    <div id="edit-profile">
        <form action="${pageContext.request.contextPath}/userprofile" method="post" enctype="multipart/form-data">
            <c:if test="${not empty requestScope.error}">
                <p class="error">${requestScope.error}</p>
            </c:if>
            <c:if test="${not empty requestScope.updateError}">
                <p class="error">${requestScope.updateError}</p>
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
            <button type="submit">Save Profile</button>
            <a href="${pageContext.request.contextPath}/userprofile">
                <button type="button">Cancel</button>
            </a>
        </form>
    </div>
</c:if>
</div>
</div>
</main>
</body>
</html>