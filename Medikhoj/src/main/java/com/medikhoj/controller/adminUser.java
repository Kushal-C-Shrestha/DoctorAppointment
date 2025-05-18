package com.medikhoj.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.medikhoj.model.UserModel;
import com.medikhoj.service.UserService;

/**
 * Servlet implementation class adminUser
 */
@WebServlet(asyncSupported = true,urlPatterns = "/adminUser")
public class adminUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UserService userService=new UserService();
		
		List<UserModel> users=userService.getAllUsers();
		
		if (users==null) {
			request.setAttribute("error", "Database is down. Please try again in a few minutes.");
		}
		request.setAttribute("userList", users);
		request.getRequestDispatcher("WEB-INF/pages/admin/adminUser.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
