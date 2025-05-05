package com.medikhoj.service;
import com.medikhoj.model.DoctorModel;
import com.medikhoj.model.ReviewModel;
import com.medikhoj.model.UserDoctorReview;
import com.medikhoj.model.UserReviewModel;

import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.medikhoj.config.DbConfig;
import com.medikhoj.controller.campaignsController;



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
	
	public List <UserReviewModel> getReviewsByDoctor(int doctor_id){
		if (isConnectionError) {
			//Checking if there is connection with database . if not this section is triggered
			System.out.println("Database connection error");
			return null;
		}
		
		List<UserReviewModel> reviewsByDoctor=new ArrayList();
		String query="SELECT * FROM reviews r JOIN user_doctor_review udr ON r.review_id=udr.review_id JOIN users u ON u.user_id=udr.user_id "
				+ "WHERE udr.doctor_id=?";
		
		try(PreparedStatement stmt=dbConn.prepareStatement(query)){
			
			stmt.setInt(1, doctor_id);			
			ResultSet rs=stmt.executeQuery();
					
			
			while (rs.next()) {
				UserReviewModel ur=new UserReviewModel();
				
				ur.setUser_name(rs.getString("user_name"));
				ur.setUser_profile(rs.getString("user_profile"));
				ur.setReview_id(rs.getInt("review_id"));
				ur.setReview_date(rs.getDate("review_date").toLocalDate());
				ur.setReview_desc(rs.getString("review_desc"));
				ur.setReview_rating(rs.getFloat("review_rating"));
				
				reviewsByDoctor.add(ur);
			}
			return reviewsByDoctor;
		}catch (Exception e) {
			return null;
			// TODO: handle exception
		}
	}
}