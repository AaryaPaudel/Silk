package com.silk.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.RequestDispatcher;

import com.silk.model.UserModelData;
import com.silk.service.DashboardService;

@WebServlet(asyncSupported = true, urlPatterns = { "/dashboard", "/admin_logout" })
public class AdminDashboardController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getServletPath();
        if (action.equals("/admin_logout")) {
            HttpSession session = request.getSession();
            session.invalidate();
            response.sendRedirect(request.getContextPath() + "/menu");
            return;
        }

        HttpSession session = request.getSession();
        UserModelData user = (UserModelData) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Set user
        request.setAttribute("user", user);

        // Get KPI data
        DashboardService dashboardService = new DashboardService();
        int totalOrders = dashboardService.getTotalOrders();
        int completedOrders = dashboardService.getCompletedOrders();
        double totalSales = dashboardService.getTotalSales();
        String popularItem = dashboardService.getMostPopularItem();
        int totalFlavors = dashboardService.getTotalIceCreamFlavors();

        // Set attributes
        request.setAttribute("totalOrders", totalOrders);
        request.setAttribute("completedOrders", completedOrders);
        request.setAttribute("totalSales", totalSales);
        request.setAttribute("popularItem", popularItem);
        request.setAttribute("totalFlavors", totalFlavors);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/pages/dashboard.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
