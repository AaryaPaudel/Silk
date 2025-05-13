<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find Us - Silk Artisanal Creamery</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css"> <%-- Reusing home.css for nav --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/findus.css"> <%-- Link to findus specific CSS --%>
<%-- Add Leaflet CSS if using Leaflet maps --%>
<%-- <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY=" crossorigin=""/> --%>
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
            <button onclick="location.href='login.jsp'">Logout</button>
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
        <h1>Visit Our Creameries</h1>
        <p class="hours-info">All locations open daily from <strong>9:00 AM - 10:00 PM</strong></p>

        <div class="map-locations-wrapper">
            <%-- Map Placeholder --%>
            <div id="map">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3532.245135751973!2d85.31569587429787!3d27.71724527606471!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb19a6e37b39ad%3A0xbb7458c463b5dd4f!2sKathmandu%20Guest%20House!5e0!3m2!1sen!2snp!4v1713684294214!5m2!1sen!2snp"
                        width="95%" height="900" style="border:0;" allowfullscreen="" loading="lazy"
                        referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>

            <%-- Location List --%>
            <div class="location-list">
                <h2>Our Locations</h2>
                <ul>
                    <li data-lat="27.715" data-lng="85.318"> <%-- Approx coords --%>
                        <h3>Bagaicha, Naxal</h3>
                        <p>Near Bagaicha Restaurant, Naxal, Kathmandu</p>
                        <a href="#" class="map-link">View on Map</a>
                    </li>
                    <li data-lat="27.709" data-lng="85.314"> <%-- Approx coords --%>
                        <h3>International Club, Sanepa</h3>
                        <p>Inside International Club, Sanepa, Lalitpur</p>
                         <a href="#" class="map-link">View on Map</a>
                    </li>
                    <li data-lat="27.691" data-lng="85.314"> <%-- Approx coords --%>
                        <h3>Jhamsikhel</h3>
                        <p>Jhamsikhel Road, Lalitpur (Near Vesper Cafe)</p>
                         <a href="#" class="map-link">View on Map</a>
                    </li>
                     <li data-lat="27.717" data-lng="85.307"> <%-- Approx coords --%>
                        <h3>Thamel</h3>
                        <p>Thamel Marg, Kathmandu (Near Kathmandu Guest House)</p>
                         <a href="#" class="map-link">View on Map</a>
                    </li>
                     <li data-lat="27.673" data-lng="85.324"> <%-- Approx coords --%>
                        <h3>Patan Durbar Square Area</h3>
                        <p>Near Patan Museum, Lalitpur</p>
                         <a href="#" class="map-link">View on Map</a>
                    </li>
                </ul>
            </div>
        </div>
    </main>

    <footer>
        <div class="copyright">
            <p>&copy; 2025 Silk Artisanal Creamery. All rights reserved.</p>
        </div>
    </footer>

    <%-- Add Leaflet JS if using Leaflet maps --%>
    <%-- <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js" integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo=" crossorigin=""></script> --%>
    <%-- Link to findus specific JS for map initialization --%>
    <%-- <script src="${pageContext.request.contextPath}/js/findus.js"></script> --%>
</body>
</html>
