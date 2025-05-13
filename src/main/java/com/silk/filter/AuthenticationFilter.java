package com.silk.filter;

import java.io.IOException;

import com.silk.util.CookiesUtil;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter(asyncSupported = true, urlPatterns = { "/*" })
public class AuthenticationFilter implements Filter {

    private static final String LOGIN = "/login";
    private static final String REGISTER = "/register";
    private static final String HOME = "/home";
    private static final String ROOT = "/";
    private static final String MENU = "/menu";
    private static final String FIND = "/find";
    private static final String ABOUT = "/about";
    private static final String CART = "/cart";
    private static final String UPROFILE = "/userprofile";
    private static final String APROFILE = "/adminprofile";
    private static final String USER = "/userprofile";
    private static final String DASHBOARD = "/dashboard";
    private static final String ORDERS = "/orders";
    private static final String MANAGEMENU = "/managemenu";

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // TODO Auto-generated method stub
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String uri = req.getRequestURI();
        HttpSession session = req.getSession(false);
        boolean isLoggedIn = session != null && session.getAttribute("username") != null;
        String userRole = CookiesUtil.getCookie(req, "role") != null ? CookiesUtil.getCookie(req, "role").getValue() : null;

        System.out.println("Logged in: " + isLoggedIn);
        System.out.println("Role: " + userRole);
        System.out.println("URI: " + uri);

        // Public resources
        if (uri.endsWith(".css") || uri.endsWith(".js") || uri.endsWith(".png") || uri.endsWith(".jpeg") ||
                uri.endsWith(".ttf") || uri.endsWith(".JPG") || uri.endsWith(".jpg")) {
            chain.doFilter(request, response);
            return;
        }

        // Public pages
        if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER) || uri.endsWith(HOME) || uri.endsWith(ROOT)) {
            chain.doFilter(request, response);
            return;
        }

        // Authentication and Authorization Logic
        if (!isLoggedIn || userRole == null) {
            res.sendRedirect(req.getContextPath() + LOGIN);
            return;
        }

        if ("admin".equals(userRole)) {
            if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER)) {
                res.sendRedirect(req.getContextPath() + DASHBOARD);
                return;
            } else if (uri.endsWith(DASHBOARD) || uri.endsWith(ORDERS) || uri.endsWith(MANAGEMENU) || uri.endsWith(APROFILE)) {
                chain.doFilter(request, response);
                return;
            } else {
                res.sendRedirect(req.getContextPath() + DASHBOARD);
                return;
            }
        }

        if ("customer".equals(userRole)) {
            if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER)) {
                res.sendRedirect(req.getContextPath() + HOME);
                return;
            } else if (uri.endsWith(HOME) || uri.endsWith(MENU) || uri.endsWith(FIND) || uri.endsWith(ABOUT)
                    || uri.endsWith(CART) || uri.endsWith(UPROFILE) || uri.endsWith(ROOT)) {
                chain.doFilter(request, response);
                return;
            } else {
                res.sendRedirect(req.getContextPath() + HOME);
                return;
            }
        }

        // If none of the above conditions are met, deny access and redirect to login
        res.sendRedirect(req.getContextPath() + LOGIN);
        return;
    }

    @Override
    public void destroy() {
        // TODO Auto-generated method stub
        Filter.super.destroy();
    }
}