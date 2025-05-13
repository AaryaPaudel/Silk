<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Cart - Silk Artisanal Creamery</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css"> Reusing home.css for nav
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css"> Link to cart specific CSS
</head>
<body>
    Navigation Bar (copied from menu.jsp for consistency)
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
            <button onclick="location.href='login.jsp'">Login</button>
        </div>
        Cart Icon
        <div class="cart-icon">
             <a href="cart">🛒 <span id="cart-count">0</span></a> TODO: Update count dynamically
        </div>
    </nav>

    <main class="cart-container">
        <h1>Your Shopping Cart</h1>

        <c:choose>
            <c:when test="${empty sessionScope.cart}">
                Cart is empty or doesn't exist
                <p class="empty-cart-message">Your cart is currently empty. Go find some flavors!</p>
                <button onclick="location.href='menu.jsp'">Explore Menu</button>
            </c:when>
            <c:otherwise>
                Cart has items - Loop through items (Requires backend logic)
                <div class="cart-items">
                    <c:forEach var="item" items="${cartItems}">
                        <div class="cart-item">
                            <img src="${pageContext.request.contextPath}/resources/images/flavor1.png" alt="${item.iceCream_Name}">
                            <div class="item-details">
                                <h3>${item.iceCream_Name}</h3>
                                <p>Price: ₹${item.iceCream_Price}</p>
                                <p>Type: ${item.iceCream_Type}</p>
                                <p>Description: ${item.iceCream_Desc}</p>
                                <p>Availability: ${item.iceCream_Availability}</p>
								<p>Takeaway ID: ${item.takeaway.takeaway_id}</p>
                            </div>
                             <div class="item-quantity">
                                <label for="quantity-${item.iceCream_Name}">Quantity:</label>
                                 <span>${item.quantity}</span>
                            </div>
                            <button class="remove-item-btn" data-item="${item.iceCream_Name}">Remove</button>
                        </div>
                    </c:forEach>
                </div>

                <div class="cart-summary">
                    <h2>Cart Summary</h2>
                    <p>Subtotal: Rs. XXXX</p> TODO: Calculate dynamically
                    <p>Tax: Rs. XXX</p> TODO: Calculate dynamically
                    <h3>Total: Rs. XXXX</h3> TODO: Calculate dynamically
                    <button class="checkout-btn">Proceed to Checkout</button> TODO: Link to checkout process
                </div>
            </c:otherwise>
        </c:choose>
    </main>

    <script>
        const removeButtons = document.querySelectorAll('.remove-item-btn');
        removeButtons.forEach(button => {
            button.addEventListener('click', function() {
                const itemName = this.dataset.item;
                const cartItem = this.parentNode.parentNode;

                // Send AJAX request to remove item from cart
                const xhr = new XMLHttpRequest();
                xhr.open('POST', '${pageContext.request.contextPath}/cart/remove', true);
                xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                xhr.onload = function() {
                    if (xhr.status === 200) {
                        // Remove item from cart page
                         cartItem.remove();
                         // Update cart count
                         const cartCount = document.querySelector('#cart-count');
                         cartCount.textContent = xhr.responseText;

                         // Update cart size in nav bar
                         const navCartCount = document.querySelector('#cart-count');
                         navCartCount.textContent = xhr.responseText;
                    } else {
                        alert('Error removing item from cart.');
                    }
                };
                xhr.send('itemName=' + encodeURIComponent(itemName));
            });
        });
    </script>

    <footer>
        <div class="copyright">
            <p>&copy; 2025 Silk Artisanal Creamery. All rights reserved.</p>
        </div>
    </footer>

    Link to cart specific JS if needed later
    <script src="${pageContext.request.contextPath}/js/cart.js"></script>
</body>
</html>
 --%>