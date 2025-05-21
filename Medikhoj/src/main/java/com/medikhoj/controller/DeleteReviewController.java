package com.medikhoj.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.medikhoj.service.ReviewService;

/**
 * Servlet implementation class deleteReview
 */
@WebServlet("/deleteReview")
public class DeleteReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReviewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		try {
            int reviewId = Integer.parseInt(request.getParameter("reviewId"));

            ReviewService reviewService = new ReviewService();
            boolean isDeleted = reviewService.deleteReview(reviewId);

            if (isDeleted) {
                System.out.println("Review deleted successfully: ID = " + reviewId);
            } else {
                System.out.println("Failed to delete review: ID = " + reviewId);
            }

            response.sendRedirect("adminReviews");

        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("adminReviews");
        }
	}

}
