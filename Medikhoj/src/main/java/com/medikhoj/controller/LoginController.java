package com.medikhoj.controller;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.medikhoj.model.UserModel;
import com.medikhoj.service.LoginService;
import com.medikhoj.util.CookieUtil;
import com.medikhoj.util.SessionUtil;

/**
 * Servlet implementation class LoginController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/login" })
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("WEB-INF/pages/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");

	    LoginService loginService = new LoginService();

	    try {
	        UserModel user = loginService.authenticateUser(email, password);

	        if (user != null) {
	            // Set session attribute
	        	HttpSession session = request.getSession();
	            session.setMaxInactiveInterval(1800); // 30 minutes
	            session.setAttribute("loggedInUser", user);
	            System.out.println("Session ID: " + session.getId());
	        	System.out.println("User in session: " + session.getAttribute("loggedInUser"));

	            // Add a cookie valid for 30 minutes (1800 seconds)
	            CookieUtil.addCookie(response, "user_role", String.valueOf(user.getUser_role()),-1);
 
	            // Role-based redirect
	            String user_role = user.getUser_role();
	            System.out.println(user_role);
	            if (user_role.equals("admin")) {
	                // Admin
	                //response.sendRedirect(request.getContextPath() + "/dashboard");
	            	response.sendRedirect(request.getContextPath() + "/dashboard");
	            } else if (user_role.equals("user")) {
	                // User
	                response.sendRedirect(request.getContextPath() + "/home");
	            } else if (user_role.equals("doctor")) {
	                // User
	                response.sendRedirect(request.getContextPath() + "/doctorDashboard");
	            } else {
	                // Unknown role, redirect to login with error
	                request.setAttribute("error", "Unauthorized role.");
	                request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
	            }

	        } else {
	        	System.out.println("Error login");
	            request.setAttribute("error", "Invalid email or password");
	            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        request.setAttribute("error", "Something went wrong.");
	        request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
	    }
	}

}
