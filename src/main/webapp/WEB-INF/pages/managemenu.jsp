<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Menu</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/managemenu.css">
</head>
<body>
<nav>
    <div class="logo">
        <img src="${pageContext.request.contextPath}/resources/images/SilkLogo.png" alt="Silk Logo"/> 
    </div>
    <div class="pages">
        <a href="${pageContext.request.contextPath}/dashboard">Dashboard</a>
        <a href="${pageContext.request.contextPath}/managemenu">Manage Menu</a>
        <a href="${pageContext.request.contextPath}/adminprofile">Admin Profile</a>
    </div>
    <div class="login">
        <a href="${pageContext.request.contextPath}/logout"><button>Logout</button></a>
    </div>
</nav>

<c:if test="${not empty sessionScope.success}">
    <div class="alert alert-success">${sessionScope.success}</div>
    <% session.removeAttribute("success"); %>
</c:if>

<c:if test="${not empty sessionScope.error}">
    <div class="alert alert-danger">${sessionScope.error}</div>
    <% session.removeAttribute("error"); %>
</c:if>

<div class="container">
    <h1>Manage Menu</h1>
    
	<section class="search-bar">
        <form action="managemenu" method="get" style="display: flex; align-items: center; margin-bottom: 10px;">
            <input type="hidden" name="action" value="search"/>
            <input type="text" id="searchTerm" name="searchTerm" placeholder="Search by Name"
                   value="${searchTerm}" style="padding: 8px; border: 1px solid #ddd; border-radius: 4px; margin-right: 10px; flex-grow: 1;">
            <button type="submit" class="brown-button" style="padding: 8px 12px;">Search</button>
            <button type="button" class="brown-button" onclick="window.location.href='managemenu?action=showAll'" style="margin-left: 10px; padding: 8px 12px;">Show All</button>
        </form>
        <c:if test="${not empty requestScope.searchError}">
            <div class="alert alert-danger">${requestScope.searchError}</div>
        </c:if>
    </section>
    
    <section class="menu-list">
        <table id="iceCreamTable">
            <thead>
                <tr>
                    <th>Ice Cream ID</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Type</th>
                    <th>Description</th>
                    <th>Availability</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${iceCreams}" var="iceCream">
                    <tr>
                        <td>${iceCream.icecream_Id}</td>
                        <td>${iceCream.iceCream_Name}</td>
                        <td>${iceCream.iceCream_Price}</td>
                        <td>${iceCream.iceCream_Type}</td>
                        <td>${iceCream.iceCream_Desc}</td>
                        <td>${iceCream.iceCream_Availability}</td>
                        <td>
                            <!-- Edit button submits GET form to reload page with edit action -->
                            <form method="get" action="managemenu" style="display:inline;">
                                <input type="hidden" name="action" value="edit"/>
                                <input type="hidden" name="iceCreamId" value="${iceCream.icecream_Id}"/>
                                <button type="submit" class="edit-button">Edit</button>
                            </form>

                            <!-- Delete button submits POST form to delete -->
                            <form action="managemenu" method="post" style="display:inline;">
                                <input type="hidden" name="action" value="delete"/>
                                <input type="hidden" name="iceCreamId" value="${iceCream.icecream_Id}"/>
                                <button type="submit" class="delete-button" 
                                        onclick="return confirm('Are you sure you want to delete this ice cream?');">
                                    Delete
                                </button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <!-- Add New Ice Cream button is a GET form that reloads page with action=add -->
        <form method="get" action="managemenu" style="margin-top: 15px;">
            <input type="hidden" name="action" value="add"/>
            <button id="addNewIceCreamButton" type="submit">Add New Ice Cream</button>
        </form>
    </section>

    <!-- Show form only when adding or editing -->
    <c:if test="${param.action == 'edit' or param.action == 'add'}">
        <section id="addForm" class="add-form">
            <h2>
                <c:choose>
                    <c:when test="${param.action == 'edit'}">Edit Ice Cream</c:when>
                    <c:otherwise>Add Ice Cream</c:otherwise>
                </c:choose>
            </h2>
            <form id="addIceCreamForm" action="managemenu" method="post">
                <input type="hidden" name="action" value="${param.action}"/>
                <input type="hidden" name="iceCreamId" value="${param.action == 'edit' ? param.iceCreamId : ''}"/>

                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required
                    value="<c:out value='${iceCreamToEdit != null ? iceCreamToEdit.iceCream_Name : ""}'/>"/><br>

                <label for="price">Price:</label>
                <input type="number" id="price" name="price" step="0.01" required
                    value="<c:out value='${iceCreamToEdit != null ? iceCreamToEdit.iceCream_Price : ""}'/>"/><br>

                <label for="type">Type:</label>
                <input type="text" id="type" name="type" required
                    value="<c:out value='${iceCreamToEdit != null ? iceCreamToEdit.iceCream_Type : ""}'/>"/><br>

                <label for="description">Description:</label>
                <input type="text" id="description" name="description" required
                    value="<c:out value='${iceCreamToEdit != null ? iceCreamToEdit.iceCream_Desc : ""}'/>"/><br>

                <label for="availability">Availability:</label>
                <input type="text" id="availability" name="availability" required
                    value="<c:out value='${iceCreamToEdit != null ? iceCreamToEdit.iceCream_Availability : ""}'/>"/><br>

                <input type="submit" value="<c:choose><c:when test='${param.action == "edit"}'>Update Ice Cream</c:when><c:otherwise>Submit</c:otherwise></c:choose>" class="submit-button"/>
            </form>
        </section>
    </c:if>

</div>
</body>
</html>
