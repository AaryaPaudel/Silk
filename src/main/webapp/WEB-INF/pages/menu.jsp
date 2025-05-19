<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Our Menu - Silk Artisanal Creamery</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu.css">
</head>
<body>
    <%-- Navigation Bar (copied from home.jsp for consistency) --%>
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



    <main class="menu-container">
        <h1>Our Flavors</h1>

        <%-- Filter Buttons --%>
        <div class="filter-buttons">
            <button class="filter-btn active" data-filter="all">All Flavors</button>
            <button class="filter-btn" data-filter="popular">Most Popular</button>
            <button class="filter-btn" data-filter="normal">Classic Cream</button>
            <button class="filter-btn" data-filter="sorbet">Sorbet</button>
            <button class="filter-btn" data-filter="gluten-free">Gluten-Free</button>
        </div>

        <%-- Flavor Grid --%>
        <div class="flavor-grid">
            <div class="flavor-item" data-category="normal"
                 data-description="Rich, dark Belgian chocolate with smooth creaminess. Availability: Available. Price: ₹450">
                <div class="flavor-availability">Available</div>
                <img src="${pageContext.request.contextPath}/resources/images/BelgianChocolate.png" alt="Belgian Chocolate">
                <h3>Belgian Chocolate</h3>
                <div class="flavor-type">Classic Cream</div>
                <p class="flavor-description">Rich, dark Belgian chocolate with smooth creaminess.</p>
                <p class="flavor-price">$4.50</p>
                <button class="add-btn">+</button>
            </div>
            <div class="flavor-item" data-category="sorbet vegan"
                 data-description="Dairy-free mango delight made with Alphonso mangoes. Availability: Available.">
                <div class="flavor-availability">Available</div>
                <img src="${pageContext.request.contextPath}/resources/images/MangoSorbet.png" alt="Mango Sorbet">
                <h3>Mango Sorbet</h3>
                 <div class="flavor-type">Sorbet</div>
                <p class="flavor-description">Dairy-free mango delight made with Alphonso mangoes.</p>
                <p class="flavor-price">$3.50</p>
                <button class="add-btn">+</button>
            </div>
            <div class="flavor-item" data-category="normal"
                 data-description="Classic vanilla made from real Madagascar vanilla beans. Availability: Available.">
                <div class="flavor-availability">Available</div>
                <img src="${pageContext.request.contextPath}/resources/images/VanillaBean.png" alt="Vanilla Bean">
                <h3>Vanilla Bean</h3>
                 <div class="flavor-type">Classic Cream</div>
                <p class="flavor-description">Classic vanilla made from real Madagascar vanilla beans.</p>
                <p class="flavor-price">$4.00</p>
                <button class="add-btn">+</button>
            </div>
            <div class="flavor-item" data-category="gluten-free"
                 data-description="Creamy strawberry with real fruit chunks, gluten-free certified. Availability: Available.">
                <div class="flavor-availability">Available</div>
                <img src="${pageContext.request.contextPath}/resources/images/StrawberryBliss.png" alt="Strawberry Bliss">
                <h3>Strawberry Bliss</h3>
                 <div class="flavor-type">Gluten-Free</div>
                <p class="flavor-description">Creamy strawberry with real fruit chunks, gluten-free certified.</p>
                <p class="flavor-price">$4.20</p>
                <button class="add-btn">+</button>
            </div>
            <div class="flavor-item" data-category="normal"
                 data-description="Nutty pistachio with a hint of almond. Availability: Available.">
                <div class="flavor-availability">Available</div>
                <img src="${pageContext.request.contextPath}/resources/images/PistachioDelight.png" alt="Pistachio Delight">
                <h3>Pistachio Delight</h3>
                 <div class="flavor-type">Classic Cream</div>
                <p class="flavor-description">Nutty pistachio with a hint of almond.</p>
                <p class="flavor-price">$4.70</p>
                <button class="add-btn">+</button>
            </div>
            <div class="flavor-item" data-category="sorbet vegan"
                 data-description="Refreshing raspberry made with fresh fruit purée. Availability: Out of Stock.">
                <div class="flavor-availability">Out of Stock</div>
                <img src="${pageContext.request.contextPath}/resources/images/RaspberrySorbet.png" alt="Raspberry Sorbet">
                <h3>Raspberry Sorbet</h3>
                 <div class="flavor-type">Sorbet</div>
                <p class="flavor-description">Refreshing raspberry made with fresh fruit purée.</p>
                <p class="flavor-price">$3.60</p>
                <button class="add-btn">+</button>
            </div>
            <div class="flavor-item" data-category="normal"
                 data-description="Sweet and salty caramel with a rich creamy base. Availability: Available.">
                <div class="flavor-availability">Available</div>
                <img src="${pageContext.request.contextPath}/resources/images/SaltedCaramelSwirl.png" alt="Salted Caramel Swirl">
                <h3>Salted Caramel Swirl</h3>
                 <div class="flavor-type">Classic Cream</div>
                <p class="flavor-description">Sweet and salty caramel with a rich creamy base.</p>
                <p class="flavor-price">$4.80</p>
                <button class="add-btn">+</button>
            </div>
            <div class="flavor-item" data-category="gluten-free"
                 data-description="Creamy coconut milk base with toasted coconut flakes. Availability: Available.">
                <div class="flavor-availability">Available</div>
                <img src="${pageContext.request.contextPath}/resources/images/CoconutParadise.png" alt="Coconut Paradise">
                <h3>Coconut Paradise</h3>
                 <div class="flavor-type">Gluten-Free</div>
                <p class="flavor-description">Creamy coconut milk base with toasted coconut flakes.</p>
                <p class="flavor-price">$4.30</p>
                <button class="add-btn">+</button>
            </div>
            <div class="flavor-item" data-category="normal"
                 data-description="Intense chocolate with zesty orange notes. Availability: Available.">
                <div class="flavor-availability">Available</div>
                <img src="${pageContext.request.contextPath}/resources/images/DarkChocolateOrange.png" alt="Dark Chocolate Orange">
                <h3>Dark Chocolate Orange</h3>
                 <div class="flavor-type">Classic Cream</div>
                <p class="flavor-description">Intense chocolate with zesty orange notes.</p>
                <p class="flavor-price">$4.90</p>
                <button class="add-btn">+</button>
            </div>
            <div class="flavor-item" data-category="sorbet vegan"
                 data-description="Tart and refreshing lemon flavor, dairy-free. Availability: Available.">
                <div class="flavor-availability">Available</div>
                <img src="${pageContext.request.contextPath}/resources/images/LemonZestSorbet.png" alt="Lemon Zest Sorbet">
                <h3>Lemon Zest Sorbet</h3>
                 <div class="flavor-type">Sorbet</div>
                <p class="flavor-description">Tart and refreshing lemon flavor, dairy-free.</p>
                <p class="flavor-price">$3.40</p>
                <button class="add-btn">+</button>
            </div>
            <div class="flavor-item" data-category="gluten-free"
                 data-description="Roasted almonds in honey-infused cream. Availability: Out of Stock.">
                <div class="flavor-availability">Out of Stock</div>
                <img src="${pageContext.request.contextPath}/resources/images/HoneyAlmondCrunch.png" alt="Honey Almond Crunch">
                <h3>Honey Almond Crunch</h3>
                 <div class="flavor-type">Gluten-Free</div>
                <p class="flavor-description">Roasted almonds in honey-infused cream.</p>
                <p class="flavor-price">$4.60</p>
                <button class="add-btn">+</button>
            </div>
            <div class="flavor-item" data-category="normal"
                 data-description="Cream cheese base with blueberry swirls and biscuit bits. Availability: Available.">
                <div class="flavor-availability">Available</div>
                <img src="${pageContext.request.contextPath}/resources/images/BlueberryCheesecake.png" alt="Blueberry Cheesecake">
                <h3>Blueberry Cheesecake</h3>
                 <div class="flavor-type">Classic Cream</div>
                <p class="flavor-description">Cream cheese base with blueberry swirls and biscuit bits.</p>
                <p class="flavor-price">$4.70</p>
                <button class="add-btn">+</button>
            </div>
            <div class="flavor-item" data-category="normal"
                 data-description="Refreshing mint with crunchy chocolate chips. Availability: Available.">
                <div class="flavor-availability">Available</div>
                <img src="${pageContext.request.contextPath}/resources/images/MintChocoChip.png" alt="Mint Choco Chip">
                <h3>Mint Choco Chip</h3>
                 <div class="flavor-type">Classic Cream</div>
                <p class="flavor-description">Refreshing mint with crunchy chocolate chips.</p>
                <p class="flavor-price">$4.10</p>
                <button class="add-btn">+</button>
            </div>
            <div class="flavor-item" data-category="sorbet vegan"
                 data-description="Exotic lychee paired with floral rose essence. Availability: Available.">
                <div class="flavor-availability">Available</div>
                <img src="${pageContext.request.contextPath}/resources/images/LycheeRoseSorbet.png" alt="Lychee Rose Sorbet">
                <h3>Lychee Rose Sorbet</h3>
                 <div class="flavor-type">Sorbet</div>
                <p class="flavor-description">Exotic lychee paired with floral rose essence.</p>
                <p class="flavor-price">$3.70</p>
                <button class="add-btn">+</button>
            </div>
            <div class="flavor-item" data-category="normal"
                 data-description="Bold coffee with chocolate fudge ribbons. Availability: Available.">
                <div class="flavor-availability">Available</div>
                <img src="${pageContext.request.contextPath}/resources/images/CoffeeMochaFudge.png" alt="Coffee Mocha Fudge">
                <h3>Coffee Mocha Fudge</h3>
                 <div class="flavor-type">Classic Cream</div>
                <p class="flavor-description">Bold coffee with chocolate fudge ribbons.</p>
                <p class="flavor-price">$4.80</p>
                <button class="add-btn">+</button>
            </div>
            <div class="flavor-item" data-category="gluten-free"
                 data-description="Natural banana flavor with crunchy walnuts, gluten-free. Availability: Available.">
                <div class="flavor-availability">Available</div>
                <img src="${pageContext.request.contextPath}/resources/images/BananaWalnut.png" alt="Banana Walnut">
                <h3>Banana Walnut</h3>
                 <div class="flavor-type">Gluten-Free</div>
                <p class="flavor-description">Natural banana flavor with crunchy walnuts, gluten-free.</p>
                <p class="flavor-price">$4.50</p>
                <button class="add-btn">+</button>
            </div>
            <div class="flavor-item" data-category="normal"
                 data-description="Creamy base with tart black currant swirls. Availability: Out of Stock.">
                <div class="flavor-availability">Out of Stock</div>
                <img src="${pageContext.request.contextPath}/resources/images/Blackcurrant.png" alt="Black Currant">
                <h3>Black Currant</h3>
                 <div class="flavor-type">Classic Cream</div>
                <p class="flavor-description">Creamy base with tart black currant swirls.</p>
                <p class="flavor-price">$4.60</p>
                <button class="add-btn">+</button>
            </div>
            <div class="flavor-item" data-category="sorbet vegan"
                 data-description="Spicy-sweet tropical guava with a hint of chili. Availability: Available.">
                <div class="flavor-availability">Available</div>
                <img src="${pageContext.request.contextPath}/resources/images/GuavaChilliSorbet.png" alt="Guava Chili Sorbet">
                <h3>Guava Chili Sorbet</h3>
                 <div class="flavor-type">Sorbet</div>
                <p class="flavor-description">Spicy-sweet tropical guava with a hint of chili.</p>
                <p class="flavor-price">$3.90</p>
                <button class="add-btn">+</button>
            </div>
            <div class="flavor-item" data-category="normal"
                 data-description="Crunchy chocolate cookies in creamy vanilla. Availability: Available.">
                <div class="flavor-availability">Available</div>
                <img src="${pageContext.request.contextPath}/resources/images/CookiesCream.png" alt="Cookies & Cream">
                <h3>Cookies & Cream</h3>
                 <div class="flavor-type">Classic Cream</div>
                <p class="flavor-description">Crunchy chocolate cookies in creamy vanilla.</p>
                <p class="flavor-price">$4.70</p>
                <button class="add-btn">+</button>
            </div>
            <div class="flavor-item" data-category="gluten-free"
                 data-description="Naturally sweet figs blended with local honey in a gluten-free base. Availability: Available.">
                <div class="flavor-availability">Available</div>
                <img src="${pageContext.request.contextPath}/resources/images/FigHoney.png" alt="Fig & Honey">
                <h3>Fig & Honey</h3>
                 <div class="flavor-type">Gluten-Free</div>
                <p class="flavor-description">Naturally sweet figs blended with local honey in a gluten-free base.</p>
                <p class="flavor-price">$4.40</p>
                <button class="add-btn">+</button>
            </div>
        </div>
    </main>

    <%-- Flavor Detail Modal (Initially Hidden) --%>
    <div id="flavorModal" class="modal">
        <div class="modal-content">
            <span class="close-btn">&times;</span>
            <img id="modalImage" src="" alt="Flavor Image">
            <h2 id="modalTitle">Flavor Name</h2>
            <%-- Updated paragraph to handle multi-line description --%>
            <pre id="modalDescription">Flavor description goes here.</pre>
        </div>
    </div>

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

    <script>
        const filterButtons = document.querySelectorAll('.filter-btn');
        const flavorItems = document.querySelectorAll('.flavor-item');

        filterButtons.forEach(button => {
            button.addEventListener('click', function() {
                // Remove active class from all buttons
                filterButtons.forEach(btn => btn.classList.remove('active'));
                // Add active class to the clicked button
                this.classList.add('active');

                const filterValue = this.dataset.filter;

                flavorItems.forEach(item => {
                    if (filterValue === 'all') {
                        item.classList.remove('hidden');
                    } else if (item.dataset.category.includes(filterValue)) {
                        item.classList.remove('hidden');
                    } else {
                        item.classList.add('hidden');
                    }
                });
            });
        });

        // Add to cart functionality
        const addToCartButtons = document.querySelectorAll('.add-btn');
        addToCartButtons.forEach(button => {
            button.addEventListener('click', function() {
                const flavorItem = this.parentNode;
                const flavorName = flavorItem.querySelector('h3').textContent;
                let flavorPrice = flavorItem.querySelector('.flavor-price').textContent.replace('$', '');
				flavorPrice = flavorPrice.replace('$', '');
                const imagePath = flavorItem.querySelector('img').src;
                const flavorType = flavorItem.querySelector('.flavor-type').textContent;
                const flavorDesc = flavorItem.dataset.description;
                const flavorAvailability = flavorItem.querySelector('.flavor-availability').textContent;
            });
        });
    </script>
</body>
</html>
