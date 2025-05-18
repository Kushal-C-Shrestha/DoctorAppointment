package com.medikhoj.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.medikhoj.model.UserReviewModel;
import com.medikhoj.model.DoctorModel;
import com.medikhoj.model.SlotModel;
import com.medikhoj.model.UserDoctorReview;
import com.medikhoj.model.UserModel;
import com.medikhoj.service.AppointmentService;
import com.medikhoj.service.DoctorService;
import com.medikhoj.service.ReviewService;
import com.medikhoj.service.UserService;

/**
 * Servlet implementation class reviewsController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/reviews"})
public class reviewsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public reviewsController() {
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
		request.setAttribute("user", user);
		
		String action= request.getParameter("action");
		if("seeReview".equals(action)) {
			ReviewService reviewService=new ReviewService();
			int doctor_id=Integer.parseInt(request.getParameter("doctor_id"));
			List<UserReviewModel> userReviews=reviewService.getReviewsByDoctor(doctor_id);
			
			request.setAttribute("reviewList",userReviews);
			request.getRequestDispatcher("WEB-INF/pages/reviews.jsp").forward(request, response);
			return;
		}else {
			request.getRequestDispatcher("WEB-INF/pages/leaveReviews.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//int doctor_id=Integer.parseInt(request.getParameter("doctor_id"));
//		DoctorService doctorService=new DoctorService();
//		UserService userService=new UserService();
//		AppointmentService appointmentService=new AppointmentService();
		
		String ratingParam = request.getParameter("rating");
        String reviewText = request.getParameter("reviewText");
		System.out.print("Rating"+ratingParam);
		System.out.print("Text"+reviewText);
        if (ratingParam == null || reviewText == null || ratingParam.isEmpty() || reviewText.isEmpty()) {
            response.sendRedirect("reviews?error=Missing+fields");
            return;
        }
//        DoctorModel doctor=doctorService.getDoctorProfile(doctorId);
//		UserModel user=userService.getUser(userId);
//		UserModel doctorDetails=userService.getUser(doctorId);
//
//		List <SlotModel> allSlots=appointmentService.getAllSlots();
//		
//		request.setAttribute("doctor", doctor);
//		request.setAttribute("user", user);
//		request.setAttribute("slots", allSlots);
//		request.setAttribute("doctorFullDetails", doctorDetails);
//        try {
//            int rating = Integer.parseInt(ratingParam);
//            ReviewService service = new ReviewService();
//
//            boolean success = service.submitReview(rating, reviewText);
//
//            if (success) {
//                response.sendRedirect("reviews?success=true");
//            } else {
//                response.sendRedirect("reviews?error=Could+not+submit+review");
//            }
//
//        } catch (NumberFormatException e) {
//            e.printStackTrace();
//            response.sendRedirect("reviews?error=Invalid+rating");
//        }
	}

}













