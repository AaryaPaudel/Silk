<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Silk Artisanal Creamery</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
</head>
<body>
    <nav>
        <div class="logo">
            <img src="${pageContext.request.contextPath}/photos/SilkLogo.png" alt="Silk Logo"/> 
        </div>
        <div class="pages">
            <a href="${pageContext.request.contextPath}/home">Home</a>
            <a href="${pageContext.request.contextPath}/menu">Menu</a>
            <a href="${pageContext.request.contextPath}/find">Find Us</a>
            <a href="${pageContext.request.contextPath}/about">About Us</a>
        </div>
        <div class="login">
        <a href = "${pageContext.request.contextPath}/login">
            <button>Login</button>
            </a>
        </div>
    </nav>

    <section class="hero">
        <div class="hero-image">
            <img src="<c:url value='/images/icecream.png'/>" alt="Ice Cream"> <%-- Updated src with c:url --%>
        </div>
        <div class="hero-text">
            <h1>Indulge in the Creamiest Delight</h1>
            <p>Experience the rich, artisanal flavors of Silk Ice Cream, crafted with love and the finest ingredients.</p>
            <button onclick="location.href='${pageContext.request.contextPath}/menu.jsp'">Explore Menu</button>
        </div>
    </section>

    <section class="top-flavors">
        <h2>Our Top 3 Flavors</h2>
        <div class="flavors">
            <div class="flavor">
                <img src="<c:url value='/images/flavor1.png'/>" alt="Flavor 1"> <%-- Updated src with c:url --%>
                <h3>Flavor 1</h3>
                <p>Description of Flavor 1</p>
            </div>
            <div class="flavor">
                <img src="<c:url value='/images/flavor2.png'/>" alt="Flavor 2"> <%-- Updated src with c:url --%>
                <h3>Flavor 2</h3>
                <p>Description of Flavor 2</p>
            </div>
            <div class="flavor">
                <img src="<c:url value='/images/flavor3.png'/>" alt="Flavor 3"> <%-- Updated src with c:url --%>
                <h3>Flavor 3</h3>
                <p>Description of Flavor 3</p>
            </div>
        </div>
    </section>

    <section class="why-no-delivery">
        <h2>Why No Delivery?</h2>
        <p>We want you to experience our ice cream at its absolute best – freshly out of the freezer. That's why we don't offer delivery, ensuring every scoop is perfect.</p>
    </section>

    <section class="options">
        <h2>We Have Sorbet and Vegan Options Too!</h2>
        <p>Everyone deserves a taste of Silk. Enjoy our delightful sorbet and vegan options, crafted with the same care and quality as our classic ice cream.</p>
    </section>

    <footer>
        <div class="social-media">
            <a href="#"><img src="<c:url value='/images/facebook.png'/>" alt="Facebook"></a> <%-- Updated src with c:url --%>
            <a href="#"><img src="<c:url value='/images/instagram.png'/>" alt="Instagram"></a> <%-- Updated src with c:url --%>
            <a href="#"><img src="<c:url value='/images/twitter.png'/>" alt="Twitter"></a> <%-- Updated src with c:url --%>
        </div>
        <div class="copyright">
            <p>&copy; 2025 Silk Artisanal Creamery. All rights reserved.</p>
            <img src="<c:url value='/images/logo.png'/>" alt="Silk Logo"> <%-- Updated src with c:url --%>
        </div>
    </footer>
</body>
</html>
