package com.medikhoj.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import com.medikhoj.model.UserModel;
import com.medikhoj.config.DbConfig;

public class UserService {
	private Connection dbConn;
	private boolean isConnectionError=false;
	
	public UserService() {
		try {
			this.dbConn = DbConfig.getDbConnection();
		} catch (SQLException | ClassNotFoundException ex) {
			System.err.println("Database connection error: " + ex.getMessage());
			ex.printStackTrace();
		}
	
	}
	
	public UserModel getUser(int userId) {
		if (isConnectionError) {
			//Checking if there is connection with database . if not this section is triggered
			System.out.println("Database connection error");
			return null;
		}
		
		
		UserModel user=new UserModel();
		
		String query="SELECT * FROM users WHERE user_id=?";
		
		try(PreparedStatement stmt=dbConn.prepareStatement(query)){
			stmt.setInt(1, userId);
			ResultSet rs=stmt.executeQuery();
			
			while(rs.next()) {
				user.setUser_id(rs.getInt("user_id"));
				user.setUser_name(rs.getString("user_name"));
				user.setUser_email(rs.getString("user_email"));
				user.setUser_phone(rs.getString("user_phone"));
				user.setUser_password(rs.getString("user_password"));
				user.setUser_dob(LocalDate.parse(rs.getString("user_password")));
				user.setUser_gender(rs.getString("user_gender"));
				user.setUser_bloodgroup(rs.getString("user_bloodgroup"));
				user.setUser_role(rs.getString("user_role"));
				
				return user;
			}
			
			return null;
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		return user;
	}
}
