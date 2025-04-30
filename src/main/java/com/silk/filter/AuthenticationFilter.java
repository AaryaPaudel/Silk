package com.silk.filter;

import java.io.IOException;

import com.silk.util.SessionUtil;
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
	private static final String USER = "/user";

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// Cast the request and response to HttpServletRequest and HttpServletResponse
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		// Get the requested URI
		String uri = req.getRequestURI();

		if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER) || uri.endsWith(".css") || 
				uri.endsWith(HOME) || uri.endsWith(ROOT) || uri.endsWith(".ttf") || uri.endsWith(".png") || 
				uri.endsWith(".jpeg")||uri.endsWith(".jpg") ||uri.endsWith(".jsp")) {
			chain.doFilter(request, response);
			return;
		}
		
		// Get the session and check if user is logged in
		boolean isLoggedIn = SessionUtil.getAttribute(req, "username") != null;
		String userRole = CookiesUtil.getCookie(req, "role") != null ? CookiesUtil.getCookie(req, "role").getValue()
				: null;
		System.out.println(1);

		if ("admin".equals(userRole)) {
			// Admin is logged in
			if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER)) {
				res.sendRedirect(req.getContextPath() + HOME);
				System.out.println(2);
			} else if (uri.endsWith(HOME) || uri.endsWith(ROOT) || uri.endsWith(MENU) || uri.endsWith(FIND) || uri.endsWith(ABOUT)
					 || uri.endsWith(CART) || uri.endsWith(USER)) {
				chain.doFilter(request, response);
			} else {
				System.out.println(3);
				res.sendRedirect(req.getContextPath() + HOME);
			}
		} else if ("customer".equals(userRole)) {
			System.out.println(4);
			// User is logged in
			if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER)) {
				res.sendRedirect(req.getContextPath() + HOME);
				System.out.println(5);
			} else if (uri.endsWith(HOME) || uri.endsWith(ROOT) || uri.endsWith(MENU) || uri.endsWith(FIND) || uri.endsWith(ABOUT)
					 || uri.endsWith(CART) || uri.endsWith(USER)) {
				System.out.println(6);
				chain.doFilter(request, response);
			} else {
				res.sendRedirect(req.getContextPath() + HOME);
			}
		} else {
			// Not logged in
			if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER) || uri.endsWith(HOME) || uri.endsWith(ROOT)) {
				chain.doFilter(request, response);
			} else {
				res.sendRedirect(req.getContextPath() + LOGIN);
			}
		}
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		Filter.super.destroy();
	}
}