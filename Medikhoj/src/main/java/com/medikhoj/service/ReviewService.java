package com.medikhoj.service;
import com.medikhoj.model.DoctorModel;
import com.medikhoj.model.ReviewModel;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.medikhoj.config.DbConfig;
import com.medikhoj.controller.reviewsController;


public class ReviewService {
	private Connection dbConn;
	private boolean isConnectionError=false;
	
	public ReviewService() {
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
	
	
	public List<ReviewModel> getReviews(int id){
		
		if (isConnectionError) {
			//Checking if there is connection with database . if not this section is triggered
			System.out.println("Database connection error");
			return null;
		}
		
		List <ReviewModel> reviews=new  ArrayList();
		String query="SELECT * FROM reviews WHERE doctor_id= ?"; //Creating the required query to fetch from the database.
		
		//Preparing the statement 
		try(PreparedStatement stmt=dbConn.prepareStatement(query)){
			stmt.setInt(1, id);
			ResultSet rs=stmt.executeQuery(); //Executing the statement and storing it in ResultSet object
			
			
			while (rs.next()) { //Iterating over each data row received from database.
				
				ReviewModel review=new ReviewModel(); //Creating object of the model class.
				
				//Setting the attributes as received from the database row.
				
				
				
				//Adding the object to the array list.
				reviews.add(review);
			}
			
			return reviews;
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
}
