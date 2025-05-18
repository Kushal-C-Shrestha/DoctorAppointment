	package com.medikhoj.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.medikhoj.util.CookieUtil;
import com.medikhoj.util.SessionUtil;

/**
 * Servlet implementation class logoutController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/logout"})
public class logoutController extends HttpServlet {
	
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public logoutController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		HttpSession session = request.getSession(false); // don't create if it doesn't exist
//		if (session != null) {
//		    session.invalidate(); // Ends the session
//		}
//		Cookie[] cookies = request.getCookies();
//		if (cookies != null) {
//		    for (Cookie cookie : cookies) {
//		        cookie.setMaxAge(0);  // Mark it for deletion
//		        cookie.setPath("/");  // Ensure path matches original
//		        response.addCookie(cookie);
//		    }
//		}
//		response.sendRedirect("home");
		CookieUtil.deleteCookie(response, "role");
		SessionUtil.invalidateSession(request);
		response.sendRedirect(request.getContextPath() + "/login");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
