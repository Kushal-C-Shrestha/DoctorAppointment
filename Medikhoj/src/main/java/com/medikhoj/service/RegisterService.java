package com.medikhoj.service;

import java.awt.Image;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import org.apache.catalina.User;

import jakarta.servlet.http.Part;


import com.medikhoj.config.DbConfig;
import com.medikhoj.model.DoctorModel;
import com.medikhoj.model.UserModel;
import com.medikhoj.util.ImageUtil;
import com.medikhoj.util.PasswordUtil;
import com.medikhoj.util.ValidationUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;

/**
 * RegisterService handles the registration of new students. It manages database
 * interactions for student registration.
 */
public class RegisterService {

	private Connection dbConn;

	/**
	 * Constructor initializes the database connection.
	 */
	public RegisterService() {
		try {
			this.dbConn = DbConfig.getDbConnection();
		} catch (SQLException | ClassNotFoundException ex) {
			System.err.println("Database connection error: " + ex.getMessage());
			ex.printStackTrace();
		}
	}

	public String validateRegistrationForm(HttpServletRequest request) {
		
		String userName = request.getParameter("fullname");             // User's name
		String userEmail = request.getParameter("email");               // User's email
		String userPhone = request.getParameter("phone");               // User's phone number
		String userDobString=request.getParameter("dob");
		String userGender = request.getParameter("gender");             // User's gender
		String userBloodGroup = request.getParameter("bloodgroup");     // User's blood group
		String userPassword = request.getParameter("password");         // User's password
		String confirmPassword = request.getParameter("confirm_password"); // User's confirm password
		Part userProfile=null;
		
		try {
	        // Retrieve the uploaded image file from the request
	        userProfile = request.getPart("profile-pic");  // This could throw IOException or ServletException
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
		
		if (ValidationUtil.isNullOrEmpty(userPassword)){
			return "Please enter your password";
		}
		
		if (ValidationUtil.isNullOrEmpty(confirmPassword)) {
			return "Please re-enter your password";
		}
		
		if(!ValidationUtil.isValidPassword(userPassword)) {
			return "Your password must be 8-25 characters and have atleast one uppercase, one lowecase, one letter and one symbol.";
		}
		
		if (!ValidationUtil.doPasswordsMatch(userPassword,confirmPassword)) {
			return "The passwords do not match.Please enter the same password.";
		}
		
		if (!ValidationUtil.isValidImageType(userProfile)) {
			return "The image file should be png, jpg or jpeg.";
		}
		
		if (!ValidationUtil.isValidImageSize(userProfile)) {
			return "The image file should be less than 2 MB.";
		}
		
		return null;
	}
	
	public Boolean isUserExists(HttpServletRequest request) {
	    String user_email = request.getParameter("email");
	    String user_phone=request.getParameter("phone");
	    
	    String query = "SELECT 1 FROM users WHERE user_email = ? OR user_phone=?";
	    if (dbConn == null) {
			System.err.println("Database connection is not available.");
			return null;
		}
	    
	    try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
	        
	        stmt.setString(1, user_email);
	        stmt.setString(2, user_phone);
	        ResultSet rs = stmt.executeQuery();
	        
	        return rs.next(); // returns true if user exists
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false; // or consider throwing an exception if needed
	    }
	}
	
	public UserModel createUserModel(HttpServletRequest request, String userProfile) {
		String userName = request.getParameter("fullname");             // User's name
		String userEmail = request.getParameter("email");               // User's email
		String userPhone = request.getParameter("phone");               // User's phone number
		LocalDate userDob = LocalDate.parse(request.getParameter("dob"));             // User's date of birth (String format)
		String userGender = request.getParameter("gender");             // User's gender
		String userBloodGroup = request.getParameter("bloodgroup");     // User's blood group
		String userPassword = request.getParameter("password");         // User's password
		String userRole=request.getParameter("role");
		
		//Encrypting the password.
		String encryptedPassword=PasswordUtil.encrypt(userEmail, userPassword);
		
		//Creating the user model with required attributes.
		UserModel user=new UserModel();
		user.setUser_name(userName);
		user.setUser_email(userEmail);
		user.setUser_phone(userPhone);
		user.setUser_password(encryptedPassword);
		user.setUser_role(userRole);
		user.setUser_gender(userGender);
		user.setUser_bloodgroup(userBloodGroup);
		user.setUser_dob(userDob);
		user.setUser_profile(userProfile);
		return user;
	}
	
