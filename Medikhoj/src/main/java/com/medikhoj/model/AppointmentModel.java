package com.medikhoj.model;

import java.time.LocalDate;

public class AppointmentModel {
    private int appointment_id;
    private LocalDate appointment_date;
    private int appointment_time; // This is the slot_id (foreign key)
    private String appointment_remarks;
    private String appointment_type;
    private String appointment_title;
    private String appointment_status;
    private String formatted_time; // NEW: this stores formatted time like "09:00 AM"

    public AppointmentModel() {}

    public AppointmentModel(int appointment_id, LocalDate appointment_date, int appointment_time,
                            String appointment_remarks, String appointment_type,
                            String appointment_title, String appointment_status,
                            String formatted_time) {
        this.appointment_id = appointment_id;
        this.appointment_date = appointment_date;
        this.appointment_time = appointment_time;
        this.appointment_remarks = appointment_remarks;
        this.appointment_type = appointment_type;
        this.appointment_title = appointment_title;
        this.appointment_status = appointment_status;
        this.formatted_time = formatted_time;
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

    public String getFormatted_time() {
        return formatted_time;
    }

    public void setFormatted_time(String formatted_time) {
        this.formatted_time = formatted_time;
    }
}
