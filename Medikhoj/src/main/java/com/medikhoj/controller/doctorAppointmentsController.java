package com.medikhoj.controller;

import com.medikhoj.model.AppointmentModel;
import com.medikhoj.model.UserModel;
import com.medikhoj.service.AppointmentService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/doctorAppointment")
public class doctorAppointmentsController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public doctorAppointmentsController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Get current session
        HttpSession session = request.getSession(false);
        UserModel user = (session != null) ? (UserModel) session.getAttribute("loggedInUser") : null;

        // 2. Redirect to login if no doctor is logged in
        if (user == null || !"doctor".equals(user.getUser_role())) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // 3. Fetch appointments for this doctor
        AppointmentService appointmentService = new AppointmentService();
        List<AppointmentModel> appointments = appointmentService.getAppointmentsForDoctor(user.getUser_id());

        // 4. Set appointments in request scope
        request.setAttribute("appointments", appointments);

        // 5. Forward to JSP (ensure this path exists)
        request.getRequestDispatcher("/WEB-INF/pages/doctor/doctorAppointments.jsp").forward(request, response);

    }
}
