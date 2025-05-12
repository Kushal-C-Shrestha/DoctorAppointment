package com.medikhoj.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.medikhoj.model.UserReviewModel;
import com.medikhoj.model.UserDoctorReview;
import com.medikhoj.service.ReviewService;

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
		int doctor_id=Integer.parseInt(request.getParameter("doctor_id"));
		ReviewService reviewService=new ReviewService();
		
		List<UserReviewModel> userReviews=reviewService.getReviewsByDoctor(doctor_id);
		
		request.setAttribute("reviewList",userReviews);
		request.getRequestDispatcher("WEB-INF/pages/reviews.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String ratingParam = request.getParameter("rating");
        String reviewText = request.getParameter("reviewText");
		System.out.print("Rating"+ratingParam);
		System.out.print("Text"+reviewText);
        if (ratingParam == null || reviewText == null || ratingParam.isEmpty() || reviewText.isEmpty()) {
            response.sendRedirect("reviews.jsp?error=Missing+fields");
            return;
        }

        try {
            int rating = Integer.parseInt(ratingParam);
            ReviewService service = new ReviewService();

            boolean success = service.submitReview(rating, reviewText);

            if (success) {
                response.sendRedirect("reviews?success=true");
            } else {
                response.sendRedirect("reviews?error=Could+not+submit+review");
            }

        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("reviews?error=Invalid+rating");
        }
	}

}













