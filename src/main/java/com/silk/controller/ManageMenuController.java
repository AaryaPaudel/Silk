package com.silk.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import com.silk.model.IceCreamModel;
import com.silk.service.ManageMenuService;

@WebServlet("/managemenu")
public class ManageMenuController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ManageMenuService service;

    @Override
    public void init() throws ServletException {
        super.init();
        service = new ManageMenuService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String searchTerm = request.getParameter("searchTerm");

        if ("search".equals(action) && searchTerm != null && !searchTerm.isEmpty()) {
            List<IceCreamModel> searchResults = service.searchIceCreams(searchTerm);
            request.setAttribute("iceCreams", searchResults);
            request.setAttribute("searchTerm", searchTerm); // Keep the search term for display
            if (searchResults.isEmpty()) {
                request.setAttribute("searchError", "Flavor not found.");
            }
            request.getRequestDispatcher("/WEB-INF/pages/managemenu.jsp").forward(request, response);
            return;
        } else if ("showAll".equals(action)) {
            // Load all ice creams
            List<IceCreamModel> iceCreams = service.getAllIceCreams();
            request.setAttribute("iceCreams", iceCreams);
            request.getRequestDispatcher("/WEB-INF/pages/managemenu.jsp").forward(request, response);
            return;
        } else if ("edit".equals(action)) {
            String iceCreamIdStr = request.getParameter("iceCreamId");
            if (iceCreamIdStr != null && !iceCreamIdStr.isEmpty()) {
                try {
                    int iceCreamId = Integer.parseInt(iceCreamIdStr);
                    IceCreamModel iceCreamToEdit = service.getIceCreamById(iceCreamId);
                    if (iceCreamToEdit != null) {
                        request.setAttribute("iceCreamToEdit", iceCreamToEdit);
                        request.setAttribute("iceCreams", service.getAllIceCreams()); // Still need the full list for the table
                        request.getRequestDispatcher("/WEB-INF/pages/managemenu.jsp").forward(request, response);
                        return; // Important to return after forwarding
                    } else {
                        request.setAttribute("error", "Ice cream not found with ID: " + iceCreamId);
                    }
                } catch (NumberFormatException e) {
                    request.setAttribute("error", "Invalid ice cream ID format.");
                }
            } else {
                request.setAttribute("error", "Ice cream ID is missing for edit action.");
            }
        }

        // Default behavior: Load all ice creams for the table
        List<IceCreamModel> iceCreams = service.getAllIceCreams();
        request.setAttribute("iceCreams", iceCreams);
        request.getRequestDispatcher("/WEB-INF/pages/managemenu.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            request.setAttribute("error", "No action specified.");
            doGet(request, response);
            return;
        }

        switch (action) {
            case "add":
                handleAdd(request, response);
                break;
            case "edit":
                handleEdit(request, response);
                break;
            case "delete":
                handleDelete(request, response);
                break;
            default:
                request.setAttribute("error", "Invalid action.");
                doGet(request, response);
        }
    }

    private void handleAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String priceStr = request.getParameter("price");
        String type = request.getParameter("type");
        String description = request.getParameter("description");
        String availability = request.getParameter("availability");

        if (name == null || priceStr == null || type == null || description == null || availability == null ||
            name.isEmpty() || priceStr.isEmpty() || type.isEmpty() || description.isEmpty() || availability.isEmpty()) {
            request.setAttribute("error", "All fields are required.");
            doGet(request, response);
            return;
        }

        try {
            float price = Float.parseFloat(priceStr);
            IceCreamModel newItem = new IceCreamModel(0, name, price, type, description, availability);
            boolean success = service.createIceCream(newItem);

            if (success) {
                request.setAttribute("success", "Ice cream added successfully.");
            } else {
                request.setAttribute("error", "Failed to add ice cream.");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid price format.");
        }

        doGet(request, response);
    }

    private void handleEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("iceCreamId");
        String name = request.getParameter("name");
        String priceStr = request.getParameter("price");
        String type = request.getParameter("type");
        String description = request.getParameter("description");
        String availability = request.getParameter("availability");

        if (idStr == null || name == null || priceStr == null || type == null || description == null || availability == null ||
            idStr.isEmpty() || name.isEmpty() || priceStr.isEmpty() || type.isEmpty() || description.isEmpty() || availability.isEmpty()) {
            request.setAttribute("error", "All fields are required for editing.");
            doGet(request, response); // Reload with error message and potentially pre-filled form
            return;
        }

        try {
            int id = Integer.parseInt(idStr);
            float price = Float.parseFloat(priceStr);
            IceCreamModel item = new IceCreamModel(id, name, price, type, description, availability);
            boolean success = service.updateIceCream(item);

            if (success) {
                request.getSession().setAttribute("success", "Ice cream updated.");
                // Do NOT set request.setAttribute("iceCreamToEdit", item); here.
                // This will cause the form to remain populated.
            } else {
                request.setAttribute("error", "Failed to update. Check if ID exists.");
                // Optionally, you could reload the form with the existing data for correction:
                IceCreamModel iceCreamToEdit = service.getIceCreamById(id);
                if (iceCreamToEdit != null) {
                    request.setAttribute("iceCreamToEdit", iceCreamToEdit);
                }
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid ID or price format.");
            // Optionally, if there was an ID, reload the form with existing data:
            String failedIdStr = request.getParameter("iceCreamId");
            if (failedIdStr != null && !failedIdStr.isEmpty()) {
                try {
                    IceCreamModel iceCreamToEdit = service.getIceCreamById(Integer.parseInt(failedIdStr));
                    if (iceCreamToEdit != null) {
                        request.setAttribute("iceCreamToEdit", iceCreamToEdit);
                    }
                } catch (NumberFormatException ignored) {
                    // Ignore if the ID was also invalid
                }
            }
        }

        doGet(request, response); // Reload the Manage Menu page
    }

    private void handleDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("iceCreamId");

        if (idStr == null || idStr.isEmpty()) {
            request.getSession().setAttribute("error", "ID is required for deletion.");
            response.sendRedirect("managemenu"); // Corrected redirection
            return;
        }

        try {
            int id = Integer.parseInt(idStr);
            boolean success = service.deleteIceCream(id);

            if (success) {
                request.getSession().setAttribute("success", "Ice cream deleted.");
            } else {
                request.getSession().setAttribute("error", "Failed to delete. ID may not exist.");
            }
        } catch (NumberFormatException e) {
            request.getSession().setAttribute("error", "Invalid ID format.");
        }

        response.sendRedirect("managemenu"); // Corrected redirection
    }


}
