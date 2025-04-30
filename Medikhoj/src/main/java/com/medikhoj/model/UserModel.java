package com.medikhoj.model;

import java.time.LocalDate;

public class UserModel {
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
	
	public UserModel() {}

	public UserModel(int user_id, String user_name, String user_password, LocalDate user_dob, String user_phone,
			String user_email, String user_gender, String user_bloodgroup, String user_role, String user_profile) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_password = user_password;
		this.user_dob = user_dob;
		this.user_phone = user_phone;
		this.user_email = user_email;
		this.user_gender = user_gender;
		this.user_bloodgroup = user_bloodgroup;
		this.user_role = user_role;
		this.user_profile = user_profile;
	}

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
	};
	
	
	
}
