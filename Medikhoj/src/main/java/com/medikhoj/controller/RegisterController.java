package com.medikhoj.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;

import com.medikhoj.model.UserModel;
import com.medikhoj.service.RegisterService;
import com.medikhoj.util.PasswordUtil;
import com.medikhoj.util.ValidationUtil;

/**
 * Servlet implementation class loginController
 */
@WebServlet(asyncSupported = true, urlPatterns={"/register"})
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("WEB-INF/pages/register.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RegisterService registerService=new RegisterService();
		try {
			// Validate and extract student model
			String validationMessage = registerService.validateRegistrationForm(request);
			if (validationMessage != null) {
				//handleError(request, response, validationMessage);
				System.out.println(validationMessage);
				return;
			}
			
			System.out.println("Detials are valid.");
			
			if (registerService.isUserExists(request)) {
				//handleError(request,response,"User already exists");
				System.out.println("User already exists");
				return;
			}
			
			System.out.println("User doesnt exist");
			
			//Creating the user model from the data
			UserModel user=registerService.createUser(request);
			
			//Passing the usermodel to insert into database.
			Boolean isAdded = registerService.addUser(user);

			if (isAdded) {
				response.sendRedirect(request.getContextPath() + "/login");  // or login.html or login route

			}
		} catch (Exception e) {
			//handleError(request, response, "An unexpected error occurred. Please try again later!");
			e.printStackTrace(); // Log the exception
		}
	}
	
	
	

	



}
