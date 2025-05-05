package com.medikhoj.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.medikhoj.util.CookieUtil;
import com.medikhoj.util.SessionUtil;

/**
 * Servlet Filter implementation class authorizationFilter
 */
@WebFilter(asyncSupported = true, urlPatterns = "/*")
public class authorizationFilter extends HttpFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public authorizationFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		 HttpServletRequest req = (HttpServletRequest) request;
		 HttpServletResponse res = (HttpServletResponse) response;
		 String uri = req.getRequestURI();

	        // Allow static resources
		 if (uri.endsWith(".css") || uri.endsWith(".js") || uri.endsWith(".png") || uri.endsWith(".jpg")) {
			 chain.doFilter(request, response);
			 return;
		 }
		 
		 boolean isLoggedIn = SessionUtil.getAttribute(req, "loggedInUser") != null;
	        String userRole = CookieUtil.getCookie(req, "user_role");

	        // Public pages
	        if (uri.endsWith("/login") || uri.endsWith("/register") || uri.endsWith("/home") ||
	            uri.endsWith("/aboutus") || uri.endsWith("/contactus") || uri.endsWith("/reviews") ||
	            uri.endsWith("/doctors") || uri.endsWith("/doctorProfile") || uri.endsWith("/campaigns") ||
	            uri.endsWith("/unauthorized.jsp")) {
	            chain.doFilter(request, response);
	            return;
	        }

	        // Admin access
	        if (uri.endsWith("/dashboard")) {
	            if ("admin".equals(userRole)) {
	                chain.doFilter(request, response);
	            } else {
	                res.sendRedirect(req.getContextPath() + "/unauthorized.jsp");
	            }
	            return;
	        }

	        // User-only pages
	        if (uri.endsWith("/profile") || uri.endsWith("/appointment")) {
	            if (isLoggedIn && "user".equals(userRole)) {
	                chain.doFilter(request, response);
	            } else {
	            	res.sendRedirect(req.getContextPath() + "/unauthorized.jsp");
	            }
	            return;
	        }
	        
	        //doctors only
	        if (uri.endsWith("/doctorDashboard") || uri.endsWith("/addCampaign")){	
	            if (isLoggedIn && "doctor".equals(userRole)) {
	                chain.doFilter(request, response);
	            } else {
	            	res.sendRedirect(req.getContextPath() + "/unauthorized.jsp");
	            }
	            return;
	        }
	        
	        // Block access to any unknown or restricted page
	        if (!isLoggedIn) {
	            res.sendRedirect(req.getContextPath() + "/home");
	        } else {
	            chain.doFilter(request, response);
	        }
	    }

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
