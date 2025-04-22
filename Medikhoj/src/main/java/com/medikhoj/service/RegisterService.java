package com.medikhoj.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import com.medikhoj.config.DbConfig;
import com.medikhoj.model.UserModel;
import com.medikhoj.util.PasswordUtil;
import com.medikhoj.util.ValidationUtil;

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
		String user_name = request.getParameter("fullname");
		String user_password=request.getParameter("password");
		//LocalDate user_dob = LocalDate.parse(request.getParameter("dob"));
		String user_phone = request.getParameter("phone");
		String user_email = request.getParameter("email");
		String user_gender = request.getParameter("gender");
		String user_bloodgroup = request.getParameter("bloodgroup");
		String confirm_password=request.getParameter("confirm_password");
		
		
		if (!ValidationUtil.isValidEmail(user_email)) {
			return "Please enter a valid email";
		}
		
		if (ValidationUtil.isNullOrEmpty(user_name)) {
			return "Please enter your username";
		}
		
		if (ValidationUtil.isNullOrEmpty(user_password)) {
			return "Please enter your password";
		}
		
		if (ValidationUtil.isNullOrEmpty(user_phone)) {
			return "Please enter your phone";
		}
		
		if (ValidationUtil.isNullOrEmpty(user_gender)) {
			return "Please enter your gender";
		}
		
		if (ValidationUtil.isNullOrEmpty(user_bloodgroup)) {
			return "Please enter your bloodgrp";
		}
		
		if (ValidationUtil.isNullOrEmpty(confirm_password)) {
			return "Please enter your password";
		}
		
		if (!ValidationUtil.doPasswordsMatch(user_password,confirm_password)) {
			return "The passwords do not match.Please enter the same password";
		}
		
		return null;
	}
	
	public Boolean isUserExists(HttpServletRequest request) {
	    String user_email = request.getParameter("email");
	    
	    String query = "SELECT 1 FROM users WHERE user_email = ?";
	    if (dbConn == null) {
			System.err.println("Database connection is not available.");
			return null;
		}
	    
	    try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
	        
	        stmt.setString(1, user_email);
	        ResultSet rs = stmt.executeQuery();
	        
	        return rs.next(); // returns true if user exists
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false; // or consider throwing an exception if needed
	    }
	}
	
	public UserModel createUser(HttpServletRequest request) throws Exception {
		UserModel newUser=new UserModel();
		

		newUser.setUser_name(request.getParameter("fullname"));
		newUser.setUser_password(PasswordUtil.hashPassword(request.getParameter("password")));
		newUser.setUser_dob(LocalDate.parse(request.getParameter("dob")));
		newUser.setUser_phone(request.getParameter("phone"));
		newUser.setUser_email(request.getParameter("email"));
		newUser.setUser_gender(request.getParameter("gender"));
		newUser.setUser_bloodgroup(request.getParameter("bloodgroup"));
		newUser.setRole_id(1);

		// Assuming password validation is already done in validateRegistrationForm
		return newUser;
	}
	
	
	public Boolean addUser(UserModel newUser) {
		if (dbConn == null) {
			System.err.println("Database connection is not available.");
			return null;
		}

		
		String insertQuery = "INSERT INTO users (user_name, user_email, user_phone, user_password, user_dob, user_gender, user_bloodgroup, role_id) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

		try (PreparedStatement stmt = dbConn.prepareStatement(insertQuery)) {

			stmt.setString(1, newUser.getUser_name()); // user_name
	        stmt.setString(2, newUser.getUser_email()); // user_email
	        stmt.setString(3, newUser.getUser_phone()); // user_phone
	        stmt.setString(4, newUser.getUser_password()); // user_password (hashed)
	        stmt.setDate(5, Date.valueOf(newUser.getUser_dob())); // user_dob
	        stmt.setString(6, newUser.getUser_gender()); // user_gender
	        stmt.setString(7, newUser.getUser_bloodgroup()); // user_bloodgroup
	        stmt.setInt(8, newUser.getRole_id()); // role_id 

			return stmt.executeUpdate() > 0;
		} catch (SQLException e) {
			System.err.println("Error during user registration: " + e.getMessage());
			e.printStackTrace();
			return null;
		}
	}

	
	
	
	
	
}