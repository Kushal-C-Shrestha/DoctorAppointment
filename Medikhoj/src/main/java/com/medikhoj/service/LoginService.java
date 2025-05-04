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
	
	/*public UserModel authenticateUser(String email, String password) {
		
		String query = "SELECT * FROM users WHERE user_email = ?";
		
        if (isConnectionError) {
			//Checking if there is connection with database . if not this section is triggered
			System.out.println("Database connection error");
			return null;
		}
        
        try (PreparedStatement statement = dbConn.prepareStatement(query)) {
            statement.setString(1, email);
            ResultSet rs = statement.executeQuery();
            System.out.println(password);

            if (rs.next()) {	
                // User exists , now check password.
            	String storedPassword = rs.getString("user_password");
            	
            	if (PasswordUtil.verifyPassword(password, storedPassword)) {
            		 UserModel user = new UserModel();
                     user.setUser_id(rs.getInt("user_id"));
                     user.setUser_name(rs.getString("user_name"));
                     user.setUser_email(rs.getString("user_email"));
                     user.setUser_phone(rs.getString("user_phone"));
                     user.setUser_dob(rs.getDate("user_dob").toLocalDate());
                     user.setUser_gender(rs.getString("user_gender"));
                     user.setUser_bloodgroup(rs.getString("user_bloodgroup"));
                     user.setRole_id(rs.getInt("role_id"));
                     return user; 
            	}
            }
            System.out.println("User not found");
        	return null;
        }
        catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    */
}
