<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <h1>Admin Dashboard</h1>
        <div class="kpi-container">
            <div class="kpi">
                <h3>Today's Sales</h3>
                <p>$ 450.45</p>
            </div>
            <div class="kpi">
                <h3>New Orders Today</h3>
                <p>23</p>
            </div>
            <div class="kpi">
                <h3>Total Number of Open/Pending Orders</h3>
                <p>15</p>
            </div>
        </div>
        <div class="kpi-container">
            <div class="kpi">
                <h3>Most Popular Flavor (Today)</h3>
                <p>Raspberry Sorbet</p>
            </div>
            <div class="kpi">
                <h3>Low Stock Count</h3>
                <p>5</p>
            </div>
        </div>
         <h2>Quick Action Links/Shortcuts</h2>
         <div class = "quick-actions">
            <a href="${pageContext.request.contextPath}/managemenu" class="action-link">Add New Menu Item</a>
            <a href="${pageContext.request.contextPath}/orders" class = "action-link">View Recent Orders</a>
            <a href="${pageContext.request.contextPath}/managemenu" class = "action-link">Manage Inventory</a>
         </div>
    </main>
</body>
</html>
