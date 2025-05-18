package com.medikhoj.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import jakarta.servlet.annotation.MultipartConfig;

import java.io.IOException;
import java.util.Map;

import com.medikhoj.model.DoctorModel;
import com.medikhoj.model.UserModel;
import com.medikhoj.service.RegisterService;
import com.medikhoj.util.ImageUtil;

/**
 * Servlet implementation class loginController
 */
@WebServlet(asyncSupported = true, urlPatterns={"/register"})
@MultipartConfig
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
		System.out.println("Entered post ");
		RegisterService registerService=new RegisterService();
		ImageUtil imageUtil=new ImageUtil();
		
		//Validate the form. If something is wrong display the message accordingly
		Map<String,String> errorMap=registerService.validateRegistrationForm(request);
		if (!errorMap.isEmpty()) {
			request.setAttribute("errorMap", errorMap);
			request.getRequestDispatcher("WEB-INF/pages/register.jsp").forward(request, response);
			return;
		}
		
		//Checking if the user already exists in the system.
		Boolean isExists=registerService.isUserExists(request);
		if (isExists==null) {
			request.setAttribute("error", "Database is down. Please try again in a few minutes.");
			request.getRequestDispatcher("WEB-INF/pages/register.jsp").forward(request, response);
		}
		
		if (isExists) {
			request.setAttribute("error", "The user already exists. Enter a new email or phone number.");
			request.getRequestDispatcher("WEB-INF/pages/register.jsp").forward(request, response);
			System.out.print("User already exists");
			return;
		}
		
		//Uploading the users image into the server
		Part userProfile=request.getPart("profile-pic");
		String rootPath=getServletContext().getRealPath("resources/images");
		String imageUrl=imageUtil.uploadImage(userProfile, rootPath, "uploads");
		
		if (imageUrl==null) {
			return;
		}
		
		//Creating the model after all validations are checked.
		UserModel user=registerService.createUserModel(request,imageUrl);
		
		//Adding the user to the database.
		Boolean userAdded=registerService.addUser(user);
		
		if (!userAdded) {
			return;
		}
		
		

		
		

		if (user.getUser_role().equals("doctor")) {
            DoctorModel doctor=registerService.createDoctorModel(request,user);

            if (doctor!=null) {
                Boolean isAdded=registerService.addDoctor(doctor);
                if (!isAdded) {
                    return;
                }
            }
            return;
        }
		
		//Redirect to the login page after user is added successfully.
		request.getRequestDispatcher("WEB-INF/pages/login.jsp").forward(request, response);
	}
}