	public Boolean addUser(UserModel newUser) {
		if (dbConn == null) {
			System.err.println("Database connection is not available.");
			return false;
		}
		
		String insertQuery = "INSERT INTO users (user_name, user_email, user_phone, user_password, user_dob, user_gender, user_bloodgroup, user_role,user_profile) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?,?)";

		try (PreparedStatement stmt = dbConn.prepareStatement(insertQuery)) {

			stmt.setString(1, newUser.getUser_name()); // user_name
	        stmt.setString(2, newUser.getUser_email()); // user_email
	        stmt.setString(3, newUser.getUser_phone()); // user_phone
	        stmt.setString(4, newUser.getUser_password()); // user_password (encrypted)
	        stmt.setDate(5, Date.valueOf(newUser.getUser_dob())); // user_dob
	        stmt.setString(6, newUser.getUser_gender()); // user_gender
	        stmt.setString(7, newUser.getUser_bloodgroup()); // user_bloodgroup
	        stmt.setString(8, newUser.getUser_role()); // user_role
	        stmt.setString(9, newUser.getUser_profile());

			return stmt.executeUpdate() > 0;
		} catch (SQLException e) {
			System.err.println("Error during user registration: " + e.getMessage());
			e.printStackTrace();
			return false;
		}
	}
	
	
	public DoctorModel createDoctorModel(HttpServletRequest request, UserModel user ) {
		String doctorSpecialization = request.getParameter("specialization");             // Doctors specialization
		String doctorQualification = request.getParameter("qualification");               // Doctors qualification
		int doctorExperience = Integer.parseInt(request.getParameter("experience"));      // Doctors experience
		String doctorAbout=request.getParameter("about");
		
		DoctorModel doctor=new DoctorModel();
		doctor.setDoctor_specialization(doctorSpecialization);
		doctor.setDoctor_qualification(doctorQualification);
		doctor.setDoctor_experience(doctorExperience);
		doctor.setDoctor_about(doctorAbout);
		
		if (dbConn == null) {
			System.err.println("Database connection is not available.");
			return null;
		}
		
		String selectQuery = "SELECT user_id FROM users WHERE user_email = ?" ;

		try (PreparedStatement stmt = dbConn.prepareStatement(selectQuery)) {
			stmt.setInt(1, user.getUser_id()); 
			ResultSet rs=stmt.executeQuery();
			
			while(rs.next()){				
				int doctorId=rs.getInt("user_id");
				doctor.setDoctor_id(doctorId);
			}
			return doctor;
		} catch (SQLException e) {
			System.err.println("Error during doctor registration: " + e.getMessage());
			e.printStackTrace();
			return null;
		}
	}
	
	public Boolean addDoctor(DoctorModel doctor) {
		if (dbConn == null) {
			System.err.println("Database connection is not available.");
			return false;
		}
		
		String insertQuery = "INSERT INTO doctors (doctor_id, doctor_specialization, doctor_qualification, doctor_experience ,doctor_desc) "
				+ "VALUES (?, ?, ?, ?, ?)"; ;

		try (PreparedStatement stmt = dbConn.prepareStatement(insertQuery)) {
			stmt.setInt(1, doctor.getDoctor_id());
			stmt.setString(2, doctor.getDoctor_specialization());
			return stmt.executeUpdate() > 0;
		} catch (SQLException e) {
			System.err.println("Error during user registration: " + e.getMessage());
			e.printStackTrace();
			return false;
		}
	}

}