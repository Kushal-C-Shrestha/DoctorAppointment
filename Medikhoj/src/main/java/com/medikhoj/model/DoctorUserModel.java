package com.medikhoj.model;

import java.time.LocalDate;

public class DoctorUserModel {
    // Doctor Details
    private int doctor_id;
    private String doctor_specialization;
    private String doctor_qualification;
    private String doctor_about;
    private int doctor_experience;

    // User Details
    private int user_id;
    private String user_name;
    private String user_password;
    private LocalDate user_dob;
    private String user_phone;
    private String user_email;
    private String user_gender;
    private String user_bloodgroup;
    private String user_role;
    private String user_profile;

    // Constructor to initialize Doctor and User details
    public DoctorUserModel(DoctorModel doctor, UserModel user) {
        this.doctor_id = doctor.getDoctor_id();
        this.doctor_specialization = doctor.getDoctor_specialization();
        this.doctor_qualification = doctor.getDoctor_qualification();
        this.doctor_about = doctor.getDoctor_about();
        this.doctor_experience = doctor.getDoctor_experience();
        
        this.user_id = user.getUser_id();
        this.user_name = user.getUser_name();
        this.user_password = user.getUser_password();
        this.user_dob = user.getUser_dob();
        this.user_phone = user.getUser_phone();
        this.user_email = user.getUser_email();
        this.user_gender = user.getUser_gender();
        this.user_bloodgroup = user.getUser_bloodgroup();
        this.user_role = user.getUser_role();
        this.user_profile = user.getUser_profile();
    }
    
    public DoctorUserModel() {}

    // Getters and Setters for Doctor Details
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

    public int getDoctor_experience() {
        return doctor_experience;
    }

    public void setDoctor_experience(int doctor_experience) {
        this.doctor_experience = doctor_experience;
    }

    // Getters and Setters for User Details
    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }

    public LocalDate getUser_dob() {
        return user_dob;
    }

    public void setUser_dob(LocalDate user_dob) {
        this.user_dob = user_dob;
    }

    public String getUser_phone() {
        return user_phone;
    }

    public void setUser_phone(String user_phone) {
        this.user_phone = user_phone;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getUser_gender() {
        return user_gender;
    }

    public void setUser_gender(String user_gender) {
        this.user_gender = user_gender;
    }

    public String getUser_bloodgroup() {
        return user_bloodgroup;
    }

    public void setUser_bloodgroup(String user_bloodgroup) {
        this.user_bloodgroup = user_bloodgroup;
    }

    public String getUser_role() {
        return user_role;
    }

    public void setUser_role(String user_role) {
        this.user_role = user_role;
    }

    public String getUser_profile() {
        return user_profile;
    }

    public void setUser_profile(String user_profile) {
        this.user_profile = user_profile;
    }
}

