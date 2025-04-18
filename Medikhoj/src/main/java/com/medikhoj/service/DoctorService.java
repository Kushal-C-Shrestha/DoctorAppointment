package com.medikhoj.service;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import com.medikhoj.config.DbConfig;
import com.medikhoj.model.DoctorModel;



public class DoctorService {
	
	private Connection dbConn;
	private boolean isConnectionError=false;
	
	public DoctorService() {
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
	
	public List<DoctorModel> getAllDoctors(){
		if (isConnectionError) {
			//Checking if there is connection with database . if not this section is triggered
			System.out.println("Database connection error");
			return null;
		}
		
		//Creating an array list of DoctorModel. This will be passed to the jsp files.
		
		List<DoctorModel> doctors=new ArrayList();
		String query="SELECT * FROM doctors"; //Creating the required query to fetch from the database.
		
		//Preparing the statement 
		try(PreparedStatement stmt=dbConn.prepareStatement(query)){
			ResultSet rs=stmt.executeQuery(); //Executing the statement and storing it in ResultSet object
			
			
			while (rs.next()) { //Iterating over each data row received from database.
				
				DoctorModel doctor=new DoctorModel(); //Creating object of the model class.
				
				//Setting the attributes as received from the database row.
				doctor.setDoctor_id(rs.getInt("Doctor_id"));
				doctor.setDoctor_name(rs.getString("Doctor_name"));
				doctor.setDoctor_email(rs.getString("Doctor_email"));
				doctor.setDoctor_phone(rs.getString("Doctor_phone"));
				doctor.setDoctor_specialization(rs.getString("Doctor_specialization"));
				doctor.setDoctor_qualification(rs.getString("Doctor_qualification"));
				doctor.setDoctor_about(rs.getString("Doctor_about"));
				
				
				//Adding the object to the array list.
				doctors.add(doctor);
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		return doctors;
	}
}
