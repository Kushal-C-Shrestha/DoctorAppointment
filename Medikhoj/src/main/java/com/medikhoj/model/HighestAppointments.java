package com.medikhoj.model;

public class HighestAppointments {
	private String doctor_name;
	private int total_appointments;
	private String doctor_profile;
	
	public HighestAppointments() {}
	
	public HighestAppointments( String doctor_name, int total_appointments, String doctor_profile) {
		super();
		this.doctor_name = doctor_name;
		this.total_appointments = total_appointments;
		this.doctor_profile = doctor_profile;
	}

	public String getDoctor_name() {
		return doctor_name;
	}
	public void setDoctor_name(String doctor_name) {
		this.doctor_name = doctor_name;
	}
	public int getTotal_appointments() {
		return total_appointments;
	}
	public void setTotal_appointments(int total_appointments) {
		this.total_appointments = total_appointments;
	}
	public String getDoctor_profile() {
		return doctor_profile;
	}
	public void setDoctor_profile(String doctor_profile) {
		this.doctor_profile = doctor_profile;
	}
}
