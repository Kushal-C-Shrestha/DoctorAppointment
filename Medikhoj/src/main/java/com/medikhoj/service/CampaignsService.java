package com.medikhoj.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.medikhoj.config.DbConfig;
import com.medikhoj.model.CampaignModel;
import com.medikhoj.model.CampaignUserModel;
import com.medikhoj.model.DoctorUserModel;

import java.time.format.DateTimeFormatter;
import java.time.LocalDate;
import java.time.LocalTime;


public class CampaignsService {
	private Connection dbConn;
	private boolean isConnectionError=false;
	
	public CampaignsService() {
		try {
			//Getting the connection from config file.
			
			this.dbConn=DbConfig.getDbConnection();
		} catch (SQLException | ClassNotFoundException ex) {
			// TODO: handle exception
			System.err.println("Database connection error: " + ex.getMessage());
			isConnectionError=true;
		}
	}
	
	public List<CampaignModel> getAllCampaigns(){
		if (isConnectionError) {
			//Checking if there is connection with database . if not this section is triggered
			System.out.println("Database connection error");
			return null;
		}
		
		//Creating an array list of DoctorModel. This will be passed to the jsp files.
		
		List<CampaignModel> campaigns=new ArrayList();
		String query="SELECT * FROM campaigns"; //Creating the required query to fetch from the database.
		
		//Preparing the statement 
		try(PreparedStatement stmt=dbConn.prepareStatement(query)){
			ResultSet rs=stmt.executeQuery(); //Executing the statement and storing it in ResultSet object
			
			DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("d MMMM yyyy"); 
			DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("hh:mm a"); 
			
			while (rs.next()) { //Iterating over each data row received from database.
				
				CampaignModel campaign=new CampaignModel(); //Creating object of the model class.
				
				//Setting the attributes as received from the database row.
				campaign.setCampaign_id(rs.getInt("campaign_id"));
				campaign.setCampaign_name(rs.getString("campaign_name"));
				campaign.setCampaign_desc(rs.getString("campaign_desc"));
				
				LocalDate campaign_date=rs.getDate("campaign_date").toLocalDate();
				LocalTime campaign_time=rs.getTime("campaign_time").toLocalTime();
						
				campaign.setFormatted_date(campaign_date.format(dateFormatter));
				campaign.setFormatted_time(campaign_time.format(timeFormatter));
				
				
				
				//Adding the object to the array list.
				campaigns.add(campaign);
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		
		return campaigns;
	}

	public List<CampaignUserModel> getEnrollmentsByUser(int user_id){
		System.out.println("Entered");
		if (isConnectionError) {
			//Checking if there is connection with database . if not this section is triggered
			System.out.println("Database connection error");
			return null;
		}
		
		List<CampaignUserModel> enrollmentsByUser=new ArrayList<CampaignUserModel>();
		String query="SELECT * FROM campaign_enrollment ce JOIN campaigns c ON ce.campaign_id=c.campaign_id JOIN users u ON ce.user_id = u.user_id  "
				+ "WHERE u.user_id=?";
		
		try(PreparedStatement stmt=dbConn.prepareStatement(query)){
			
			stmt.setInt(1, user_id);			
			ResultSet rs=stmt.executeQuery();
					
			
			while (rs.next()) {
				CampaignUserModel cu=new CampaignUserModel();
				
				cu.setUser_id(rs.getInt("user_id"));
				cu.setCampaign_date(rs.getDate("campaign_date").toLocalDate());
				cu.setCampaign_name(rs.getString("campaign_name"));
				cu.setCampaign_desc(rs.getString("campaign_desc"));
				cu.setCampaign_time(rs.getTime("campaign_time").toLocalTime());

				enrollmentsByUser.add(cu);
			}
			return enrollmentsByUser;
		}catch (Exception e) {
			return null;
			// TODO: handle exception
		}
	}
	
	public boolean enrollUserInCampaign(int userId, int campaignId) {
		if (isConnectionError) {
			//Checking if there is connection with database . if not this section is triggered
			System.out.println("Database connection error");
			return false;
		}
		
	    String sql = "INSERT INTO campaign_enrollment (campaign_id,user_id) VALUES (?, ?)";

	    try (PreparedStatement stmt = dbConn.prepareStatement(sql)) {
	        stmt.setInt(1, campaignId );
	        stmt.setInt(2, userId);
	        int rowsInserted = stmt.executeUpdate();
	        return rowsInserted > 0;
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	
	
	public boolean isUserEnrolledInCampaign(int userId, int campaignId) {
		if (isConnectionError) {
			//Checking if there is connection with database . if not this section is triggered
			System.out.println("Database connection error");
			return false;
		}
		
	    boolean isEnrolled = false;
	    String campaignquery = "SELECT COUNT(*) FROM campaign_enrollment WHERE user_id = ? AND campaign_id = ?";

	    try (PreparedStatement stmt = dbConn.prepareStatement(campaignquery)) {
	        stmt.setInt(1, userId);
	        stmt.setInt(2, campaignId);
	        ResultSet rs = stmt.executeQuery();

	        if (rs.next()) {
	            isEnrolled = rs.getInt(1) > 0; // If count > 0, the user is enrolled
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	    return isEnrolled;
	}

}
