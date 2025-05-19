package com.medikhoj.model;

import java.time.LocalDate;
import java.time.LocalTime;

public class UpcomingAppointments {
	private String user_name;
	private String user_profile;
	private String doctor_name;
	private String doctor_specialization;
	private LocalDate appointment_date;
	private LocalTime appointment_time;
	
	
	public UpcomingAppointments(String user_name, String user_profile, String doctor_name, String doctor_specialization,
			LocalDate appointment_date, LocalTime appointment_time) {
		super();
		this.user_name = user_name;
		this.user_profile = user_profile;
		this.doctor_name = doctor_name;
		this.doctor_specialization = doctor_specialization;
		this.appointment_date = appointment_date;
		this.appointment_time = appointment_time;
	}
	
	
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_profile() {
		return user_profile;
	}
	public void setUser_profile(String user_profile) {
		this.user_profile = user_profile;
	}
	public String getDoctor_name() {
		return doctor_name;
	}
	public void setDoctor_name(String doctor_name) {
		this.doctor_name = doctor_name;
	}
	public String getDoctor_specialization() {
		return doctor_specialization;
	}
	public void setDoctor_specialization(String doctor_specialization) {
		this.doctor_specialization = doctor_specialization;
	}
	public LocalDate getAppointment_date() {
		return appointment_date;
	}
	public void setAppointment_date(LocalDate appointment_date) {
		this.appointment_date = appointment_date;
	}
	public LocalTime getAppointment_time() {
		return appointment_time;
	}
	public void setAppointment_time(LocalTime appointment_time) {
		this.appointment_time = appointment_time;
	}
	
	
	
	
	
	
	
	
}
