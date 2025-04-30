package com.medikhoj.model;

public class UserDoctorAppointment {
	private int user_id;
	private int doctor_id;
	private int appointment_id;
	
	public UserDoctorAppointment() {
		// TODO Auto-generated constructor stub
	}

	public UserDoctorAppointment(int user_id, int doctor_id, int appointment_id) {
		super();
		this.user_id = user_id;
		this.doctor_id = doctor_id;
		this.appointment_id = appointment_id;
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

	public int getAppointment_id() {
		return appointment_id;
	}

	public void setAppointment_id(int appointment_id) {
		this.appointment_id = appointment_id;
	}
	
	
}
