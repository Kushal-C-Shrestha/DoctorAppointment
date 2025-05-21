package com.medikhoj.model;

public class DoctorModel {
	private int doctor_id;
	private String doctor_specialization;
	private String doctor_qualification;
	private String doctor_about;
	private int doctor_experience;
    private float doctor_rating;
    private int rating_count;
	
	
	public DoctorModel() {}
	
	public DoctorModel(int doctor_id, String doctor_specialization, String doctor_qualification, String doctor_about,
			int doctor_experience,float doctor_rating,int rating_count) {
		super();
		this.doctor_id = doctor_id;
		this.doctor_specialization = doctor_specialization;
		this.doctor_qualification = doctor_qualification;
		this.doctor_about = doctor_about;
		this.doctor_experience = doctor_experience;
		this.doctor_rating=doctor_rating;
		this.rating_count=rating_count;
	}
	
	
	
	public int getDoctor_id() {
		return doctor_id;
	}
	public void setDoctor_id(int doctor_id) {
		this.doctor_id = doctor_id;
	}
	public String getDoctor_specialization() {
		return doctor_specialization;
	}
	public void setDoctor_specialization(String doctor_specialization) {
		this.doctor_specialization = doctor_specialization;
	}
	public String getDoctor_qualification() {
		return doctor_qualification;
	}
	public void setDoctor_qualification(String doctor_qualification) {
		this.doctor_qualification = doctor_qualification;
	}
	public String getDoctor_about() {
		return doctor_about;
	}
	public void setDoctor_about(String doctor_about) {
		this.doctor_about = doctor_about;
	}
	public int getDoctor_experience() {
		return doctor_experience;
	}
	public void setDoctor_experience(int doctor_experience) {
		this.doctor_experience = doctor_experience;
	}

	public float getDoctor_rating() {
		return doctor_rating;
	}

	public void setDoctor_rating(float doctor_rating) {
		this.doctor_rating = doctor_rating;
	}

	public int getRating_count() {
		return rating_count;
	}

	public void setRating_count(int rating_count) {
		this.rating_count = rating_count;
	}
	
	
	
}
