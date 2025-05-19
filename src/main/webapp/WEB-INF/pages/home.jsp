<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Silk Artisanal Creamery</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css?v=1">
</head>
<body>
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
    
    <section class="hero">
        <div class="hero-image">
            <img src="resources/images/homepage.png" alt="Ice Cream"/>
        </div>
        <div class="hero-text">
            <h1>Indulge in the Creamiest Delight</h1>
            <p>Experience the rich, artisanal flavors of Silk Ice Cream, crafted with love and the finest ingredients.</p>
            <button onclick="location.href='${pageContext.request.contextPath}/menu'">Explore Menu</button>
        </div>
        
    </section>

    <section class="top-flavors">
        <h2>Our Top 3 Flavors</h2>
        <div class="flavors">
            <div class="flavor">
                <img src="resources/images/MangoSorbet.png" alt="Flavor 1"> <%-- Updated src with c:url --%>
                <h3>Mango Sorbet</h3>
                <p>Dairy-free mango delight made with Alphonso mangoes</p>
            </div>
            <div class="flavor">
                <img src="resources/images/SaltedCaramelSwirl.png" alt="Flavor 2"> <%-- Updated src with c:url --%>
                <h3>Salted Caramel Swirl</h3>
                <p>Sweet and salty caramel with a rich creamy base</p>
            </div>
            <div class="flavor">
                <img src="resources/images/BlueberryCheesecake.png" alt="Flavor 3"> <%-- Updated src with c:url --%>
                <h3>Blueberry Cheesecake</h3>
                <p>Cream cheese base with blueberry swirls and biscuit bits</p>
            </div>
        </div>
    </section>

    <section class="why-no-delivery">
    <div class="panel-content">
        <h2 class="panel-headline">Why No Delivery?</h2>
        <p class="panel-body">We believe the true magic of our artisanal creamery unfolds the moment you take that first spoonful – perfectly frozen, 
        bursting with flavor, and with a texture that whispers of handcrafted care. To ensure this exquisite experience, we've made the conscious decision 
        not to offer delivery.Think of it as our promise to you: every visit to Silk is a journey to ice cream perfection. You'll find our scoops are richer, 
		our textures more sublime, enjoyed in the charming ambiance of our shop, just as our artisans intended. Come savor the difference that unwavering 
		freshness makes. We can't wait to welcome you!</p>
    </div>
</section>

<section class="options">
    <div class="panel-content">
        <h2 class="panel-headline">We Have Sorbet and Vegan Options Too!</h2>
        <p class="panel-body">At Silk artisanal creamery, we're passionate about crafting joy for every palate. That's why we've lovingly developed a 
        vibrant range of refreshing sorbets, bursting with the natural sweetness of ripe fruits. And for our vegan friends, indulge in our creamy, decadent
         plant-based options, made with the same commitment to quality and exquisite flavor that defines our classic ice cream.Whether you're seeking a 
         light and fruity indulgence or a rich and satisfying vegan treat, our sorbet and vegan selections offer a delightful taste of Silk's artistry. 
         Come explore the full spectrum of our frozen creations!</p>
    </div>
</section>

    <footer>
        <div class="social-media">
            <a href="#"><img src="resources/images/facebook.png" alt="Facebook"></a> <%-- Updated src with c:url --%>
            <a href="#"><img src="resources/images/instagram.png" alt="Instagram"></a> <%-- Updated src with c:url --%>
            <a href="#"><img src="resources/images/twitter.jpg" alt="Twitter"></a> <%-- Updated src with c:url --%>
        </div>
        <div class="copyright">
            <p>&copy; 2025 Silk Artisanal Creamery. All rights reserved.</p>
            <img src="resources/images/SilkLogo.png" alt="Silk Logo" height= 40px width= 50px> <%-- Updated src with c:url --%>
        </div>
    </footer>
</body>
</html>
