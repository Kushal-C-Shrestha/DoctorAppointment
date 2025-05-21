package com.medikhoj.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;

import com.medikhoj.config.DbConfig;
import com.medikhoj.model.UserModel;
import com.medikhoj.util.PasswordUtil;
import com.medikhoj.util.ValidationUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

public class UpdateService {
	private Connection dbConn;
	private Boolean isConnectionError=false;
	
	public UpdateService() {
		try {
			//Getting the connection from config file.
			
			this.dbConn=DbConfig.getDbConnection();
		} catch (SQLException | ClassNotFoundException ex) {
			// TODO: handle exception
			System.err.println("Database connection error: " + ex.getMessage());
			ex.printStackTrace();
			isConnectionError=true;
		}
	}
	
public Map<String,String> validateUpdateForm(HttpServletRequest request) {
		String userName = request.getParameter("fullName");             // User's name
		String userEmail = request.getParameter("email");               // User's email
		String userPhone = request.getParameter("phone");               // User's phone number
		String userDobString=request.getParameter("dob");
		String userGender = request.getParameter("gender");             // User's gender
		String userBloodGroup = request.getParameter("bloodGroup");     // User's blood group
		Part userProfile=null;
		
		Map<String,String> errorMap=new HashMap<String, String>();
		
		try {
	        // Retrieve the uploaded image file from the request
	        userProfile = request.getPart("profile-pic");  // This could throw IOException or ServletException
	    } catch (IOException e) {
	    	System.out.println("Error in image fetching.");
	    	e.printStackTrace();
	        return errorMap ; // Handle IOException
	    } catch (ServletException e) {
	    	e.printStackTrace();
	    	return errorMap;
	    }
		
		// You can handle profile picture later (e.g., save file

		
		if (ValidationUtil.isNullOrEmpty(userName)) {
			errorMap.put("fullname", "Please enter your full name.");
			return errorMap;
		}
		
		if (!ValidationUtil.isValidEmail(userEmail)){
			errorMap.put("email", "Please enter a valid email address.");
			return errorMap;
		}
			
		
		if (ValidationUtil.isNullOrEmpty(userPhone)) {
			errorMap.put("phone", "Please enter a valid phone number.");
			return errorMap;
		}
		
		if (ValidationUtil.isNullOrEmpty(userDobString)) {
			errorMap.put("dob", "Please enter your date of birth.");
			return errorMap;
		}
		
		if (ValidationUtil.isNullOrEmpty(userGender) ){
			errorMap.put("phone", "Please enter your gender.");
			return errorMap;
		}
		
		if (ValidationUtil.isNullOrEmpty(userBloodGroup)) {
			errorMap.put("bloodgroup", "Please enter your bloodgroup.");
			return errorMap;
		}
		
		
		if (!ValidationUtil.isValidImageType(userProfile)) {
			errorMap.put("image", "Please upload file in jpg, jpeg or png format.");
			return errorMap;
		}
		
		if (!ValidationUtil.isValidImageSize(userProfile)) {
			errorMap.put("image", "Please upload a file less than 2 MB.");
			return errorMap;
		}
		return errorMap;
	}
		
		public UserModel createUpdatedUserModel(HttpServletRequest request, String userProfile, UserModel user) {
		    String userName = request.getParameter("fullName");
		    String userEmail = request.getParameter("email");
		    String userPhone = request.getParameter("phone");
		    LocalDate userDob = LocalDate.parse(request.getParameter("dob"));
		    String userGender = request.getParameter("gender");
		    String userBloodGroup = request.getParameter("bloodGroup");
		    int userId = user.getUser_id();
		
		    UserModel newUser = new UserModel();
		    newUser.setUser_id(userId);
		    newUser.setUser_name(userName);
		    newUser.setUser_email(userEmail);
		    newUser.setUser_phone(userPhone);
		    newUser.setUser_gender(userGender);
		    newUser.setUser_bloodgroup(userBloodGroup);
		    newUser.setUser_dob(userDob);
		    newUser.setUser_role(user.getUser_role());
		    newUser.setUser_password(user.getUser_password());
		    newUser.setUser_profile(userProfile);
		
		    return newUser;
		}

	
	
	public Boolean updateUser(UserModel user) {
		
	    String sql = "UPDATE users SET user_name = ?, user_email = ?, user_phone = ?, "
	               + "user_dob = ?, user_gender = ?, user_bloodgroup = ?, user_profile = ? "
	               + "WHERE user_id = ?";
	    try (PreparedStatement stmt = dbConn.prepareStatement(sql)) {
	        stmt.setString(1, user.getUser_name());
	        stmt.setString(2, user.getUser_email());
	        stmt.setString(3, user.getUser_phone());
	        stmt.setDate(4, Date.valueOf(user.getUser_dob()));
	        stmt.setString(5, user.getUser_gender());
	        stmt.setString(6, user.getUser_bloodgroup());
	        stmt.setString(7, user.getUser_profile()); // use existing or new image URL
	        stmt.setInt(8, user.getUser_id());


	        return stmt.executeUpdate() > 0;

	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	
	public Boolean changePassword(HttpServletRequest request) {
		HttpSession session=request.getSession(false);
		UserModel user=null;
		if (session!=null) {
			user=(UserModel)session.getAttribute("loggedInUser");
		}
		
		String newPassword=request.getParameter("newPassword");
		String encryptedPassword=PasswordUtil.encrypt(user.getUser_email(), newPassword);
		
		String query="Update users SET user_password =? WHERE user_id= ? ";
		
		try(PreparedStatement stmt=dbConn.prepareStatement(query)) {
			stmt.setString(1, encryptedPassword);
			stmt.setInt(2, user.getUser_id());
			return stmt.executeUpdate() >0;
		} catch (Exception e) {
			return false;
		}
	}
	
	public Map<String,String> validateUpdatePassword(HttpServletRequest request) {
		HttpSession session=request.getSession(false);
		UserModel user=null;
		if (session!=null) {
			user=(UserModel)session.getAttribute("loggedInUser");
		}
		
		
		Map<String,String> errorMap=new HashMap();
		String currentPassword=request.getParameter("currentPassword");
		String newPassword=request.getParameter("newPassword");
		
		
		if (!PasswordUtil.decrypt(user.getUser_password(),user.getUser_email()).equals(currentPassword)) {
			errorMap.put("currentPassword", "The current password does not match.");
			return errorMap;
		}
		
		if (!ValidationUtil.isValidPassword(newPassword)) {
			errorMap.put("newPassword", "New password must be at least 8 characters long and include a symbol, a number, and a capital letter.");
			return errorMap;
		}
		
		return errorMap;
	}

	public Boolean updateProfile(HttpServletRequest request) {
		HttpSession session=request.getSession(false);
		UserModel user=null;
		if (session!=null) {
			user=(UserModel)session.getAttribute("loggedInUser");
		}
		return false;
	}
}

