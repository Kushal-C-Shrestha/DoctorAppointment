package com.medikhoj.service;

import com.medikhoj.config.DbConfig;
import com.medikhoj.model.UserModel;
import com.medikhoj.util.PasswordUtil;

import java.sql.*;

public class LoginService {
	
	private Connection dbConn;
	private boolean isConnectionError=false;
	
	public LoginService() {
		try {
			//Getting the connection from config file.
			
			this.dbConn=DbConfig.getDbConnection();
		}catch (SQLException | ClassNotFoundException ex) {
			// TODO: handle exception
			System.err.println("Database connection error: " + ex.getMessage());
			ex.printStackTrace();
			isConnectionError=true;
		}
	}
	
	public UserModel authenticateUser(String email, String password) {
		String query = "SELECT * FROM users WHERE user_email = ? or user_phone = ?";
        if (isConnectionError) {
			//Checking if there is connection with database . if not this section is triggered
			System.out.println("Database connection error");
			return null;
		}
        
        try (PreparedStatement statement = dbConn.prepareStatement(query)) {
            statement.setString(1, email);
            statement.setString(2, email);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {	
                // User exists , now check password.
            	String storedPassword = rs.getString("user_password");
            	System.out.println(storedPassword);
            	
            	if (!email.contains("@")) {
            		String mailQuery = "SELECT user_email FROM users WHERE user_phone= ?";
            		try(PreparedStatement stmt = dbConn.prepareStatement(mailQuery)){
            			stmt.setString(1, email);
            			ResultSet ms = stmt.executeQuery();
            			if (ms.next()) {
            				email = ms.getString("user_email");
            			}
            		}catch (SQLException e) {
            			
                        e.printStackTrace();
                        return null;
                    }
            		
            	}
            	if (password.equals(PasswordUtil.decrypt(storedPassword, email))) {
            		 UserModel user = new UserModel();
                     user.setUser_id(rs.getInt("user_id"));
                     user.setUser_name(rs.getString("user_name"));
                     user.setUser_email(rs.getString("user_email"));
                     user.setUser_phone(rs.getString("user_phone"));
                     user.setUser_dob(rs.getDate("user_dob").toLocalDate());
                     user.setUser_gender(rs.getString("user_gender"));
                     user.setUser_bloodgroup(rs.getString("user_bloodgroup"));
                     user.setUser_role(rs.getString("user_role"));

                     user.setUser_password(storedPassword);
                     user.setUser_profile(rs.getString("user_profile"));
                     return user; 
            	}
            }
            System.out.println("User not found");
        	return null;
        }
        catch (SQLException e) {
        	System.out.println("Error executing query: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
    
}
