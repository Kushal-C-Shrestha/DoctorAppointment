package com.medikhoj.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.medikhoj.config.DbConfig;
import com.medikhoj.model.CampaignModel;
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
			ex.printStackTrace();
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
}
