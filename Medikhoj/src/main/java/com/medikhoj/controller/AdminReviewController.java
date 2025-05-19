package com.medikhoj.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.medikhoj.model.ReviewDoctorModel;
import com.medikhoj.service.ReviewService;

/**
 * Servlet implementation class AdminReview
 */
@WebServlet(asyncSupported = true, urlPatterns = {"/adminReviews"})
public class AdminReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminReviewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 	ReviewService reviewService = new ReviewService();
	        List<ReviewDoctorModel> allReviews = reviewService.getAllDoctorReviewsForAdmin();
	        System.out.println("Total reviews fetched: " + allReviews.size());
	        for (ReviewDoctorModel review : allReviews) {
	            System.out.println("User: " + review.getUser_name() + ", Doctor: " + review.getDoctor_name() + ", Rating: " + review.getReview_rating());
	        }
	        
	        if (allReviews == null || allReviews.isEmpty()) {
	    		request.setAttribute("error", "No reviews found or database is down.");
	    	} else {
	    		request.setAttribute("allReviews", allReviews);
	    	}
	        request.getRequestDispatcher("WEB-INF/pages/admin/adminReviews.jsp").forward(request, response);
	    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
