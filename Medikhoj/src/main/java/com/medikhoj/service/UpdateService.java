package com.medikhoj.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;

import com.medikhoj.config.DbConfig;
import com.medikhoj.model.UserModel;
import com.medikhoj.util.PasswordUtil;
import com.medikhoj.util.ValidationUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
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
	
public String validateUpdateForm(HttpServletRequest request) {
		
		String userName = request.getParameter("user_name");             // User's name
		String userEmail = request.getParameter("user_email");               // User's email
		String userPhone = request.getParameter("user_phone");               // User's phone number
		String userDobString=request.getParameter("user_dob");
		String userGender = request.getParameter("user_gender");             // User's gender
		String userBloodGroup = request.getParameter("user_bloodgroup");     // User's blood group
		Part userProfile=null;
		
		try {
	        // Retrieve the uploaded image file from the request
	        userProfile = request.getPart("user_profile");  // This could throw IOException or ServletException
	    } catch (IOException e) {
	        return "Error reading the image file: " + e.getMessage();  // Handle IOException
	    } catch (ServletException e) {
	        return "Error with the uploaded file: " + e.getMessage();  // Handle ServletException
	    }
		
		// You can handle profile picture later (e.g., save file

		
		if (ValidationUtil.isNullOrEmpty(userName)) {
			return "Please enter your full name.";
		}
		
		if (!ValidationUtil.isValidEmail(userEmail)){
			return "Please enter a valid email address.";
		}
		
		
		
		if (ValidationUtil.isNullOrEmpty(userPhone)) {
			return "Please enter your phone";
		}
		
		if (ValidationUtil.isNullOrEmpty(userDobString)) {
			return "Please enter your date of birth";
		}
		
		
		if (ValidationUtil.isNullOrEmpty(userGender) ){
			return "Please enter your gender";
		}
		
		if (ValidationUtil.isNullOrEmpty(userBloodGroup)) {
			return "Please enter your bloodgrp";
		}
		
		
		if (!ValidationUtil.isValidImageType(userProfile)) {
			return "The image file should be png, jpg or jpeg.";
		}
		
		if (!ValidationUtil.isValidImageSize(userProfile)) {
			return "The image file should be less than 2 MB.";
		}
		
		return null;
	}
		
	public UserModel createUpdatedUserModel(HttpServletRequest request, String userProfile) {
		String userName = request.getParameter("fullname");             // User's name
		String userEmail = request.getParameter("email");               // User's email
		String userPhone = request.getParameter("phone");               // User's phone number
		LocalDate userDob = LocalDate.parse(request.getParameter("dob"));             // User's date of birth (String format)
		String userGender = request.getParameter("gender");             // User's gender
		String userBloodGroup = request.getParameter("bloodgroup");     // User's blood group
		String userRole=request.getParameter("role");
		
		//Encrypting the password.
		
		//Creating the user model with required attributes.
		UserModel user=new UserModel();
		user.setUser_name(userName);
		user.setUser_email(userEmail);
		user.setUser_phone(userPhone);
		user.setUser_role(userRole);
		user.setUser_gender(userGender);
		user.setUser_bloodgroup(userBloodGroup);
		user.setUser_dob(userDob);
		user.setUser_profile(userProfile);
		return user;
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

	        int rows = stmt.executeUpdate();
	        return rows > 0;

	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	}

}
