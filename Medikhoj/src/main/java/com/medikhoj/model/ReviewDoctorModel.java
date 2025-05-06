package com.medikhoj.model;

import java.time.LocalDate;

public class ReviewDoctorModel {
	private int review_id;
	private String review_desc;
	private float review_rating;
	private LocalDate review_date;
	private String user_name;
	
	
	public ReviewDoctorModel() {}
	
	public ReviewDoctorModel(int review_id, String review_desc, float review_rating, LocalDate review_date,
			String user_name) {
		super();
		this.review_id = review_id;
		this.review_desc = review_desc;
		this.review_rating = review_rating;
		this.review_date = review_date;
		this.user_name = user_name;
	}
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public String getReview_desc() {
		return review_desc;
	}
	public void setReview_desc(String review_desc) {
		this.review_desc = review_desc;
	}
	public float getReview_rating() {
		return review_rating;
	}
	public void setReview_rating(float review_rating) {
		this.review_rating = review_rating;
	}
	public LocalDate getReview_date() {
		return review_date;
	}
	public void setReview_date(LocalDate review_date) {
		this.review_date = review_date;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
	
}
