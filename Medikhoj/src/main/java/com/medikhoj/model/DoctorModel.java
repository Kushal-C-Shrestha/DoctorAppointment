package com.medikhoj.model;

public class DoctorModel {
	private int doctor_id;
	private String doctor_specialization;
	private String doctor_qualification;
	private String doctor_about;
	private String doctor_experience;
	
	
	
	public DoctorModel() {}
	
	public DoctorModel(int doctor_id, String doctor_specialization, String doctor_qualification, String doctor_about,
			String doctor_experience) {
		super();
		this.doctor_id = doctor_id;
		this.doctor_specialization = doctor_specialization;
		this.doctor_qualification = doctor_qualification;
		this.doctor_about = doctor_about;
		this.doctor_experience = doctor_experience;
	}
	
	
	
	public int getDoctor_id() {
		return doctor_id;
	}
	public void setDoctor_id(int doctor_id) {
		this.doctor_id = doctor_id;
	}
	public String getDoctor_specialization() {
		return doctor_specialization;
	}
	public void setDoctor_specialization(String doctor_specialization) {
		this.doctor_specialization = doctor_specialization;
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
	public String getDoctor_experience() {
		return doctor_experience;
	}
	public void setDoctor_experience(String doctor_experience) {
		this.doctor_experience = doctor_experience;
	}
	
	
	
}
