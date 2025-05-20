package com.medikhoj.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.medikhoj.model.ReviewDoctorModel;
import com.medikhoj.model.UserModel;
import com.medikhoj.service.ReviewService;

/**
 * Servlet implementation class doctorReviewsController
 */
@WebServlet(asyncSupported = true, urlPatterns = {"/doctorReviews"})
public class doctorReviewsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    /**
     * @see HttpServlet#HttpServlet()
     */
    public doctorReviewsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			HttpSession session=request.getSession(false);
			UserModel user=(UserModel) session.getAttribute("loggedInUser");
			
			ReviewService reviewService = new ReviewService();
			List<ReviewDoctorModel> docReviews = reviewService.getAllDoctorReviewsForDoctor(user.getUser_id());
			System.out.println("Total reviews fetched: " + (docReviews == null ? 0 : docReviews.size()));
		        for (ReviewDoctorModel review : docReviews) {
		            System.out.println("User: " + review.getUser_name()
		                    + ", Doctor: " + review.getDoctor_name()
		                    + ", Rating: " + review.getReview_rating());
		        }
		    
		    
		    //Set request attributes
		    if (docReviews == null || docReviews.isEmpty()) {
		        request.setAttribute("error", "No reviews found or database is down.");
		    } else {
		        request.setAttribute("doctorReviews", docReviews);   // attribute name for JSP
		    }

		 request.getRequestDispatcher("WEB-INF/pages/doctor/doctorReviews.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
