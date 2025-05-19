package com.medikhoj.service;

import com.medikhoj.model.SlotModel;
import com.medikhoj.model.UserModel;
import com.medikhoj.model.AppointmentModel;
import com.medikhoj.model.DoctorAppointmentModel;
import com.medikhoj.model.DoctorModel;
import com.medikhoj.config.DbConfig;

import jakarta.servlet.http.HttpServletRequest;

import java.sql.*;
import java.time.LocalDate;
import java.util.*;

public class AppointmentService {
    private Connection dbConn;
    private boolean isConnectionError = false;

    public AppointmentService() {
        try {
            this.dbConn = DbConfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            System.err.println("Database connection error: " + ex.getMessage());
            ex.printStackTrace();
            isConnectionError = true;
        }
    }

    public List<SlotModel> getAllSlots() {
        if (isConnectionError) {
            System.out.println("Database connection error");
            return null;
        }

        List<SlotModel> allSlots = new ArrayList<>();
        String query = "SELECT * FROM slots";

        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                SlotModel slot = new SlotModel();
                slot.setSlot_id(rs.getInt("slot_id"));
                slot.setSlot_time(rs.getTime("slot_time").toLocalTime());
                allSlots.add(slot);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return allSlots;
    }

    public Set<Integer> getBookedSlots(int doctor_id, LocalDate appointment_date) {
        if (isConnectionError) {
            System.out.println("Database connection error");
            return null;
        }

        Set<Integer> bookedSlots = new HashSet<>();
        String query = "SELECT a.appointment_time FROM " +
                       "user_doctor_appointment uda JOIN " +
                       "appointments a ON a.appointment_id = uda.appointment_id " +
                       "WHERE uda.doctor_id=? AND a.appointment_date=? ";

        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setInt(1, doctor_id);
            stmt.setDate(2, java.sql.Date.valueOf(appointment_date));
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                bookedSlots.add(rs.getInt("appointment_time"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return bookedSlots;
    }

    public AppointmentModel createAppointment(HttpServletRequest request) {
        AppointmentModel appointment = new AppointmentModel();
        LocalDate appointment_date = LocalDate.parse(request.getParameter("appointment_date"));
        int appointment_time = Integer.parseInt(request.getParameter("appointment_time"));
        String appointment_remarks = request.getParameter("appointment_remarks");
        String appointment_type = request.getParameter("appointment_type");
        String appointment_title = request.getParameter("appointment_title");

        appointment.setAppointment_date(appointment_date);
        appointment.setAppointment_time(appointment_time);
        appointment.setAppointment_type(appointment_type);
        appointment.setAppointment_remarks(appointment_remarks);
        appointment.setAppointment_title(appointment_title);
        appointment.setAppointment_status("pending");

        return appointment;
    }

    public Boolean bookAppointment(DoctorModel doctor, UserModel user, AppointmentModel appointment) {
        if (dbConn == null) {
            System.err.println("Database connection is not available.");
            return false;
        }

        String insertQuery = "INSERT INTO appointments (appointment_date, appointment_time, appointment_type, appointment_remarks, appointment_title, appointment_status) " +
                             "VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = dbConn.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setDate(1, java.sql.Date.valueOf(appointment.getAppointment_date()));
            stmt.setInt(2, appointment.getAppointment_time());
            stmt.setString(3, appointment.getAppointment_type());
            stmt.setString(4, null);
            stmt.setString(5, appointment.getAppointment_title());
            stmt.setString(6, appointment.getAppointment_status());

            int affectedRows = stmt.executeUpdate();

            if (affectedRows > 0) {
                ResultSet generatedKey = stmt.getGeneratedKeys();
                if (generatedKey.next()) {
                    int appointment_id = generatedKey.getInt(1);
                    appointment.setAppointment_id(appointment_id);

                    String newInsertQuery = "INSERT INTO user_doctor_appointment VALUES (?, ?, ?)";
                    try (PreparedStatement newStmt = dbConn.prepareStatement(newInsertQuery)) {
                        newStmt.setInt(1, user.getUser_id());
                        newStmt.setInt(2, doctor.getDoctor_id());
                        newStmt.setInt(3, appointment.getAppointment_id());
                        return newStmt.executeUpdate() > 0;
                    } catch (Exception e) {
                        System.out.println("Exception during bridge insertion: " + e.getMessage());
                        return false;
                    }
                }
                System.out.println("Appointment not created in bridge table");
                return false;
            }
            System.out.println("Appointment not created");
            return false;
        } catch (Exception e) {
            System.out.println("Exception during main insertion: " + e.getMessage());
            return false;
        }
    }

    public List<DoctorAppointmentModel> getAppointmentByUser(int user_id) {
        if (dbConn == null) {
            System.err.println("Database connection is not available.");
            return null;
        }

        List<DoctorAppointmentModel> appointmentList = new ArrayList<>();
        String query = "SELECT * FROM appointments a " +
                       "JOIN user_doctor_appointment uda ON a.appointment_id = uda.appointment_id " +
                       "JOIN doctors d ON d.doctor_id = uda.doctor_id " +
                       "JOIN users u ON u.user_id = d.doctor_id " +
                       "JOIN slots s ON a.appointment_time = s.slot_id " +
                       "WHERE uda.user_id = ?";

        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setInt(1, user_id);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                DoctorAppointmentModel dam = new DoctorAppointmentModel();
                dam.setUser_name(rs.getString("user_name"));
                dam.setAppointment_title(rs.getString("appointment_title"));
                dam.setAppointment_date(rs.getDate("appointment_date").toLocalDate());
                dam.setSlot_time(rs.getTime("slot_time").toLocalTime());
                dam.setAppointment_status(rs.getString("appointment_status"));
                dam.setAppointment_remarks(rs.getString("appointment_remarks"));
                dam.setAppointment_type(rs.getString("appointment_type"));
                appointmentList.add(dam);
            }
            return appointmentList;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<AppointmentModel> getAppointmentsForDoctor(int doctorId) {
        if (dbConn == null) {
            System.err.println("Database connection is not available.");
            return null;
        }

        List<AppointmentModel> appointments = new ArrayList<>();
        String query = "SELECT a.* FROM appointments a " +
                       "JOIN user_doctor_appointment uda ON a.appointment_id = uda.appointment_id " +
                       "WHERE uda.doctor_id = ?";

        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setInt(1, doctorId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                AppointmentModel appointment = new AppointmentModel();
                appointment.setAppointment_id(rs.getInt("appointment_id"));
                appointment.setAppointment_title(rs.getString("appointment_title"));
                appointment.setAppointment_date(rs.getDate("appointment_date").toLocalDate());
                appointment.setAppointment_time(rs.getInt("appointment_time"));
                appointment.setAppointment_type(rs.getString("appointment_type"));
                appointment.setAppointment_remarks(rs.getString("appointment_remarks"));
                appointment.setAppointment_status(rs.getString("appointment_status"));
                appointments.add(appointment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return appointments;
    }
}
