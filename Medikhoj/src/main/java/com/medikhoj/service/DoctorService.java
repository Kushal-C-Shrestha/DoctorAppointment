package com.medikhoj.service;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import com.medikhoj.config.DbConfig;
import com.medikhoj.model.DoctorModel;
import com.medikhoj.model.DoctorUserModel;



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
			
			isConnectionError=true;
		}
	}
	
	public List<DoctorUserModel> getAllDoctors(){
		if (isConnectionError) {
			//Checking if there is connection with database . if not this section is triggered
			System.out.println("Database connection error");
			return null;
		}
		
		//Creating an array list of DoctorModel. This will be passed to the jsp files.
		
		List<DoctorUserModel> doctors=new ArrayList();
		String query="SELECT * FROM doctors d JOIN users u on d.doctor_id=u.user_id"; //Creating the required query to fetch from the database.
		
		//Preparing the statement 
		try(PreparedStatement stmt=dbConn.prepareStatement(query)){
			ResultSet rs=stmt.executeQuery(); //Executing the statement and storing it in ResultSet object
			
			
			while (rs.next()) { //Iterating over each data row received from database.
				
				DoctorUserModel doctor=new DoctorUserModel(); //Creating object of the model class.
				
				//Setting the attributes as received from the database row.
				// DoctorModel fields
				doctor.setDoctor_id(rs.getInt("doctor_id"));
				doctor.setDoctor_specialization(rs.getString("doctor_specialization"));
				doctor.setDoctor_qualification(rs.getString("doctor_qualification"));
				doctor.setDoctor_about(rs.getString("doctor_desc")); // assuming doctor_about is stored as doctor_desc in DB
				doctor.setDoctor_experience(rs.getInt("doctor_experience"));

				// UserModel fields
				doctor.setUser_id(rs.getInt("user_id"));
				doctor.setUser_name(rs.getString("user_name"));
				doctor.setUser_password(rs.getString("user_password"));
				doctor.setUser_dob(rs.getDate("user_dob").toLocalDate()); // converting SQL Date to LocalDate
				doctor.setUser_phone(rs.getString("user_phone"));
				doctor.setUser_email(rs.getString("user_email"));
				doctor.setUser_gender(rs.getString("user_gender"));
				doctor.setUser_bloodgroup(rs.getString("user_bloodgroup"));
				doctor.setUser_role(rs.getString("user_role"));
				doctor.setUser_profile(rs.getString("user_profile"));
				
				//Adding the object to the array list.
				doctors.add(doctor);
			}
			return doctors;
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		return doctors;
	}
	
	
	
	public DoctorModel getDoctorProfile(int id) {
		if (isConnectionError) {
			//Checking if there is connection with database . if not this section is triggered
			System.out.println("Database connection error");
			return null;
		}
		
		//Creating an array list of DoctorModel. This will be passed to the jsp files.
		
		DoctorModel doctor=new DoctorModel();
		String query="SELECT * FROM doctors WHERE doctor_id=?"; //Creating the required query to fetch from the database.
		
		//Preparing the statement 
		try(PreparedStatement stmt=dbConn.prepareStatement(query)){
			stmt.setInt(1,id);
			ResultSet rs=stmt.executeQuery(); //Executing the statement and storing it in ResultSet object
			
			
			while (rs.next()) { //Iterating over each data row received from database.
				//Setting the attributes as received from the database row.
				
				doctor.setDoctor_id(rs.getInt("doctor_id"));
				doctor.setDoctor_specialization(rs.getString("doctor_specialization"));
				doctor.setDoctor_qualification(rs.getString("doctor_qualification"));
				doctor.setDoctor_about(rs.getString("doctor_desc")); // assuming doctor_about is stored as doctor_desc in DB
				doctor.setDoctor_experience(rs.getInt("doctor_experience"));
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		return doctor;
	}
	public DoctorUserModel getFullDoctorDetails(int id){
		if (isConnectionError) {
			//Checking if there is connection with database . if not this section is triggered
			System.out.println("Database connection error");
			return null;
		}
		
		//Creating an array list of DoctorModel. This will be passed to the jsp files.
		
		DoctorUserModel doctor=new DoctorUserModel();
		String query="SELECT * FROM doctors d JOIN users u ON u.user_id=d.doctor_id WHERE doctor_id=?"; //Creating the required query to fetch from the database.
		
		//Preparing the statement 
		try(PreparedStatement stmt=dbConn.prepareStatement(query)){
			stmt.setInt(1,id);
			ResultSet rs=stmt.executeQuery(); //Executing the statement and storing it in ResultSet object
			
			
			while (rs.next()) { //Iterating over each data row received from database.
				//Setting the attributes as received from the database row.
				doctor.setDoctor_id(rs.getInt("doctor_id"));
				doctor.setDoctor_specialization(rs.getString("doctor_specialization"));
				doctor.setDoctor_qualification(rs.getString("doctor_qualification"));
				doctor.setDoctor_about(rs.getString("doctor_desc")); // assuming doctor_about is stored as doctor_desc in DB
				doctor.setDoctor_experience(rs.getInt("doctor_experience"));

				// UserModel fields
				doctor.setUser_id(rs.getInt("user_id"));
				doctor.setUser_name(rs.getString("user_name"));
				doctor.setUser_password(rs.getString("user_password"));
				doctor.setUser_dob(rs.getDate("user_dob").toLocalDate()); // converting SQL Date to LocalDate
				doctor.setUser_phone(rs.getString("user_phone"));
				doctor.setUser_email(rs.getString("user_email"));
				doctor.setUser_gender(rs.getString("user_gender"));
				doctor.setUser_bloodgroup(rs.getString("user_bloodgroup"));
				doctor.setUser_role(rs.getString("user_role"));
				doctor.setUser_profile(rs.getString("user_profile"));
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		return doctor;
	}
	
	public boolean addDoctor(DoctorModel doctor) {
		if (isConnectionError) {
			//Checking if there is connection with database . if not this section is triggered
			System.out.println("Database connection error");
			return false;
		}
		
		String query="SELECT * FROM doctors WHERE Doctor_id=?"; //Creating the required query to fetch from the database.
		
		//Preparing the statement 
		try(PreparedStatement stmt=dbConn.prepareStatement(query)){
			stmt.setInt(1,doctor.getDoctor_id());
			ResultSet rs=stmt.executeQuery(); //Executing the statement and storing it in ResultSet object
			
			
			if (rs.next()) { //Iterating over each data row received from database.
				//Setting the attributes as received from the database row.
				doctor.setDoctor_id(rs.getInt("doctor_id"));
				doctor.setDoctor_specialization(rs.getString("doctor_specialization"));
				doctor.setDoctor_qualification(rs.getString("doctor_qualification"));
				doctor.setDoctor_about(rs.getString("doctor_about"));
				return false;
			}
			
			String insertQuery="INSERT into Doctors (doctor_name,doctor_specialization,doctor_email,doctor_phone,doctor_qualification,doctor_description,"
					+ "doctor_password doctor_experience) "
					+ "VALUES (?,?,?,?,?,?,?,?,?)";
			
			try(PreparedStatement insertStmt = dbConn.prepareStatement(insertQuery)){
				insertStmt.setString(2, doctor.getDoctor_specialization());
				insertStmt.setString(5, doctor.getDoctor_qualification());
				insertStmt.setString(6, doctor.getDoctor_about());
				
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return true;
	}
}
