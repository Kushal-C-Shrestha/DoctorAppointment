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
	
	public List<DoctorUserModel> getFavoritesByUser(int user_id){
		if (isConnectionError) {
			//Checking if there is connection with database . if not this section is triggered
			System.out.println("Database connection error");
			return null;
		}
		
		List<DoctorUserModel> favoritesByUser=new ArrayList();
		String query="SELECT * FROM favorite f JOIN users u ON f.user_id = u.user_id  "
				+ "WHERE u.user_id=?";
		
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
				du.setDoctor_specialization(rs.getString("doctor_specialization"));
				du.setDoctor_qualification(rs.getString("doctor_qualification"));


				
				favoritesByUser.add(du);
			}
			return favoritesByUser;
		}catch (Exception e) {
			return null;
			// TODO: handle exception
		}
	}
}
