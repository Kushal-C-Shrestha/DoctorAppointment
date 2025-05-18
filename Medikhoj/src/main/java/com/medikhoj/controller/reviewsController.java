package com.medikhoj.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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
		int user_id=0;
		String action= request.getParameter("action");
		
		DoctorService doctorService = new DoctorService();
	    UserService userService = new UserService();
	    ReviewService reviewService = new ReviewService();
	    
    	int doctor_id = Integer.parseInt(request.getParameter("doctor_id"));

        HttpSession session = request.getSession(false); // don't create a new session if none exists
        if (session != null) {
            UserModel loggedInUser = (UserModel) session.getAttribute("loggedInUser");
            if (loggedInUser != null) {
                user_id = loggedInUser.getUser_id(); // get user ID from session object
            }
        }


        DoctorModel doctor = doctorService.getDoctorProfile(doctor_id);
        UserModel user = userService.getUser(user_id);

        request.setAttribute("doctor", doctor);
        request.setAttribute("user", user);
        
		if("seeReview".equals(action)) {
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
		int user_id=0;
		HttpSession session = request.getSession(false); // don't create a new session if none exists
        if (session != null) {
            UserModel loggedInUser = (UserModel) session.getAttribute("loggedInUser");
            if (loggedInUser != null) {
                user_id = loggedInUser.getUser_id(); // get user ID from session object
            }
        }
        
		String ratingParam = request.getParameter("rating");
        String reviewText = request.getParameter("reviewText");
        String doctorIdParam = request.getParameter("doctor_id");
        if (ratingParam == null || reviewText == null || doctorIdParam == null ||
                ratingParam.isEmpty() || reviewText.isEmpty() || doctorIdParam.isEmpty()) {
                response.sendRedirect("reviews?error=Missing+fields");
                return;
            }
       
        try {
        	int rating = Integer.parseInt(ratingParam);
            int doctorId = Integer.parseInt(doctorIdParam);
            
            ReviewService reviewService = new ReviewService();
            int generatedReviewId = reviewService.submitReview(rating, reviewText);

            if (generatedReviewId > 0) {
            	boolean linked = reviewService.insertUserDoctorReview(user_id, doctorId, generatedReviewId);
            	if (linked) {
            		response.sendRedirect("reviews?doctor_id=" + doctorId + "&success=true");
                } else {
                	response.sendRedirect("reviews?doctor_id=" + doctorId + "&error=Failed+to+link+review");
                }
            } else {
                response.sendRedirect("reviews?error=Could+not+submit+review");
            }

        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("reviews?error=Invalid+rating");
        }
	}

}













