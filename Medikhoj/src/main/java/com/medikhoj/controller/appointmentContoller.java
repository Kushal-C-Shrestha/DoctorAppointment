package com.medikhoj.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import com.medikhoj.model.AppointmentModel;
import com.medikhoj.model.DoctorModel;
import com.medikhoj.model.SlotModel;
import com.medikhoj.model.UserModel;
import com.medikhoj.service.DoctorService;
import com.medikhoj.service.UserService;
import com.medikhoj.service.AppointmentService;


/**
 * @author Kushal Chandra Shrestha
 * Servlet implementation class appointmentContoller
 */
@WebServlet(asyncSupported =true,urlPatterns = "/appointment")
public class appointmentContoller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public appointmentContoller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DoctorService doctorService=new DoctorService();
		UserService userService=new UserService();
		AppointmentService appointmentService=new AppointmentService();

		
		int doctorId=Integer.parseInt(request.getParameter("doctor_id"));
		int userId=Integer.parseInt(request.getParameter("user_id"));
		System.out.println(doctorId);
		
		DoctorModel doctor=doctorService.getDoctorProfile(doctorId);
		System.out.println(doctor==null?"Null" :"not null");

		UserModel user=userService.getUser(userId);
		UserModel doctorDetails=userService.getUser(doctorId);

		
		List <SlotModel> allSlots=appointmentService.getAllSlots();
		request.setAttribute("doctor", doctor);
		request.setAttribute("doctorFullDetails", doctorDetails);
		request.setAttribute("user", user);
		request.setAttribute("slots", allSlots);

		request.getRequestDispatcher("WEB-INF/pages/appointment.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DoctorService doctorService=new DoctorService();
		UserService userService=new UserService();
		AppointmentService appointmentService=new AppointmentService();

		int doctorId=Integer.parseInt(request.getParameter("doctor_id"));
		int userId=Integer.parseInt(request.getParameter("user_id"));
		
		String appointmentDateStr=request.getParameter("appointment_date");
		Boolean dateSelected=(appointmentDateStr!=null && !appointmentDateStr.isEmpty());
		request.setAttribute("dateSelected", dateSelected);
		
		if (dateSelected){
			request.setAttribute("appointmentDate", appointmentDateStr);	
			LocalDate appointmentDate=LocalDate.parse(appointmentDateStr);
			
			Set <Integer> bookedSlots=appointmentService.getBookedSlots(doctorId, appointmentDate);
			if (bookedSlots!=null) {
				request.setAttribute("bookedSlots", bookedSlots);
			}
		}
		
		
		DoctorModel doctor=doctorService.getDoctorProfile(doctorId);
		UserModel user=userService.getUser(userId);
		UserModel doctorDetails=userService.getUser(doctorId);

		List <SlotModel> allSlots=appointmentService.getAllSlots();
		
		request.setAttribute("doctor", doctor);
		request.setAttribute("user", user);
		request.setAttribute("slots", allSlots);
		request.setAttribute("doctorFullDetails", doctorDetails);
		
		if (request.getParameter("action").equals("check")) {
			request.getRequestDispatcher("WEB-INF/pages/appointment.jsp").forward(request, response);
		}
		
		if (request.getParameter("action").equals("book")) {
			String appointmentTimeStr=request.getParameter("appointment_time");
			
			if (appointmentTimeStr==null) {
				request.getRequestDispatcher("WEB-INF/pages/appointment.jsp").forward(request, response);
			}
			
			if (appointmentTimeStr!=null && !appointmentTimeStr.isEmpty()) {
				AppointmentModel appointment=appointmentService.createAppointment(request);
				Boolean isBooked =appointmentService.bookAppointment(doctor, user, appointment);
				
				if (isBooked) {
					System.out.println("Appointment sucessfully booked");
					request.getRequestDispatcher("WEB-INF/pages/home.jsp").forward(request, response);
				}

			}
		}
		
	}

}
