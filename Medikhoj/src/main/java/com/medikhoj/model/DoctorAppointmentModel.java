package com.medikhoj.model;

import java.time.LocalDate;
import java.time.LocalTime;

public class DoctorAppointmentModel {
	
	private LocalDate appointment_date;
	private int appointment_time;
	private String appointment_remarks;
	private String appointment_type;
	private String appointment_title;
	private String appointment_status;
	
	private String user_name;
	
	private LocalTime slot_time;
	
	
	public DoctorAppointmentModel() {}


	public DoctorAppointmentModel(LocalDate appointment_date, int appointment_time, String appointment_remarks,
			String appointment_type, String appointment_title, String appointment_status, String user_name,
			LocalTime slot_time) {
		super();
		this.appointment_date = appointment_date;
		this.appointment_time = appointment_time;
		this.appointment_remarks = appointment_remarks;
		this.appointment_type = appointment_type;
		this.appointment_title = appointment_title;
		this.appointment_status = appointment_status;
		this.user_name = user_name;
		this.slot_time = slot_time;
	}


	public LocalDate getAppointment_date() {
		return appointment_date;
	}


	public void setAppointment_date(LocalDate appointment_date) {
		this.appointment_date = appointment_date;
	}


	public int getAppointment_time() {
		return appointment_time;
	}


	public void setAppointment_time(int appointment_time) {
		this.appointment_time = appointment_time;
	}


	public String getAppointment_remarks() {
		return appointment_remarks;
	}


	public void setAppointment_remarks(String appointment_remarks) {
		this.appointment_remarks = appointment_remarks;
	}


	public String getAppointment_type() {
		return appointment_type;
	}


	public void setAppointment_type(String appointment_type) {
		this.appointment_type = appointment_type;
	}


	public String getAppointment_title() {
		return appointment_title;
	}


	public void setAppointment_title(String appointment_title) {
		this.appointment_title = appointment_title;
	}


	public String getAppointment_status() {
		return appointment_status;
	}


	public void setAppointment_status(String appointment_status) {
		this.appointment_status = appointment_status;
	}


	public String getUser_name() {
		return user_name;
	}


	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}


	public LocalTime getSlot_time() {
		return slot_time;
	}


	public void setSlot_time(LocalTime slot_time) {
		this.slot_time = slot_time;
	}	
}
