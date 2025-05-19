package com.silk.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.silk.util.CookiesUtil;
import com.silk.util.SessionUtil;

/**
 * Servlet implementation class LogoutController
 */
@WebServlet(asyncSupported = true, urlPatterns = {"/logout"})


public class LogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
    	System.out.println("One");
        // Invalidate the user session if it exists
        if (req.getSession(false) != null) {
            req.getSession().invalidate();
        }

        // Retrieve all cookies and remove the 'Role' cookie if present
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("Role".equals(cookie.getName())) {
                    cookie.setValue("");
                    cookie.setPath(req.getContextPath());
                    cookie.setMaxAge(0); // Set expiration to remove it
                    resp.addCookie(cookie); // Add modified cookie to response
                }
            }
        }

        // Redirect the user to the login page after logout
        resp.sendRedirect(req.getContextPath() + "/login");
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("Twqo");

		CookiesUtil.deleteCookie(request, response, "role");
		SessionUtil.invalidateSession(request);
		response.sendRedirect(request.getContextPath() + "/");
	}

}