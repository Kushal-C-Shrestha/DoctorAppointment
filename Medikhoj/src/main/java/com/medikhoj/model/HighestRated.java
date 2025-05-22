package com.medikhoj.model;

public class HighestRated {
	private String doctor_name;
	private String doctor_profile;
	private float doctor_rating;
	
	public HighestRated() {}
	
	public HighestRated(String doctor_name, String doctor_profile, float doctor_rating) {
		super();
		this.doctor_name = doctor_name;
		this.doctor_profile = doctor_profile;
		this.doctor_rating = doctor_rating;
	}
	
	public String getDoctor_name() {
		return doctor_name;
	}
	public void setDoctor_name(String doctor_name) {
		this.doctor_name = doctor_name;
	}
	public String getDoctor_profile() {
		return doctor_profile;
	}
	public void setDoctor_profile(String doctor_profile) {
		this.doctor_profile = doctor_profile;
	}
	public float getDoctor_rating() {
		return doctor_rating;
	}
	public void setDoctor_rating(float doctor_rating) {
		this.doctor_rating = doctor_rating;
	}
}
