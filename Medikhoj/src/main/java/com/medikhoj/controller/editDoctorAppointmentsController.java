package com.medikhoj.controller;

import com.medikhoj.model.AppointmentModel;
import com.medikhoj.model.SlotModel;
import com.medikhoj.service.AppointmentService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/editAppointment")
public class editDoctorAppointmentsController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public editDoctorAppointmentsController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int appointmentId = Integer.parseInt(request.getParameter("appointment_id"));
        AppointmentService service = new AppointmentService();

        AppointmentModel appointment = service.getAppointmentById(appointmentId);
        List<SlotModel> slots = service.getAllSlots(); // Fetch available time slots

        request.setAttribute("appointment", appointment);
        request.setAttribute("slots", slots);

        request.getRequestDispatcher("/WEB-INF/pages/doctor/editAppointment.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int appointmentId = Integer.parseInt(request.getParameter("appointment_id"));
        String action = request.getParameter("action");

        AppointmentService service = new AppointmentService();

        if ("complete".equals(action)) {
            service.markAppointmentCompleted(appointmentId);
        } else {
            // Get updated fields from the form
            String title = request.getParameter("appointment_title");
            String type = request.getParameter("appointment_type");
            String status = request.getParameter("appointment_status");
            LocalDate date = LocalDate.parse(request.getParameter("appointment_date"));
            int time = Integer.parseInt(request.getParameter("appointment_time"));

            AppointmentModel updated = new AppointmentModel();
            updated.setAppointment_id(appointmentId);
            updated.setAppointment_title(title);
            updated.setAppointment_type(type);
            updated.setAppointment_status(status);
            updated.setAppointment_date(date);
            updated.setAppointment_time(time);

            service.updateAppointment(updated);
        }

        response.sendRedirect(request.getContextPath() + "/doctorAppointments");
    }
}
