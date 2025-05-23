package com.medikhoj.controller;


import com.medikhoj.service.UpdateService;
import com.medikhoj.util.ImageUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.net.http.HttpConnectTimeoutException;
import java.util.Map;

import javax.swing.text.html.HTML;
import java.util.Map;


import com.medikhoj.model.UserModel;

/**
 * Servlet implementation class updateProfileController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/updateProfile" })
@MultipartConfig
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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		
		if (action.equals("pw")) {
			handlePasswordChange(request, response);
			return;
		}
		handleProfileUpdate(request, response);
		return;
	}
	
	public void handlePasswordChange(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

		
		HttpSession session=request.getSession(false);
		
	    UpdateService updateService = new UpdateService();
		Map<String,String> errorMap= updateService.validateUpdatePassword(request);
		if (!errorMap.isEmpty()) {
			System.out.println("Error occured");
			request.setAttribute("user", (UserModel)session.getAttribute("loggedInUser"));
			request.setAttribute("errorMap", errorMap);
			request.setAttribute("section", "details");
			request.setAttribute("current_password", request.getParameter("currentPassword"));
			request.setAttribute("new_password", request.getParameter("newPassword"));
			request.setAttribute("subSection", "changePasswordSection");
			request.getRequestDispatcher("WEB-INF/pages/myProfile.jsp").forward(request, response);
			return;
		}
		
		Boolean isUpdated=updateService.changePassword(request);
		if (!isUpdated) {
			session.setAttribute("error","Your password could not be updated. Please try again later.");
			session.setAttribute("section", "details");
			session.setAttribute("subSection", "changePasswordSection");
			response.sendRedirect("profile");
		}
		session.setAttribute("showPopup", "true");
		session.setAttribute("popupTitle","Success");
        session.setAttribute("popupMessage","Your password has been successfully changed.");
		
		
		session.setAttribute("section", "details");
		session.setAttribute("subSection", "viewDetailsSection");
		response.sendRedirect("profile");
		return;
	}
	
	public void handleProfileUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		HttpSession session=request.getSession(false);
		UserModel user=(UserModel)session.getAttribute("loggedInUser");
	    UpdateService updateService = new UpdateService();
		Map<String,String> errorMap= updateService.validateUpdateForm(user.getUser_id(),request);

		ImageUtil imageUtil = new ImageUtil();
		
		if (!errorMap.isEmpty()) {
			request.setAttribute("user", (UserModel)session.getAttribute("loggedInUser"));
			request.setAttribute("errorMap", errorMap);
			request.setAttribute("section", "details");
			request.setAttribute("subSection", "editProfileSection");
			request.getRequestDispatcher("WEB-INF/pages/myProfile.jsp").forward(request, response);
			return;
		}
	 
	    // Upload new profile image (optional)
	    Part userProfile = request.getPart("profile-pic");
	    String imageUrl = null;

	    if (userProfile != null && userProfile.getSize() > 0) {
	    	System.out.println("user profile is not null");
	        String rootPath = getServletContext().getRealPath("resources/images");
	        imageUrl = imageUtil.uploadImage(userProfile, rootPath, "uploads");

	        if (imageUrl == null) {
	            System.out.println("Image upload failed");
	            return;
	        }
	    }else {
	    	imageUrl=user.getUser_profile();
	    }	
	    

	    // 4. Create updated UserModel (pass existing image if not changed)
	    UserModel updatedUser = updateService.createUpdatedUserModel(request, imageUrl,user); 
	    if (updatedUser==null) {
	    	System.out.println("User creation failed");
	    	return;
	    }
	    // 5. Update the user in database
	    Boolean isUpdated = updateService.updateUser(updatedUser);
	    if (!isUpdated) {
	        System.out.println("User update failed");
	        return;
	    }
	    session.setAttribute("showPopup","true");
		session.setAttribute("popupTitle", "Success");
		session.setAttribute("popupMessage", "Your profile has been updated successfully.");
	    session.setAttribute("section", "details");
	    session.setAttribute("loggedInUser", updatedUser);

	    System.out.println("User updated successfully");
	    response.sendRedirect("profile");
	}
	
}
