package com.medikhoj.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.medikhoj.model.AdminAppointmentsModel;
import com.medikhoj.service.AppointmentService;

/**
 * Servlet implementation class adminAppointments
 */
@WebServlet(asyncSupported = true,urlPatterns = "/adminAppointments")
public class adminAppointmentsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminAppointmentsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		AppointmentService appointmentService=new AppointmentService();
		
		List <AdminAppointmentsModel> AdminAppointmentsList=appointmentService.getAllAppointmentForAdmin();
		System.out.print("123"+AdminAppointmentsList);
		request.setAttribute("appointments", AdminAppointmentsList);
		request.getRequestDispatcher("WEB-INF/pages/admin/adminAppointments.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}