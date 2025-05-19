<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Us - Silk Artisanal Creamery</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css"> <%-- Reusing home.css for nav --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/aboutus.css"> <%-- Link to aboutus specific CSS --%>
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

    <main class="aboutus-container">
        <h1>About Silk Artisanal Creamery</h1>

        <section id="our-story" class="about-section">
            <h2>Our Story: A Taste of Italy, Rooted in Nepal</h2>
            <p>The inspiration for Silk Artisanal Creamery began not under the towering peaks of Nepal, but amidst the sun-drenched piazzas and vibrant 
            gelaterias of Italy. It was there, during a transformative journey through cities like Florence and Rome, that our founder 
            discovered the true artistry of gelato and the profound joy it brought to people. The dedication to fresh, seasonal ingredients and the 
            meticulous craft behind each creamy scoop sparked a dream: to bring that same authentic experience back home to Nepal. Returning to 
            the Kathmandu Valley, the vision of Silk began to take shape. It wasn't simply about replicating Italian gelato; it was about blending that 
            cherished tradition with the rich flavors and spirit of Nepal. The journey from those initial experiments, adapting Italian techniques with 
            locally sourced ingredients like fresh cardamom,or Himalayan honey to finding the perfect location for the creamery was filled with both 
            challenges and excitement. Transforming an unused corner of a courtyard into a welcoming haven for artisanal ice cream was a testament to
             the belief in this sweet endeavor. Silk Artisanal Creamery is more than just a dessert destination; it's the story of a journey, a passion 
             for authentic flavors, and a heartfelt desire to share a taste of Italy, made with love in Nepal.</p>
        </section>

        <section id="our-philosophy" class="about-section alt-background">
             <h2>Our Philosophy: Craftsmanship and Quality</h2>
             <p>At Silk Artisanal Creamery, our philosophy is simple: uncompromising quality, crafted with love. We believe
              that the best ice cream isn't just made; it's nurtured. Our "artisanal" approach means we take pride in every
              step of the process, from carefully selecting our ingredients to hand-crafting each batch in small kettles
              with meticulous attention.Our mission is to create moments of pure joy through exceptional frozen desserts.
              This means using only the finest ingredients the world has to offer – rich, ethically sourced cocoa from
              the Arima Valley, fragrant Madagascar vanilla beans cured under the tropical sun, and the freshest local
              cream from the Clover Creek Dairy. We pour our hearts into every creation, ensuring that each flavor is
              perfectly balanced and every texture is luxuriously smooth. It's more than just a treat; it's an 
              experience crafted with passion. And that brings us to why you won't find Silk delivered to your 
              doorstep. We are deeply committed to the perfect scoop experience. Ice cream is a delicate art, and its
              ideal state is moments after it leaves our freezer. Delivery times and temperature fluctuations can
              compromise the very qualities we work so hard to achieve – the perfect firmness, the vibrant flavor,
              the exquisite melt. By inviting you to our creamery in Oakhaven, we ensure that every scoop you 
              enjoy is exactly as our artisans intended: a moment of pure, unadulterated bliss.</p>
        </section>

        <section id="our-ingredients" class="about-section">
            <h2>Finest Ingredients</h2>
            <p>The heart of Silk's exceptional flavor lies in the finest ingredients we meticulously source. We believe 
            that what you put in directly determines what you get out, and we leave no stone unturned in our quest for 
            quality. We are deeply committed to supporting our local community. Our creamy, rich dairy comes from the 
            family-run Clover Creek Dairy, just a few miles down the road, where the cows graze on lush pastures, 
            producing milk of exceptional quality. When the seasons allow, we partner with Farmer McGregor's Orchard to 
            bring you the freshest, ripest seasonal fruits for our vibrant sorbets and unique ice cream infusions. Imagine
            the taste of sun-ripened strawberries from the valley bursting in our Strawberry Basil sorbet! For ingredients
            that travel a little further, we maintain the same unwavering standards. Our vanilla beans are carefully 
            selected for their intense aroma and rich flavor, often hailing from the Sava region of Madagascar. The 
            cocoa that lends its deep, chocolatey notes to our Midnight Velvet ice cream is ethically sourced and chosen
            for its superior quality and complex flavor profiles from the lush rainforests of Ecuador. Even seemingly
            simple ingredients like sugar from the Sunny Fields Cane Company and locally sourced walnuts are chosen
            with the same level of scrutiny, ensuring they meet our exacting standards. At Silk, every ingredient
            has a story, and that story is one of quality and care.</p>
        </section>

        <section id="The Silk Difference" class="about-section alt-background">
            <h2>Experience the Care in Every Creation</h2>
            <p>What sets Silk Artisanal Creamery apart? It's the unwavering care that goes into every single batch.
            We believe that true quality shines through when passion and attention to detail are paramount. Our team is 
            driven by a shared love for exceptional ice cream and a desire to create flavors that truly resonate. From 
            the sourcing of the finest ingredients to the meticulous crafting process, experience the difference that 
            genuine care makes.</p>
            <%-- Add team member divs if needed --%>
        </section>

    </main>

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
