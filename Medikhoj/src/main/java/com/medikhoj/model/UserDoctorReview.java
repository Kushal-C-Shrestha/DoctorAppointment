package com.medikhoj.model;

public class UserDoctorReview {
	private int user_id;
	private int doctor_id;
	private int review_id;
	
	public UserDoctorReview() {
		// TODO Auto-generated constructor stub
	}

	public UserDoctorReview(int user_id, int doctor_id, int review_id) {
		super();
		this.user_id = user_id;
		this.doctor_id = doctor_id;
		this.review_id = review_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getDoctor_id() {
		return doctor_id;
	}

	public void setDoctor_id(int doctor_id) {
		this.doctor_id = doctor_id;
	}

	public int getReview_id() {
		return review_id;
	}

	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	
	
}
