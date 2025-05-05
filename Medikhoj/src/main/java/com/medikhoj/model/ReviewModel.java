package com.medikhoj.model;

import java.time.LocalDate;

public class ReviewModel {
	private int review_id;
	private String review_desc;
	private float review_rating;
	private LocalDate review_date;
	
	public ReviewModel() {}
	
	public ReviewModel(int review_id, String review_desc, float review_rating, LocalDate review_date) {
		super();
		this.review_id = review_id;
		this.review_desc = review_desc;
		this.review_rating = review_rating;
		this.review_date = review_date;
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

	
	
}
