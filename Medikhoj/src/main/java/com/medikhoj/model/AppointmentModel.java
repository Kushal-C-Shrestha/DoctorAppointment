package com.medikhoj.model;

import java.time.LocalDate;
import java.time.LocalTime;

public class AppointmentModel {
	private int appointment_id;
	private LocalDate appointment_date;
	private LocalTime appointment_time;
	private String appointment_remarks;
	
	public AppointmentModel() {}
	
	public AppointmentModel(int appointment_id, LocalDate appointment_date, LocalTime appointment_time,
			String appointment_remarks) {
		super();
		this.appointment_id = appointment_id;
		this.appointment_date = appointment_date;
		this.appointment_time = appointment_time;
		this.appointment_remarks = appointment_remarks;
	}
	
	
	public int getAppointment_id() {
		return appointment_id;
	}
	public void setAppointment_id(int appointment_id) {
		this.appointment_id = appointment_id;
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
	public String getAppointment_remarks() {
		return appointment_remarks;
	}
	public void setAppointment_remarks(String appointment_remarks) {
		this.appointment_remarks = appointment_remarks;
	}
	
	
}
