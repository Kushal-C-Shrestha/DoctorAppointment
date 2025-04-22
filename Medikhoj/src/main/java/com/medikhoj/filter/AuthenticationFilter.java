package com.medikhoj.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.medikhoj.util.CookieUtil;
import com.medikhoj.util.SessionUtil;

@WebFilter(asyncSupported = true, urlPatterns = "/*")
public class AuthenticationFilter implements Filter {

    // Define URLs
    private static final String LOGIN = "/login";
    private static final String REGISTER = "/register";
    private static final String HOME = "/home";
    private static final String ROOT = "/";
    private static final String DASHBOARD = "/dashboard";
    private static final String DOCTORS = "/doctors";
    private static final String PROFILE = "/profile";
    private static final String CAMPAIGNS = "/campaigns";

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization logic, if required
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String uri = req.getRequestURI();
        
        // Allow access to resources such as images, styles, etc.
        if (uri.endsWith(".png") || uri.endsWith(".jpg") || uri.endsWith(".css")) {
            chain.doFilter(request, response);
            return;
        }

        // Retrieve the logged-in user and role
        boolean isLoggedIn = SessionUtil.getAttribute(req, "loggedInUser") != null;
        String userRoleStr = CookieUtil.getCookie(req, "user_role");
        int userRole = (userRoleStr != null) ? Integer.parseInt(userRoleStr) : -1;

        // Admin role is 3, user role is 1
        if (userRole == 3) {
            // Admin is logged in
            if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER)) {
                res.sendRedirect(req.getContextPath() + DASHBOARD);  // Redirect admin to dashboard if trying to access login or register
            } else if (uri.endsWith(DASHBOARD) || uri.endsWith(PROFILE) || uri.endsWith(CAMPAIGNS)) {
                chain.doFilter(request, response);  // Allow access to admin pages (dashboard, profile, campaigns)
            } else {
                res.sendRedirect(req.getContextPath() + DASHBOARD);  // Redirect all other requests to dashboard
            }
        } else if (userRole == 1) {
            // User is logged in
            if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER)) {
                res.sendRedirect(req.getContextPath() + HOME);  // Redirect user to home if trying to access login or register
            } else if (uri.endsWith(HOME) || uri.endsWith(ROOT) || uri.endsWith(DOCTORS)) {
                chain.doFilter(request, response);  // Allow access to home and doctors for user
            } else if (uri.endsWith(DASHBOARD) || uri.endsWith(PROFILE) || uri.endsWith(CAMPAIGNS)) {
                res.sendRedirect(req.getContextPath() + HOME);  // Redirect to home if user tries to access admin-related pages
            } else {
                res.sendRedirect(req.getContextPath() + HOME);  // Redirect all other requests to home
            }
        } else {
            // Not logged in (no role or session)
            if (uri.endsWith(LOGIN) || uri.endsWith(REGISTER) || uri.endsWith(HOME) || uri.endsWith(ROOT)) {
                chain.doFilter(request, response);  // Allow access to login, register, home, and root for guests
            } else {
                res.sendRedirect(req.getContextPath() + LOGIN);  // Redirect to login if not logged in and trying to access other pages
            }
        }
    }

    @Override
    public void destroy() {
        // Cleanup logic, if required
    }
}
