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

        // 1. Get session and check if doctor is logged in
        HttpSession session = request.getSession(false);
        UserModel user = (session != null) ? (UserModel) session.getAttribute("loggedInUser") : null;

        if (user == null || !"doctor".equals(user.getUser_role())) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // 2. Retrieve appointments for the logged-in doctor
        AppointmentService appointmentService = new AppointmentService();
        List<AppointmentModel> appointments = appointmentService.getAppointmentsForDoctor(user.getUser_id());

        // 3. Set appointment list in request scope
        request.setAttribute("appointments", appointments);

        // 4. Forward to JSP for display
        request.getRequestDispatcher("/WEB-INF/pages/doctorAppointment.jsp").forward(request, response);
    }
}
