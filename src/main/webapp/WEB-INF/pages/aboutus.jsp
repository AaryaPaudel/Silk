<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    <main class="aboutus-container">
        <h1>About Silk Artisanal Creamery</h1>

        <section id="our-story" class="about-section">
            <h2>Our Story</h2>
            <p>[Placeholder: Write about the founding of Silk Artisanal Creamery. How did it start? What was the inspiration? Share the journey from idea to reality. Make it personal and engaging.]</p>
            <img src="${pageContext.request.contextPath}/resources/photos/placeholder-story.png" alt="Our Story Image Placeholder" class="about-image">
        </section>

        <section id="our-philosophy" class="about-section alt-background">
             <h2>Our Philosophy: Craftsmanship and Quality</h2>
             <p>[Placeholder: Describe the core values and mission. Focus on 'artisanal', 'finest ingredients', 'crafted with love'. Why no delivery? Emphasize the commitment to the perfect scoop experience.]</p>
        </section>

        <section id="our-ingredients" class="about-section">
            <h2>Finest Ingredients</h2>
            <p>[Placeholder: Talk about the sourcing of ingredients. Mention local sourcing if applicable (e.g., local dairy, seasonal fruits). Highlight the quality standards for ingredients like vanilla beans, cocoa, etc.]</p>
             <img src="${pageContext.request.contextPath}/resources/photos/placeholder-ingredients.png" alt="Ingredients Image Placeholder" class="about-image">
        </section>

        <section id="meet-the-team" class="about-section alt-background">
            <h2>Meet the Cream Team (Optional)</h2>
            <p>[Placeholder: Optionally, introduce the key people behind Silk. This could be the founder, the head ice cream maker, etc. Add a personal touch.]</p>
            <%-- Add team member divs if needed --%>
        </section>

    </main>

    <footer>
        <div class="copyright">
            <p>&copy; 2025 Silk Artisanal Creamery. All rights reserved.</p>
        </div>
    </footer>

</body>
</html>
