package com.medikhoj.controller;


import com.medikhoj.service.UpdateService;
import com.medikhoj.util.ImageUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.IOException;

import com.medikhoj.model.UserModel;

/**
 * Servlet implementation class updateProfileController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/updateProfile" })
public class updateProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateProfileController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session =request.getSession(false);
		UserModel user=(UserModel) session.getAttribute("loggedInUser");
		request.setAttribute("user", user);
		request.getRequestDispatcher("WEB-INF/pages/updateProfileForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    System.out.println("Entered update post");

	    UpdateService updateService = new UpdateService();
	    ImageUtil imageUtil = new ImageUtil();

	    // 1. Validate the form
	    String validationMessage = updateService.validateUpdateForm(request); // You need to create this method
	    if (validationMessage != null) {
	        System.out.println("Validation Error: " + validationMessage);
	        return;
	    }

	 
	    // Upload new profile image (optional)
	    Part userProfile = request.getPart("user_profile");
	    String imageUrl = null;

	    if (userProfile != null && userProfile.getSize() > 0) {
	        String rootPath = getServletContext().getRealPath("resources/images");
	        imageUrl = imageUtil.uploadImage(userProfile, rootPath, "uploads");

	        if (imageUrl == null) {
	            System.out.println("Image upload failed");
	            return;
	        }
	    }else {
	    	imageUrl=request.getParameter("old_user_profile");
	    }

	    // 4. Create updated UserModel (pass existing image if not changed)
	    UserModel updatedUser = updateService.createUpdatedUserModel(request, imageUrl); // You need to write this

	    // 5. Update the user in database
	    Boolean isUpdated = updateService.updateUser(updatedUser);
	    if (!isUpdated) {
	        System.out.println("User update failed");
	        return;
	    }

	    System.out.println("User updated successfully");
	    response.sendRedirect("WEB-INF/pages/myProfile.jsp"); // Or wherever you want to go after update
	}


}
