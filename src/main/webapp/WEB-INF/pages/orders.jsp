<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Orders</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminprofile.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/orders.css">
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
    <div class="container">
        <h1>Orders</h1>
      
        <section class="order-list">
            <table>
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Customer Name</th>
                        <th>Order Date & Time</th>
                        <th>Items Ordered</th>
                        <th>Total Amount</th>
                        <th>Dispatched Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${orders}" var="order">
                        <tr>
                            <td>${order.orderId}</td>
                            <td>${order.customerName}</td>
                            <td>${order.orderDateTime}</td>
                            <td>${order.itemsOrdered}</td>
                            <td>${order.totalAmount}</td>
                            <td>${order.dispatchedStatus}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </section>
    </div>
</body>
</html>
