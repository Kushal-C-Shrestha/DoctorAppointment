package com.medikhoj.model;
import java.time.LocalDate;
import java.time.LocalTime;


public class CampaignModel {
	private int campaign_id;
	private String campaign_name;
	private String campaign_desc;
	private LocalDate campaign_date;
	private String formatted_date;
	private LocalTime campaign_time;
	private String formatted_time;
	
	
	public CampaignModel() {};
	
	public CampaignModel(int campaign_id, String campaign_name, String campaign_desc, LocalDate campaign_date,
			LocalTime campaign_time) {
		super();
		this.campaign_id = campaign_id;
		this.campaign_name = campaign_name;
		this.campaign_desc = campaign_desc;
		this.campaign_date = campaign_date;
		this.campaign_time = campaign_time;
	}
	
	
	public int getCampaign_id() {
		return campaign_id;
	}
	public void setCampaign_id(int campaign_id) {
		this.campaign_id = campaign_id;
	}
	public String getCampaign_name() {
		return campaign_name;
	}
	public void setCampaign_name(String campaign_name) {
		this.campaign_name = campaign_name;
	}
	public String getCampaign_desc() {
		return campaign_desc;
	}
	public void setCampaign_desc(String campaign_desc) {
		this.campaign_desc = campaign_desc;
	}
	public LocalDate getCampaign_date() {
		return campaign_date;
	}
	public void setCampaign_date(LocalDate campaign_date) {
		this.campaign_date = campaign_date;
	}
	public LocalTime getCampaign_time() {
		return campaign_time;
	}
	public void setCampaign_time(LocalTime campaign_time) {
		this.campaign_time = campaign_time;
	}

	public String getFormatted_date() {
		return formatted_date;
	}

	public void setFormatted_date(String formatted_date) {
		this.formatted_date = formatted_date;
	}

	public String getFormatted_time() {
		return formatted_time;
	}

	public void setFormatted_time(String formatted_time) {
		this.formatted_time = formatted_time;
	}
	
	
	
}
