<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
</head>
<body>
    <nav>
        <div class="logo">
            <img src="${pageContext.request.contextPath}/resources/images/SilkLogo.png" alt="Silk Logo"/> 
        </div>
        <div class="pages">
            <a href="${pageContext.request.contextPath}/dashboard">Dashboard</a>
            <a href="${pageContext.request.contextPath}/managemenu">Manage Menu</a>
            <a href="${pageContext.request.contextPath}/adminprofile">Admin Profile</a>
        </div>
        <div class="login">
        <a href = "${pageContext.request.contextPath}/logout">
            <button>Logout</button>
            </a>
        </div>
    </nav>
<main>
        <h1>Admin Dashboard</h1>
        <div class="kpi-container">
            <div class="kpi">
                <h3>Total Sales</h3>
                <p>$ ${totalSales}</p>
            </div>
            <div class="kpi">
                <h3>Total Orders</h3>
                <p>${totalOrders}</p>
            </div>
            <div class="kpi">
                <h3>Completed Orders</h3>
                <p>${completedOrders}</p>
            </div>
        </div>
        <div class="kpi-container">
            <div class="kpi">
                <h3>Most Popular Flavor</h3>
                <p>${popularItem}</p>
            </div>
            <div class="kpi">
                <h3>Total Flavors in Stock</h3>
                <p>${totalFlavors}</p>
            </div>
        </div>
         <h2>Quick Action Links/Shortcuts</h2>
         <div class = "quick-actions">
            <a href="${pageContext.request.contextPath}/managemenu" class="action-link">Add New Menu Item</a>
            <a href="${pageContext.request.contextPath}/managemenu" class = "action-link">Manage Inventory</a>
         </div>
    </main>
</body>
</html>
