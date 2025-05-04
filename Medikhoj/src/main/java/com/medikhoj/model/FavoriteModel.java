package com.medikhoj.model;

public class FavoriteModel {
	private int user_id;
	private int doctor_id;
	
	
	public FavoriteModel() {}
	
	public FavoriteModel(int user_id, int doctor_id) {
		super();
		this.user_id = user_id;
		this.doctor_id = doctor_id;
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
	
	
}
