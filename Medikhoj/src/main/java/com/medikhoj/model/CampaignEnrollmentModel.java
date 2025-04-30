package com.medikhoj.model;

public class CampaignEnrollmentModel {
	private int user_id;
	private int campaign_id;
	
	public CampaignEnrollmentModel() {
		// TODO Auto-generated constructor stub
	}

	public CampaignEnrollmentModel(int user_id, int campaign_id) {
		super();
		this.user_id = user_id;
		this.campaign_id = campaign_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getCampaign_id() {
		return campaign_id;
	}

	public void setCampaign_id(int campaign_id) {
		this.campaign_id = campaign_id;
	}
	
	
}
