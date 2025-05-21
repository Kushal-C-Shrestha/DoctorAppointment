package com.medikhoj.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.print.Doc;

import java.sql.Connection;


import com.medikhoj.config.DbConfig;
import com.medikhoj.model.DoctorUserModel;
import com.medikhoj.model.ReviewDoctorModel;

public class FavoriteService {
	
	private Connection dbConn;
	private Boolean isConnectionError=false;
	
	public FavoriteService() {
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
	
	public boolean addtoFavourite(int user_id, int doctor_id) {
		if (isConnectionError) {
			//Checking if there is connection with database . if not this section is triggered
			System.out.println("Database connection error");
			return false;
		}
		
	    String checkQuery = "SELECT * FROM favorite WHERE user_id = ? AND doctor_id = ?";
	    String insertQuery = "INSERT INTO favorite (user_id, doctor_id) VALUES (?, ?)";

	    try (PreparedStatement checkStmt = dbConn.prepareStatement(checkQuery);
	    	PreparedStatement insertStmt = dbConn.prepareStatement(insertQuery)) {
	        // Set parameters for checking
	        checkStmt.setInt(1, user_id);
	        checkStmt.setInt(2, doctor_id);

	        try (ResultSet rs = checkStmt.executeQuery()) {
	            if (rs.next()) {
	                // Entry already exists
	                System.out.println("Already marked as favorite.");
	                return false;
	            }
	        }

	        // Set parameters for insert
	        insertStmt.setInt(1, user_id);
	        insertStmt.setInt(2, doctor_id);

	        int rowsAffected = insertStmt.executeUpdate();
	        return rowsAffected > 0;

	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	
	public boolean removeFavourite(int user_id, int doctor_id) {
	    if (isConnectionError) {
	        System.out.println("Database connection error");
	        return false;
	    }

	    String checkQuery = "SELECT * FROM favorite WHERE user_id = ? AND doctor_id = ?";
	    String deleteQuery = "DELETE FROM favorite WHERE user_id = ? AND doctor_id = ?";

	    try (
	        PreparedStatement checkStmt = dbConn.prepareStatement(checkQuery);
	        PreparedStatement deleteStmt = dbConn.prepareStatement(deleteQuery)
	    ) {
	        // Check if the entry exists
	        checkStmt.setInt(1, user_id);
	        checkStmt.setInt(2, doctor_id);

	        try (ResultSet rs = checkStmt.executeQuery()) {
	            if (!rs.next()) {
	                // Entry doesn't exist
	                System.out.println("Favorite entry does not exist.");
	                return false;
	            }
	        }

	        // Entry exists, proceed to delete
	        deleteStmt.setInt(1, user_id);
	        deleteStmt.setInt(2, doctor_id);

	        int rowsAffected = deleteStmt.executeUpdate();
	        return rowsAffected > 0;

	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}

	
	
	public List<DoctorUserModel> getFavoritesByUser(int user_id){
		if (isConnectionError) {
			//Checking if there is connection with database . if not this section is triggered
			System.out.println("Database connection error");
			return null;
		}
		
		List<DoctorUserModel> favoritesByUser=new ArrayList();
		String query="SELECT * FROM users u JOIN favorite f ON f.doctor_id=u.user_id "
				+ "WHERE f.user_id=?";
		
		try(PreparedStatement stmt=dbConn.prepareStatement(query)){
			
			stmt.setInt(1, user_id);			
			ResultSet rs=stmt.executeQuery();
			
			
			while (rs.next()) {
				DoctorUserModel du=new DoctorUserModel();
				du.setDoctor_id(rs.getInt("doctor_id"));
				du.setUser_id(rs.getInt("user_id"));
				du.setUser_name(rs.getString("user_name"));
				du.setUser_email(rs.getString("user_email"));
				du.setUser_phone(rs.getString("user_phone"));
//				du.setDoctor_specialization(rs.getString("doctor_specialization"));
//				du.setDoctor_qualification(rs.getString("doctor_qualification"));
//

				
				favoritesByUser.add(du);
			}
			return favoritesByUser;
		}catch (SQLException e) {
			e.printStackTrace();
			System.out.print("error");
			return null;
			// TODO: handle exception
		}
	}
	
	
	public boolean isDoctorFavorited(int userId, int doctorId) {
	    if (isConnectionError) {
	        System.out.println("Database connection error");
	        return false;
	    }

	    String query = "SELECT 1 FROM favorite WHERE user_id = ? AND doctor_id = ?";

	    try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
	        stmt.setInt(1, userId);
	        stmt.setInt(2, doctorId);
	        ResultSet rs = stmt.executeQuery();
	        return rs.next(); // true if exists
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	
}
