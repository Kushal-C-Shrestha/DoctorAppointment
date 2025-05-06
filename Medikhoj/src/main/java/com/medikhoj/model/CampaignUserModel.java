package com.medikhoj.model;

import java.time.LocalDate;
import java.time.LocalTime;

public class CampaignUserModel {
    // Campaign Details
    private int campaign_id;
    private String campaign_name;
    private String campaign_desc;
    private LocalDate campaign_date;
    private String formatted_date;
    private LocalTime campaign_time;
    private String formatted_time;

    // User Details
    private int user_id;
    private String user_name;
    private String user_password;
    private LocalDate user_dob;
    private String user_phone;
    private String user_email;
    private String user_gender;
    private String user_bloodgroup;
    private String user_role;
    private String user_profile;

    // Default Constructor
    public CampaignUserModel() {}

    // Constructor to initialize both Campaign and User details
    public CampaignUserModel(CampaignModel campaign, UserModel user) {
        this.campaign_id = campaign.getCampaign_id();
        this.campaign_name = campaign.getCampaign_name();
        this.campaign_desc = campaign.getCampaign_desc();
        this.campaign_date = campaign.getCampaign_date();
        this.formatted_date = campaign.getFormatted_date();
        this.campaign_time = campaign.getCampaign_time();
        this.formatted_time = campaign.getFormatted_time();

        this.user_id = user.getUser_id();
        this.user_name = user.getUser_name();
        this.user_password = user.getUser_password();
        this.user_dob = user.getUser_dob();
        this.user_phone = user.getUser_phone();
        this.user_email = user.getUser_email();
        this.user_gender = user.getUser_gender();
        this.user_bloodgroup = user.getUser_bloodgroup();
        this.user_role = user.getUser_role();
        this.user_profile = user.getUser_profile();
    }

    // Getters and Setters for Campaign Details
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

    public String getFormatted_date() {
        return formatted_date;
    }

    public void setFormatted_date(String formatted_date) {
        this.formatted_date = formatted_date;
    }

    public LocalTime getCampaign_time() {
        return campaign_time;
    }

    public void setCampaign_time(LocalTime campaign_time) {
        this.campaign_time = campaign_time;
    }

    public String getFormatted_time() {
        return formatted_time;
    }

    public void setFormatted_time(String formatted_time) {
        this.formatted_time = formatted_time;
    }

    // Getters and Setters for User Details
    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }

    public LocalDate getUser_dob() {
        return user_dob;
    }

    public void setUser_dob(LocalDate user_dob) {
        this.user_dob = user_dob;
    }

    public String getUser_phone() {
        return user_phone;
    }

    public void setUser_phone(String user_phone) {
        this.user_phone = user_phone;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getUser_gender() {
        return user_gender;
    }

    public void setUser_gender(String user_gender) {
        this.user_gender = user_gender;
    }

    public String getUser_bloodgroup() {
        return user_bloodgroup;
    }

    public void setUser_bloodgroup(String user_bloodgroup) {
        this.user_bloodgroup = user_bloodgroup;
    }

    public String getUser_role() {
        return user_role;
    }

    public void setUser_role(String user_role) {
        this.user_role = user_role;
    }

    public String getUser_profile() {
        return user_profile;
    }

    public void setUser_profile(String user_profile) {
        this.user_profile = user_profile;
    }
}
