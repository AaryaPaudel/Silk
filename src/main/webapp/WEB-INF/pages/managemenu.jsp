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
        <h1>Manage Menu</h1>
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
				        <th>Actions</th> <!-- ADD THIS LINE -->
				    </tr>
				</thead>
                <tbody id="iceCreamTableBody">
    				<c:forEach items="${iceCreams}" var="iceCream">
			        <tr>
			            <td>${iceCream.icecream_Id}</td>
			            <td>${iceCream.iceCream_Name}</td>
			            <td>${iceCream.iceCream_Price}</td>
			            <td>${iceCream.iceCream_Type}</td>
			            <td>${iceCream.iceCream_Desc}</td>
			            <td>${iceCream.iceCream_Availability}</td>
			            <td>
			                <button class="edit-button" data-id="${iceCream.icecream_Id}">Edit</button>
			                <button class="delete-button" data-id="${iceCream.icecream_Id}">Delete</button>
			            </td>
			        </tr>
			    </c:forEach>
			</tbody>
            </table>
            <button id="addNewIceCreamButton">Add New Ice Cream</button>
        </section>

        <section id="addForm" class="add-form" style="display:none;">
            <h2>Add/Edit Ice Cream</h2>
            <form id="addIceCreamForm" action="managemenu" method="post">
                <input type="hidden" id="formAction" name="action" value="add">
                <input type="hidden" id="editIceCreamId" name="iceCreamId" value="">
                <label for="name">Name:</label><input type="text" id="name" name="name" required><br>
                <label for="price">Price:</label><input type="number" id="price" name="price" step="0.01" required><br>
                <label for="type">Type:</label><input type="text" id="type" name="type" required><br>
                <label for="description">Description:</label><input type="text" id="description" name="description" required><br>
                <label for="availability">Availability:</label><input type="text" id="availability" name="availability" required><br>
                <input type="submit" value="Submit" class="submit-button">
            </form>
        </section>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            // Form submission for both Add and Edit
            $("#addIceCreamForm").submit(function(event) {
                event.preventDefault();

                var formData = $(this).serialize(); // Includes action and iceCreamId if present

                $.post("managemenu", formData, function(data) {
                    if (data && data.iceCreams) {
                        displayIceCreams(data.iceCreams);
                        $("#addIceCreamForm")[0].reset();
                        $("#formAction").val("add"); // Reset action for next time
                        $("#editIceCreamId").val("");
                        $("#addForm").hide();
                        $(".submit-button").val("Submit");
                    } else {
                        // Handle error or unexpected response
                        console.error("Failed to update ice cream list:", data);
                        alert("An error occurred. Please check the console.");
                    }
                }).fail(function() {
                    alert("Server error. Please try again later.");
                });
            });

            function displayIceCreams(iceCreams) {
                var tableBody = $("#iceCreamTableBody");
                tableBody.empty(); // Clear existing rows

                if (Array.isArray(iceCreams)) {
                    $.each(iceCreams, function(index, iceCream) {
                        var row = $("<tr>");
                        row.append($("<td>").text(iceCream.icecream_Id));
                        row.append($("<td>").text(iceCream.iceCream_Name));
                        row.append($("<td>").text(iceCream.iceCream_Price));
                        row.append($("<td>").text(iceCream.iceCream_Type));
                        row.append($("<td>").text(iceCream.iceCream_Desc));
                        row.append($("<td>").text(iceCream.iceCream_Availability));
                        
                        var actionsCell = $("<td>");
                        actionsCell.append($("<button>").text("Edit").addClass("edit-button").data("id", iceCream.icecream_Id));
                        actionsCell.append(" ");
                        actionsCell.append($("<button>").text("Delete").addClass("delete-button").data("id", iceCream.icecream_Id));
                        row.append(actionsCell);
                        
                        tableBody.append(row);
                    });
                } else {
                    console.error("displayIceCreams expected an array but received:", iceCreams);
                     // Optionally, you could try to parse it if it's a stringified JSON
                    if (typeof iceCreams === 'string') {
                        try {
                            var parsedIceCreams = JSON.parse(iceCreams);
                            if(Array.isArray(parsedIceCreams)) {
                                displayIceCreams(parsedIceCreams); // Recursive call with parsed data
                                return;
                            }
                        } catch (e) {
                            console.error("Failed to parse iceCreams string:", e);
                        }
                    }
                    // If it's not an array and not a parsable string, display a message or leave table empty
                    tableBody.append("<tr><td colspan='7'>Error loading ice cream data or no items to display.</td></tr>");
                }
            }

            // Handle Edit button click
            $("#iceCreamTableBody").on("click", ".edit-button", function() {
                var row = $(this).closest("tr");
                $("#formAction").val("edit");
                $("#editIceCreamId").val(row.find("td:eq(0)").text()); // Assuming ID is in the first cell
                $("#name").val(row.find("td:eq(1)").text());
                $("#price").val(parseFloat(row.find("td:eq(2)").text()));
                $("#type").val(row.find("td:eq(3)").text());
                $("#description").val(row.find("td:eq(4)").text());
                $("#availability").val(row.find("td:eq(5)").text());
                
                $(".submit-button").val("Update Ice Cream");
                $("#addForm h2").text("Edit Ice Cream");
                $("#addForm").show();
            });

            // Handle Delete button click
            $("#iceCreamTableBody").on("click", ".delete-button", function() {
                if (!confirm("Are you sure you want to delete this ice cream?")) {
                    return;
                }
                var iceCreamId = $(this).data("id"); 
                // If data-id wasn't set, fallback to table cell, but data-id is better
                if (!iceCreamId) {
                    iceCreamId = $(this).closest("tr").find("td:eq(0)").text();
                }


                $.post("managemenu", { action: "delete", iceCreamId: iceCreamId }, function(data) {
                    if (data && data.iceCreams) {
                        displayIceCreams(data.iceCreams);
                    } else {
                        console.error("Failed to delete or refresh list:", data);
                        alert("Error deleting item. Check console.");
                    }
                }).fail(function() {
                    alert("Server error during delete. Please try again later.");
                });
            });

 // Handle "Add New Ice Cream" button click
            $("#addNewIceCreamButton").click(function() {
                $("#addIceCreamForm")[0].reset(); // Reset form fields
                $("#formAction").val("add");      // Set action to "add"
                $("#editIceCreamId").val("");     // Clear any potential edit ID
                $(".submit-button").val("Submit"); // Set button text to "Submit"
                $("#addForm h2").text("Add Ice Cream");
                $("#addForm").show();
            });

            // Handle "Edit Menu" button click (example - implement functionality)
            $("#editMenuButton").click(function() {
                alert("Edit Menu functionality not yet implemented.");
            });

            // Handle "Delete Menu" button click (example - implement functionality)
            $("#deleteMenuButton").click(function() {
                alert("Delete Menu functionality not yet implemented.");
            });

            // Initial display of ice creams is handled by JSTL.
            // The old call 'displayIceCreams("${iceCreams}");' is removed.
        });
    </script>
</body>
</html>