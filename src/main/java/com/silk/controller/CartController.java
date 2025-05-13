//package com.silk.controller;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import jakarta.servlet.http.HttpSession;
//import java.util.ArrayList;
//import java.util.List;
//import com.silk.model.IceCreamModel;
//import com.silk.model.TakeawayModel;
//import com.silk.service.TakeawayService;
//import java.time.LocalDateTime;
//import java.time.format.DateTimeFormatter;
//
//@WebServlet(asyncSupported = true, urlPatterns = { "/cart", "/cart/add", "/cart/remove", "/cart/confirm" })
//public class CartController extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//
//	private TakeawayService takeawayService = new TakeawayService();
//
//    public CartController() {
//        super();
//    }
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        HttpSession session = request.getSession();
//        List<IceCreamModel> cart = (List<IceCreamModel>) session.getAttribute("cart");
//
//        request.setAttribute("cartItems", cart);
//        request.getRequestDispatcher("/WEB-INF/pages/cart.jsp").forward(request, response);
//    }
//
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String path = request.getServletPath();
//        if ("/cart/add".equals(path)) {
//            addToCart(request, response);
//        } else if ("/cart/remove".equals(path)) {
//            removeFromCart(request, response);
//        } else if ("/cart/confirm".equals(path)) {
//			confirmPickupOrder(request, response);
//		}
//         else {
//            doGet(request, response);
//        }
//    }
//
//    protected void addToCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        HttpSession session = request.getSession();
//        List<IceCreamModel> cart = (List<IceCreamModel>) session.getAttribute("cart");
//        if (cart == null) {
//            cart = new ArrayList<>();
//            session.setAttribute("cart", cart);
//        }
//
//        String flavorName = request.getParameter("flavorName");
//        String flavorPrice = request.getParameter("flavorPrice");
//        String imagePath = request.getParameter("imagePath");
//        String flavorType = request.getParameter("flavorType");
//        String flavorDesc = request.getParameter("flavorDesc");
//        String flavorAvailability = request.getParameter("flavorAvailability");
//		String takeawayId = request.getParameter("takeawayId");
//		int takeawayIdInt = 0;
//		if (takeawayId != null && !takeawayId.isEmpty()) {
//			try {
//				takeawayIdInt = Integer.parseInt(takeawayId);
//			} catch (NumberFormatException e) {
//				// Handle the exception, e.g., log an error or set a default value
//				takeawayIdInt = 0; // Default value
//			}
//		}
//
//        try {
//			if (flavorName != null && flavorPrice != null && imagePath != null) {
//				TakeawayModel takeawayModel = new TakeawayModel(takeawayIdInt, 0, 0, 0, null, null);
//				IceCreamModel cartItem = new IceCreamModel(flavorName, Integer.parseInt(flavorPrice), flavorType, flavorDesc, flavorAvailability);
//				boolean itemExists = false;
//				for (IceCreamModel item : cart) {
//					if (item.geticeCream_Name().equals(flavorName)) {
//						item.setQuantity(item.getQuantity() + 1);
//						itemExists = true;
//						break;
//					}
//				}
//				if (!itemExists) {
//					cartItem.setQuantity(1);
//					cartItem.setTakeaway(takeawayModel);
//					cart.add(cartItem);
//				}
//			}
//
//			int cartSize = 0;
//			for (IceCreamModel item : cart) {
//				cartSize += item.getQuantity();
//			}
//			response.getWriter().write(String.valueOf(cartSize));
//		} catch (Exception e) {
//			e.printStackTrace();
//			response.getWriter().write("Error adding item to cart: " + e.getMessage());
//		}
//    }
//
//    protected void removeFromCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        HttpSession session = request.getSession();
//        List<IceCreamModel> cart = (List<IceCreamModel>) session.getAttribute("cart");
//        if (cart == null) {
//            cart = new ArrayList<>();
//            session.setAttribute("cart", cart);
//        }
//
//        String itemName = request.getParameter("itemName");
//        // Find the cart item to remove
//        for (int i = 0; i < cart.size(); i++) {
//            if (cart.get(i).geticeCream_Name().equals(itemName)) {
//                if (cart.get(i).getQuantity() > 1) {
//                    cart.get(i).setQuantity(cart.get(i).getQuantity() - 1);
//                } else {
//                    cart.remove(i);
//					i--; // Decrement i to account for the shifted elements
//                }
//                break;
//            }
//        }
//        int cartSize = 0;
//        for (IceCreamModel item : cart) {
//            cartSize += item.getQuantity();
//        }
//        response.getWriter().write(String.valueOf(cartSize));
//    }
//
//	protected void confirmPickupOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String pickupLocation = request.getParameter("pickupLocation");
//		String pickupTimeStr = request.getParameter("pickupTime");
//
//		// Parse the pickup time string to LocalDateTime
//		LocalDateTime pickupTime = null;
//		try {
//			DateTimeFormatter formatter = DateTimeFormatter.ISO_LOCAL_DATE_TIME;
//			pickupTime = LocalDateTime.parse(pickupTimeStr, formatter);
//		} catch (Exception e) {
//			e.printStackTrace();
//			// Handle the exception, e.g., log an error or display an error message to the user
//			response.getWriter().write("Error parsing pickup time. Please use the format yyyy-MM-ddTHH:mm:ss");
//			return;
//		}
//
//		// Print the data to the console (replace with database storage logic)
//		System.out.println("Pickup Location: " + pickupLocation);
//		System.out.println("Pickup Time: " + pickupTime);
//
//		takeawayService.saveTakeawayDetails(pickupLocation, pickupTime.toString());
//
//		// Redirect the user to a confirmation page or display a success message
//		response.getWriter().write("Pickup order confirmed!");
//	}
//}
