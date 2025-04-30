<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <img src="${pageContext.request.contextPath}/resources/photos/SilkLogo.png" alt="Silk Logo"/>
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
        <%-- Cart Icon Placeholder --%>
        <div class="cart-icon">
             <a href="${pageContext.request.contextPath}/cart">🛒 <span id="cart-count">0</span></a>
        </div>
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
            <%-- Normal Flavors (10) --%>
            <div class="flavor-item" data-category="normal popular"
                 data-description="Experience pure bliss with our classic Vanilla Bean. Crafted with authentic Madagascar vanilla pods for a smooth, aromatic, and timeless taste.\n\nIngredients: Fresh Milk, Rich Cream, Cane Sugar, Madagascar Vanilla Beans, Organic Egg Yolk.\nAllergens: Milk, Egg.\nAvailability: Year-Round Staple.\nPrice: Rs. 360">
                <img src="${pageContext.request.contextPath}/resources/photos/placeholder.png" alt="Vanilla Bean">
                <h3>Vanilla Bean</h3>
                <p class="flavor-description">Experience pure bliss with our classic Vanilla Bean. Crafted with authentic Madagascar vanilla pods for a smooth, aromatic, and timeless taste.</p>
                <button class="add-btn">+</button>
            </div>
            <div class="flavor-item" data-category="normal popular"
                 data-description="Indulge your dark side! An intensely rich and decadent journey into premium dark cocoa. Deep, complex, and utterly satisfying.\n\nIngredients: Fresh Milk, Rich Cream, Cane Sugar, Premium Dark Cocoa Powder, Organic Egg Yolk.\nAllergens: Milk, Egg.\nAvailability: Always Here to Tempt You.\nPrice: Rs. 410">
                <img src="${pageContext.request.contextPath}/resources/photos/placeholder.png" alt="Dark Chocolate">
                <h3>Dark Chocolate</h3>
                <p class="flavor-description">Indulge your dark side! An intensely rich and decadent journey into premium dark cocoa. Deep, complex, and utterly satisfying.</p>
                <button class="add-btn">+</button>
            </div>
            <div class="flavor-item" data-category="normal"
                 data-description="A delightful dance of sweet cream and tangy strawberry ribbons. Made with sun-ripened strawberries for a burst of summer freshness.\n\nIngredients: Fresh Milk, Rich Cream, Cane Sugar, Fresh Strawberries, Lemon Juice, Organic Egg Yolk.\nAllergens: Milk, Egg.\nAvailability: Spring/Summer Delight.\nPrice: Rs. 390">
                <img src="${pageContext.request.contextPath}/resources/photos/placeholder.png" alt="Strawberry Swirl">
                <h3>Strawberry Swirl</h3>
                <p class="flavor-description">A delightful dance of sweet cream and tangy strawberry ribbons. Made with sun-ripened strawberries for a burst of summer freshness.</p>
                <button class="add-btn">+</button>
            </div>
            <div class="flavor-item" data-category="normal popular"
                 data-description="Cool, crisp peppermint meets its match with generous flakes of rich dark chocolate. An invigorating and classic combination.\n\nIngredients: Fresh Milk, Rich Cream, Cane Sugar, Natural Peppermint Extract, Dark Chocolate Flakes, Organic Egg Yolk.\nAllergens: Milk, Egg, Soy (in chocolate).\nAvailability: Perennially Popular.\nPrice: Rs. 400">
                <img src="${pageContext.request.contextPath}/resources/photos/placeholder.png" alt="Mint Chip">
                <h3>Mint Chip</h3>
                <p class="flavor-description">Cool, crisp peppermint meets its match with generous flakes of rich dark chocolate. An invigorating and classic combination.</p>
                <button class="add-btn">+</button>
            </div>
            <div class="flavor-item" data-category="normal"
                 data-description="Your childhood favorite, elevated. Creamy vanilla packed with chunks of irresistible chocolate sandwich cookies. Pure comfort!\n\nIngredients: Fresh Milk, Rich Cream, Cane Sugar, Chocolate Sandwich Cookies, Vanilla Extract, Organic Egg Yolk.\nAllergens: Milk, Egg, Wheat, Soy.\nAvailability: Always a Crowd-Pleaser.\nPrice: Rs. 420">
                <img src="${pageContext.request.contextPath}/resources/photos/placeholder.png" alt="Cookies & Cream">
                <h3>Cookies & Cream</h3>
                <p class="flavor-description">Your childhood favorite, elevated. Creamy vanilla packed with chunks of irresistible chocolate sandwich cookies. Pure comfort!</p>
                <button class="add-btn">+</button>
            </div>
             <div class="flavor-item" data-category="normal"
                  data-description="A sophisticated treat. Nutty brown butter provides a warm base for crunchy, perfectly toasted pecan pieces. Elegantly rich.\n\nIngredients: Fresh Milk, Rich Cream, Cane Sugar, Brown Butter, Toasted Pecans, Organic Egg Yolk.\nAllergens: Milk, Egg, Tree Nuts (Pecans).\nAvailability: Consistently Available.\nPrice: Rs. 460">
                <img src="${pageContext.request.contextPath}/resources/photos/placeholder.png" alt="Butter Pecan">
                <h3>Butter Pecan</h3>
                <p class="flavor-description">A sophisticated treat. Nutty brown butter provides a warm base for crunchy, perfectly toasted pecan pieces. Elegantly rich.</p>
                <button class="add-btn">+</button>
            </div>
            <div class="flavor-item" data-category="normal"
                 data-description="Sweet cream ice cream generously swirled with our thick, homemade salted caramel. A perfect balance of sweet and salty indulgence.\n\nIngredients: Fresh Milk, Rich Cream, Cane Sugar, Butter, Sea Salt, Vanilla Extract, Organic Egg Yolk.\nAllergens: Milk, Egg.\nAvailability: An Everyday Luxury.\nPrice: Rs. 430">
                <img src="${pageContext.request.contextPath}/resources/photos/placeholder.png" alt="Salted Caramel">
                <h3>Salted Caramel</h3>
                <p class="flavor-description">Sweet cream ice cream generously swirled with our thick, homemade salted caramel. A perfect balance of sweet and salty indulgence.</p>
                <button class="add-btn">+</button>
            </div>
            <div class="flavor-item" data-category="normal"
                 data-description="Wake up your taste buds! Bold, aromatic, and smooth coffee flavor, brewed to perfection. A coffee lover's dream scoop.\n\nIngredients: Fresh Milk, Rich Cream, Cane Sugar, Premium Coffee Beans, Organic Egg Yolk.\nAllergens: Milk, Egg.\nAvailability: Always Brewing.\nPrice: Rs. 380">
                <img src="${pageContext.request.contextPath}/resources/photos/placeholder.png" alt="Coffee">
                <h3>Coffee</h3>
                <p class="flavor-description">Wake up your taste buds! Bold, aromatic, and smooth coffee flavor, brewed to perfection. A coffee lover's dream scoop.</p>
                <button class="add-btn">+</button>
            </div>
             <div class="flavor-item" data-category="normal"
                  data-description="Delicate, nutty, and slightly sweet pistachio flavor studded with real, vibrant green pistachio pieces. An exotic escape.\n\nIngredients: Fresh Milk, Rich Cream, Cane Sugar, Roasted Pistachios, Almond Extract, Organic Egg Yolk.\nAllergens: Milk, Egg, Tree Nuts (Pistachios, Almonds).\nAvailability: Consistently Available.\nPrice: Rs. 490">
                <img src="${pageContext.request.contextPath}/resources/photos/placeholder.png" alt="Pistachio">
                <h3>Pistachio</h3>
                <p class="flavor-description">Delicate, nutty, and slightly sweet pistachio flavor studded with real, vibrant green pistachio pieces. An exotic escape.</p>
                <button class="add-btn">+</button>
            </div>
            <div class="flavor-item" data-category="normal"
                 data-description="Deconstructed dessert delight! Creamy cheesecake ice cream, tangy strawberry swirls, and crunchy graham cracker crust pieces.\n\nIngredients: Fresh Milk, Rich Cream, Cane Sugar, Cream Cheese, Strawberries, Graham Cracker Crumbs, Organic Egg Yolk.\nAllergens: Milk, Egg, Wheat.\nAvailability: Special Occasions & Limited Runs.\nPrice: Rs. 470">
                <img src="${pageContext.request.contextPath}/resources/photos/placeholder.png" alt="Strawberry Cheesecake">
                <h3>Strawberry Cheesecake</h3>
                <p class="flavor-description">Deconstructed dessert delight! Creamy cheesecake ice cream, tangy strawberry swirls, and crunchy graham cracker crust pieces.</p>
                <button class="add-btn">+</button>
            </div>

            <%-- Sorbet Flavors (5) --%>
            <div class="flavor-item" data-category="sorbet vegan"
                 data-description="Sunshine in a scoop! Incredibly bright, tangy, and refreshing lemon sorbet made with real lemon juice and zest. Pure zest!\n\nIngredients: Filtered Water, Cane Sugar, Fresh Lemon Juice, Lemon Zest.\nAllergens: None.\nAvailability: Always Refreshing.\nPrice: Rs. 310">
                <img src="${pageContext.request.contextPath}/resources/photos/placeholder.png" alt="Lemon Sorbet">
                <h3>Lemon Sorbet</h3>
                <p class="flavor-description">Sunshine in a scoop! Incredibly bright, tangy, and refreshing lemon sorbet made with real lemon juice and zest. Pure zest!</p>
                <button class="add-btn">+</button>
            </div>
            <div class="flavor-item" data-category="sorbet vegan"
                 data-description="Vibrant and bursting with berry goodness! Sweet, slightly tart raspberry sorbet that tastes like freshly picked berries.\n\nIngredients: Filtered Water, Cane Sugar, Fresh Raspberries, Lemon Juice.\nAllergens: None.\nAvailability: Summer Berry Season.\nPrice: Rs. 330">
                <img src="${pageContext.request.contextPath}/resources/photos/placeholder.png" alt="Raspberry Sorbet">
                <h3>Raspberry Sorbet</h3>
                <p class="flavor-description">Vibrant and bursting with berry goodness! Sweet, slightly tart raspberry sorbet that tastes like freshly picked berries.</p>
                <button class="add-btn">+</button>
            </div>
            <div class="flavor-item" data-category="sorbet vegan"
                 data-description="A tropical getaway! Sweet, luscious mango sorbet made from ripe, juicy mangoes. Escape to the tropics with every spoonful.\n\nIngredients: Filtered Water, Cane Sugar, Ripe Mango Puree, Lime Juice.\nAllergens: None.\nAvailability: When Mangoes Are Best.\nPrice: Rs. 350">
                <img src="${pageContext.request.contextPath}/resources/photos/placeholder.png" alt="Mango Sorbet">
                <h3>Mango Sorbet</h3>
                <p class="flavor-description">A tropical getaway! Sweet, luscious mango sorbet made from ripe, juicy mangoes. Escape to the tropics with every spoonful.</p>
                <button class="add-btn">+</button>
            </div>
            <div class="flavor-item" data-category="sorbet vegan"
                 data-description="Exotically tart and fragrant! A vibrant sorbet capturing the unique, tangy sweetness of passion fruit.\n\nIngredients: Filtered Water, Cane Sugar, Passion Fruit Puree, Lemon Juice.\nAllergens: None.\nAvailability: Limited Tropical Feature.\nPrice: Rs. 370">
                <img src="${pageContext.request.contextPath}/resources/photos/placeholder.png" alt="Passion Fruit Sorbet">
                <h3>Passion Fruit Sorbet</h3>
                <p class="flavor-description">Exotically tart and fragrant! A vibrant sorbet capturing the unique, tangy sweetness of passion fruit.</p>
                <button class="add-btn">+</button>
            </div>
            <div class="flavor-item" data-category="sorbet vegan"
                 data-description="The ultimate thirst quencher! Zesty, clean, and incredibly refreshing lime sorbet. Perfect for cutting through the heat.\n\nIngredients: Filtered Water, Cane Sugar, Fresh Lime Juice, Lime Zest.\nAllergens: None.\nAvailability: Always Cool.\nPrice: Rs. 320">
                <img src="${pageContext.request.contextPath}/resources/photos/placeholder.png" alt="Lime Sorbet">
                <h3>Lime Sorbet</h3>
                <p class="flavor-description">The ultimate thirst quencher! Zesty, clean, and incredibly refreshing lime sorbet. Perfect for cutting through the heat.</p>
                <button class="add-btn">+</button>
            </div>

            <%-- Gluten-Free Flavors (5) --%>
            <div class="flavor-item" data-category="gluten-free popular"
                 data-description="Indulge without compromise! Our intense dark chocolate, meticulously crafted using gluten-free ingredients for the same decadent experience.\n\nIngredients: Fresh Milk, Rich Cream, Cane Sugar, Premium Dark Cocoa Powder, Organic Egg Yolk, Gluten-Free Stabilizers.\nAllergens: Milk, Egg.\nAvailability: Always Available GF.\nPrice: Rs. 440">
                <img src="${pageContext.request.contextPath}/resources/photos/placeholder.png" alt="GF Dark Chocolate">
                <h3>GF Dark Chocolate</h3>
                <p class="flavor-description">Indulge without compromise! Our intense dark chocolate, meticulously crafted using gluten-free ingredients for the same decadent experience.</p>
                <button class="add-btn">+</button>
            </div>
            <div class="flavor-item" data-category="gluten-free"
                 data-description="Classic vanilla, certified gluten-free. Enjoy the pure, smooth taste of Madagascar vanilla beans without the worry.\n\nIngredients: Fresh Milk, Rich Cream, Cane Sugar, Madagascar Vanilla Beans, Organic Egg Yolk, Gluten-Free Stabilizers.\nAllergens: Milk, Egg.\nAvailability: Always Available GF.\nPrice: Rs. 390">
                <img src="${pageContext.request.contextPath}/resources/photos/placeholder.png" alt="GF Vanilla Bean">
                <h3>GF Vanilla Bean</h3>
                <p class="flavor-description">Classic vanilla, certified gluten-free. Enjoy the pure, smooth taste of Madagascar vanilla beans without the worry.</p>
                <button class="add-btn">+</button>
            </div>
            <div class="flavor-item" data-category="gluten-free"
                 data-description="Sweet, salty, and gluten-free! Our dreamy salted caramel swirl in a creamy base, made safe for gluten-sensitive indulgence.\n\nIngredients: Fresh Milk, Rich Cream, Cane Sugar, Butter, Sea Salt, Vanilla Extract, Organic Egg Yolk, Gluten-Free Stabilizers.\nAllergens: Milk, Egg.\nAvailability: Always Available GF.\nPrice: Rs. 460">
                <img src="${pageContext.request.contextPath}/resources/photos/placeholder.png" alt="GF Salted Caramel">
                <h3>GF Salted Caramel</h3>
                <p class="flavor-description">Sweet, salty, and gluten-free! Our dreamy salted caramel swirl in a creamy base, made safe for gluten-sensitive indulgence.</p>
                <button class="add-btn">+</button>
            </div>
            <div class="flavor-item" data-category="gluten-free popular"
                  data-description="Your coffee fix, gluten-free! The same bold, aromatic coffee infusion, carefully prepared with gluten-free ingredients.\n\nIngredients: Fresh Milk, Rich Cream, Cane Sugar, Premium Coffee Beans, Organic Egg Yolk, Gluten-Free Stabilizers.\nAllergens: Milk, Egg.\nAvailability: Always Available GF.\nPrice: Rs. 410">
                <img src="${pageContext.request.contextPath}/resources/photos/placeholder.png" alt="GF Coffee">
                <h3>GF Coffee</h3>
                <p class="flavor-description">Your coffee fix, gluten-free! The same bold, aromatic coffee infusion, carefully prepared with gluten-free ingredients.</p>
                <button class="add-btn">+</button>
            </div>
             <div class="flavor-item" data-category="gluten-free"
                  data-description="Exotic pistachio perfection, guaranteed gluten-free. Enjoy the nutty, delicate flavor with real pistachio pieces, worry-free.\n\nIngredients: Fresh Milk, Rich Cream, Cane Sugar, Roasted Pistachios, Almond Extract, Organic Egg Yolk, Gluten-Free Stabilizers.\nAllergens: Milk, Egg, Tree Nuts (Pistachios, Almonds).\nAvailability: Always Available GF.\nPrice: Rs. 500">
                <img src="${pageContext.request.contextPath}/resources/photos/placeholder.png" alt="GF Pistachio">
                <h3>GF Pistachio</h3>
                <p class="flavor-description">Exotic pistachio perfection, guaranteed gluten-free. Enjoy the nutty, delicate flavor with real pistachio pieces, worry-free.</p>
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
        <%-- Simple Footer --%>
        <div class="copyright">
            <p>&copy; 2025 Silk Artisanal Creamery. All rights reserved.</p>
        </div>
    </footer>

    <script src="${pageContext.request.contextPath}/js/menu.js"></script>
</body>
</html>
