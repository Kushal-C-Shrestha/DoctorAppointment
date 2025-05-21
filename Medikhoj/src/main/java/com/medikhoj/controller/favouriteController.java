package com.medikhoj.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.medikhoj.service.FavoriteService;
import com.medikhoj.service.ReviewService;

/**
 * Servlet implementation class favouriteController
 */
@WebServlet(asyncSupported=true, urlPatterns={"/favourite"})
public class favouriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public favouriteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//int doctorId = Integer.parseInt(request.getParameter("doctor_id"));
		//response.sendRedirect(request.getContextPath() + "/doctorProfile?doctorId="+doctorId);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean isAdded=false;
		String doctorIdparam=request.getParameter("doctor_id");
		String userIdparam=request.getParameter("user_id");
		String favouriteState=request.getParameter("favouriteState");
		
		
		if (doctorIdparam == null || userIdparam == null || favouriteState == null ||
			doctorIdparam.isEmpty() || userIdparam.isEmpty() || favouriteState.isEmpty()) {
			System.out.print("Missing Fields");
            return;
        }
		
		int doctorId = Integer.parseInt(doctorIdparam);
        int userId = Integer.parseInt(userIdparam);
        
        FavoriteService FavoriteService = new FavoriteService();
       
		
        if ("add".equals(favouriteState)) {
        	isAdded= FavoriteService.addtoFavourite(userId,doctorId);
		}else {
			isAdded= FavoriteService.removeFavourite(userId,doctorId);
		}
        
        if (!isAdded) {
            // log and show error
            System.out.println("Favorite operation failed.");
            return;
        }
        response.sendRedirect(request.getContextPath() + "/doctorProfile?doctorId="+doctorId);
	}

}
