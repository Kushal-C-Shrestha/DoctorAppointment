package com.medikhoj.controller;

import com.medikhoj.model.DoctorUserModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.medikhoj.model.DoctorAppointmentModel;
import com.medikhoj.model.ReviewDoctorModel;
import com.medikhoj.model.CampaignUserModel;

import com.medikhoj.model.UserModel;
import com.medikhoj.service.AppointmentService;
import com.medikhoj.service.FavoriteService;
import com.medikhoj.service.ReviewService;
import com.medikhoj.service.CampaignsService;


/**
 * Servlet implementation class profileController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/profile" })
public class profileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public profileController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String section=request.getParameter("section");
		section=section==null? "appointments" : section;
		request.setAttribute("section", section);
		
		
		HttpSession session=request.getSession(false);
		if (session==null) {
			request.getRequestDispatcher("WEB-INF/pages/login.jsp").forward(request, response);
		}
		
		AppointmentService appointmentService=new AppointmentService();
		ReviewService reviewService=new ReviewService();
		FavoriteService favoriteService=new FavoriteService();
		CampaignsService campaignsService=new CampaignsService();
		
		UserModel user=(UserModel) session.getAttribute("loggedInUser");
		
		//Fetching the appointments according to user.
		List <DoctorAppointmentModel> appointmentList=appointmentService.getAppointmentByUser(user.getUser_id());
		if (appointmentList==null) {
			request.getRequestDispatcher("WEB-INF/pages/myProfile.jsp").forward(request, response);
		}
		List <DoctorAppointmentModel> pendingAppointments=new ArrayList<DoctorAppointmentModel>();
		List <DoctorAppointmentModel> completedAppointments=new ArrayList<DoctorAppointmentModel>();
		
		for (DoctorAppointmentModel dam:appointmentList) {
			if(dam.getAppointment_status().equals("pending")) {
				pendingAppointments.add(dam);
			}else {
				completedAppointments.add(dam);
			}
		}
		
		//Fetching the reviews according to user.
		List <ReviewDoctorModel> reviewsList=reviewService.getReviewsByUser(user.getUser_id());
		if (reviewsList==null) {
			request.getRequestDispatcher("WEB-INF/pages/myProfile.jsp").forward(request, response);
		}
		
		//Fetching the reviews according to user.
		List <DoctorUserModel> favoriteList=favoriteService.getFavoritesByUser(user.getUser_id());
		if (favoriteList==null) {
			request.getRequestDispatcher("WEB-INF/pages/myProfile.jsp").forward(request, response);
		}
		
		List <CampaignUserModel> enrollmentList=campaignsService.getEnrollmentsByUser(user.getUser_id());
		if (enrollmentList==null) {
			request.getRequestDispatcher("WEB-INF/pages/myProfile.jsp").forward(request, response);
		}
		
		request.setAttribute("pendingAppointments", pendingAppointments);
		request.setAttribute("completedAppointments", completedAppointments);
		request.setAttribute("reviewList", reviewsList);
		request.setAttribute("favoriteList", favoriteList);
		request.setAttribute("enrollmentList", enrollmentList);

		request.setAttribute("user",user);
		request.getRequestDispatcher("WEB-INF/pages/myProfile.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
