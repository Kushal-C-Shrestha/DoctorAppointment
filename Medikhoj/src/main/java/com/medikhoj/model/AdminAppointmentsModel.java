package com.medikhoj.model;

public class AdminAppointmentsModel {
	private int appointment_id;
    private String appointment_title;
    private String appointment_date;
    private String appointment_time;
    private String appointment_status;
    private String user_name;
    private String doctor_name;

    public AdminAppointmentsModel() {
    }

    public AdminAppointmentsModel(int appointment_id, String appointment_title, String appointment_date, String appointment_time, String appointment_status,
                                  String user_name, String doctor_name) {
        this.appointment_id = appointment_id;
        this.appointment_title = appointment_title;
        this.appointment_date = appointment_date;
        this.appointment_time = appointment_time;
        this.appointment_status = appointment_status;
        this.user_name = user_name;
        this.doctor_name = doctor_name;
    }

    public int getAppointmentId() {
        return appointment_id;
    }

    public void setAppointmentId(int appointment_id) {
        this.appointment_id = appointment_id;
    }

    public String getAppointmentTitle() {
        return appointment_title;
    }

    public void setAppointmentTitle(String appointment_title) {
        this.appointment_title = appointment_title;
    }

    public String getAppointmentDate() {
        return appointment_date;
    }

    public void setAppointmentDate(String appointment_date) {
        this.appointment_date = appointment_date;
    }

    public String getAppointmentTime() {
        return appointment_time;
    }

    public void setAppointmentTime(String appointment_time) {
        this.appointment_time = appointment_time;
    }
    
    public String getAppointmentStatus() {
        return appointment_status;
    }

    public void setAppointmentStatus(String appointment_status) {
        this.appointment_status = appointment_status;
    }

    public String getUserName() {
        return user_name;
    }

    public void setUserName(String user_name) {
        this.user_name = user_name;
    }

    public String getDoctorName() {
        return doctor_name;
    }

    public void setDoctorName(String doctor_name) {
        this.doctor_name = doctor_name;
    }
}
