package com.medikhoj.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.medikhoj.config.DbConfig;
import com.medikhoj.model.DoctorModel;

public class DoctorProfileService {
	private Connection dbConn;
	private boolean isConnectionError=false;
	
	public DoctorProfileService() {
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
	
	public DoctorModel getDoctorById(int id){
		if (isConnectionError) {
			//Checking if there is connection with database . if not this section is triggered
			System.out.println("Database connection error");
			return null;
		}
		
		//Creating an array list of DoctorModel. This will be passed to the jsp files.
		
		DoctorModel doctor=new DoctorModel();
		String query="SELECT * FROM doctors WHERE Doctor_id=?"; //Creating the required query to fetch from the database.
		
		//Preparing the statement 
		try(PreparedStatement stmt=dbConn.prepareStatement(query)){
			stmt.setInt(1,id);
			ResultSet rs=stmt.executeQuery(); //Executing the statement and storing it in ResultSet object
			
			
			while (rs.next()) { //Iterating over each data row received from database.
				//Setting the attributes as received from the database row.
				doctor.setDoctor_id(rs.getInt("Doctor_id"));
				doctor.setDoctor_name(rs.getString("Doctor_name"));
				doctor.setDoctor_email(rs.getString("Doctor_email"));
				doctor.setDoctor_phone(rs.getString("Doctor_phone"));
				doctor.setDoctor_specialization(rs.getString("Doctor_specialization"));
				doctor.setDoctor_qualification(rs.getString("Doctor_qualification"));
				doctor.setDoctor_about(rs.getString("Doctor_about"));
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		return doctor;
	}
}
