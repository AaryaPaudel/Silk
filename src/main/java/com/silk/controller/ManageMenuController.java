package com.silk.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicInteger;

import com.silk.model.IceCreamModel;
import com.silk.service.ManageMenuService;


/**
 * Servlet implementation class ManageMenuController
 */
@WebServlet("/managemenu")
public class ManageMenuController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // In-memory store for ice creams. Replace with database logic in a real app.
    private List<IceCreamModel> iceCreamList = new ArrayList<>();
    private AtomicInteger idCounter = new AtomicInteger(1); // For generating unique IDs

    public ManageMenuController() {
        super();
        // Initialize with some dummy data (optional)
        // iceCreamList.add(new IceCreamModel(idCounter.getAndIncrement(), "Vanilla", 2.50, "Classic", "Classic Vanilla", "Available"));
        // iceCreamList.add(new IceCreamModel(idCounter.getAndIncrement(), "Chocolate", 3.00, "Classic", "Rich Chocolate", "Available"));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ManageMenuService service = new ManageMenuService();
        // Just display all ice creams from DB
        List<IceCreamModel> currentIceCreams = service.getAllIceCreams();
        request.setAttribute("iceCreams", currentIceCreams);
        request.getRequestDispatcher("/WEB-INF/pages/managemenu.jsp").forward(request, response);
    }


    
    private String manuallyBuildJsonResponse(List<IceCreamModel> list) {
        StringBuilder sb = new StringBuilder();
        sb.append("{\"iceCreams\":[");
        for (int i = 0; i < list.size(); i++) {
            IceCreamModel ic = list.get(i);
            sb.append("{");
            // Assuming standard Java Bean getter names based on previous corrections
            sb.append("\"icecream_Id\":").append(ic.geticecream_Id()).append(",");
            sb.append("\"iceCream_Name\":\"").append(ic.geticeCream_Name()).append("\",");
            sb.append("\"iceCream_Price\":").append(ic.geticeCream_Price()).append(",");
            sb.append("\"iceCream_Type\":\"").append(ic.geticeCream_Type()).append("\",");
            sb.append("\"iceCream_Desc\":\"").append(ic.geticeCream_Desc()).append("\",");
            sb.append("\"iceCream_Availability\":\"").append(ic.geticeCream_Availability()).append("\"");
            sb.append("}");
            if (i < list.size() - 1) {
                sb.append(",");
            }
        }
        sb.append("]}");
        return sb.toString();
    }

    private void handleAddRequest(HttpServletRequest request) {
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String type = request.getParameter("type");
        String description = request.getParameter("description");
        String availability = request.getParameter("availability");
        
        // Assuming IceCreamModel has a constructor for data fields and a setter for ID
        IceCreamModel newIceCream = new IceCreamModel(0, name, (int) price, type, description, availability);
        newIceCream.seticecream_Id(idCounter.getAndIncrement()); // Assuming setIcecream_Id(int id) exists
        iceCreamList.add(newIceCream);
    }

    private void handleEditRequest(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("iceCreamId"));
        Optional<IceCreamModel> existingIceCreamOpt = iceCreamList.stream()
                                                                .filter(ic -> ic.geticecream_Id() == id)
                                                                .findFirst();
        if (existingIceCreamOpt.isPresent()) {
            IceCreamModel iceCreamToEdit = existingIceCreamOpt.get();
            iceCreamToEdit.seticeCream_Name(request.getParameter("name"));
            iceCreamToEdit.seticeCream_Price(Integer.parseInt(request.getParameter("price"))); // Corrected to Double
            iceCreamToEdit.seticeCream_Type(request.getParameter("type"));
            iceCreamToEdit.seticeCream_Desc(request.getParameter("description"));
            iceCreamToEdit.seticeCream_Availability(request.getParameter("availability"));
        }
    }

    private void handleDeleteRequest(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("iceCreamId"));
        iceCreamList.removeIf(ic -> ic.geticecream_Id() == id);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        ManageMenuService service = new ManageMenuService();

        switch (action) {
            case "add":
                handleAddRequest(request);
                break;
            case "edit":
                handleEditRequest(request);
                break;
            case "delete":
                handleDeleteRequest(request);
                break;
            default:
                break;
        }

        // After performing the action, fetch updated list and respond as JSON
        List<IceCreamModel> updatedList = service.getAllIceCreams();  // Replace with DB logic if needed
        response.setContentType("application/json");
        response.getWriter().write(manuallyBuildJsonResponse(updatedList));
    }

    // Removed IceCreamResponse helper class as JSON is built manually
}