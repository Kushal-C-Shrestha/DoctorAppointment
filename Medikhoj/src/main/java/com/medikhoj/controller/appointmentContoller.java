package com.medikhoj.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;
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

		HttpSession session=request.getSession(false);
		UserModel user=(UserModel) session.getAttribute("loggedInUser");
		
		int doctorId=Integer.parseInt(request.getParameter("doctor_id"));
		
		DoctorModel doctor=doctorService.getDoctorProfile(doctorId);

		UserModel doctorDetails=userService.getUser(doctorId);

		
		List <SlotModel> allSlots=appointmentService.getAllSlots();
		request.setAttribute("doctor", doctor);
		request.setAttribute("doctorFullDetails", doctorDetails);
		request.setAttribute("user", user);
		request.setAttribute("slots", allSlots);
		request.setAttribute("dateSelected", false);

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

		
		HttpSession session=request.getSession(false);
		UserModel user=(UserModel) session.getAttribute("loggedInUser");
		
		int doctorId=Integer.parseInt(request.getParameter("doctor_id"));
		
		String appointmentDateStr=request.getParameter("appointment_date");
		Boolean dateSelected=(appointmentDateStr!=null && !appointmentDateStr.isEmpty());
		request.setAttribute("dateSelected", dateSelected);
		
		if (dateSelected){
			
		}
		
		
		DoctorModel doctor=doctorService.getDoctorProfile(doctorId);
		UserModel doctorDetails=userService.getUser(doctorId);

		List <SlotModel> allSlots=appointmentService.getAllSlots();
		
		request.setAttribute("doctor", doctor);
		request.setAttribute("user", user);
		request.setAttribute("slots", allSlots);
		request.setAttribute("doctorFullDetails", doctorDetails);
		
		if (request.getParameter("action").equals("check")) {
			request.setAttribute("appointmentDate", appointmentDateStr);	
			LocalDate appointmentDate=LocalDate.parse(appointmentDateStr);
			
			Set <Integer> bookedSlots=appointmentService.getBookedSlots(doctorId, appointmentDate);
			if (bookedSlots!=null) {
				request.setAttribute("bookedSlots", bookedSlots);
			}
			request.getRequestDispatcher("WEB-INF/pages/appointment.jsp").forward(request, response);
		}
		
		if (request.getParameter("action").equals("book")) {
			Map <String,String> errorMap=appointmentService.validateAppointmentForm(request);
			if (!errorMap.isEmpty()) {
				request.setAttribute("errorMap", errorMap);
				request.getRequestDispatcher("WEB-INF/pages/appointment.jsp").forward(request, response);
				return;
			}
			
			AppointmentModel appointment=appointmentService.createAppointment(request);
			Boolean isBooked =appointmentService.bookAppointment(doctor, user, appointment);
			if (isBooked) {
				System.out.println("Appointment sucessfully booked");
				request.getRequestDispatcher("WEB-INF/pages/doctors.jsp").forward(request, response);
				return;
			}
		}
		
	}

}
