package com.medikhoj.model;

public class DoctorModel {
	private int doctor_id;
	private String doctor_name;
	private String doctor_specialization;
	private String doctor_email;
	private String doctor_phone;
	private String doctor_qualification;
	private String doctor_about;
	private String doctor_profile_path;
	
	
	public DoctorModel() {};
	
	public DoctorModel(int doctor_id, String doctor_name, String doctor_specialization, String doctor_email,
			String doctor_phone, String doctor_qualification, String doctor_about, String doctor_profile_path) {
		this.doctor_id = doctor_id;
		this.doctor_name = doctor_name;
		this.doctor_specialization = doctor_specialization;
		this.doctor_email = doctor_email;
		this.doctor_phone = doctor_phone;
		this.doctor_qualification = doctor_qualification;
		this.doctor_about = doctor_about;
		this.doctor_profile_path = doctor_profile_path;
	}
	
	
	public String getDoctor_profile_path() {
		return doctor_profile_path;
	}
	public void setDoctor_profile_path(String doctor_ptofile_path) {
		this.doctor_profile_path = doctor_ptofile_path;
	}
	public int getDoctor_id() {
		return doctor_id;
	}
	public void setDoctor_id(int doctor_id) {
		this.doctor_id = doctor_id;
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
	public String getDoctor_email() {
		return doctor_email;
	}
	public void setDoctor_email(String doctor_email) {
		this.doctor_email = doctor_email;
	}
	public String getDoctor_phone() {
		return doctor_phone;
	}
	public void setDoctor_phone(String doctor_phone) {
		this.doctor_phone = doctor_phone;
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
	
	

	
	
}
