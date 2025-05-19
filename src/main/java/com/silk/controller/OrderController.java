//package com.silk.controller;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.util.ArrayList;
//import java.util.List;
//
///**
// * Servlet implementation class OrderController
// */
//@WebServlet(asyncSupported = true, urlPatterns = { "/orders" })
//public class OrderController extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//
//    /**
//     * @see HttpServlet#HttpServlet()
//     */
//    public OrderController() {
//        super();
//        // TODO Auto-generated constructor stub
//    }
//
//    /**
//     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//     */
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // Dummy data for orders
//        List<Order> orders = new ArrayList<>();
//        orders.add(new Order("1", "John Doe", "2024-05-07 10:00", "Ice Cream", "5.00", "Dispatched"));
//        orders.add(new Order("2", "Jane Smith", "2024-05-07 11:00", "Takeaway", "10.00", "Pending"));
//
//        request.setAttribute("orders", orders);
//        request.setAttribute("totalOrdersToday", 2);
//        request.setAttribute("totalOrdersThisWeek", 10);
//        request.setAttribute("totalOrdersThisMonth", 40);
//        request.setAttribute("totalDispatchedOrders", 30);
//
//        request.getRequestDispatcher("/WEB-INF/pages/orders.jsp").forward(request, response);
//    }
//
//    /**
//     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//     */
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // TODO Auto-generated method stub
//        doGet(request, response);
//    }
//
//    // Inner class for Order
//    public class Order {
//        private String orderId;
//        private String customerName;
//        private String orderDateTime;
//        private String itemsOrdered;
//        private String totalAmount;
//        private String dispatchedStatus;
//
//        public Order(String orderId, String customerName, String orderDateTime, String itemsOrdered, String totalAmount, String dispatchedStatus) {
//            this.orderId = orderId;
//            this.customerName = customerName;
//            this.orderDateTime = orderDateTime;
//            this.itemsOrdered = itemsOrdered;
//            this.totalAmount = totalAmount;
//            this.dispatchedStatus = dispatchedStatus;
//        }
//
//        public String getOrderId() { return orderId; }
//        public String getCustomerName() { return customerName; }
//        public String getOrderDateTime() { return orderDateTime; }
//        public String getItemsOrdered() { return itemsOrdered; }
//        public String getTotalAmount() { return totalAmount; }
//        public String getDispatchedStatus() { return dispatchedStatus; }
//    }
//}
