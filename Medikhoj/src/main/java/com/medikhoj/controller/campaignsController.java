package com.medikhoj.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.medikhoj.service.CampaignsService;
import com.medikhoj.util.CookieUtil;
import com.medikhoj.model.CampaignModel;
import java.util.List;

/**
 * Servlet implementation class campaignsController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/campaigns"})
public class campaignsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public campaignsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		CampaignsService campaignService=new CampaignsService();
		List <CampaignModel> campaigns=campaignService.getAllCampaigns();
		
		if (campaigns==null) {
			request.setAttribute("error", "Database is down. Please try again in a few minutes.");
		}
		
		request.setAttribute("campaigns", campaigns);
		request.getRequestDispatcher("WEB-INF/pages/campaigns.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String userRole = CookieUtil.getCookie(request, "user_role");

	    // Allow only users to enroll
	    if (userRole == null || !userRole.equals("user")) {
	        response.sendRedirect("unauthorized.jsp");
	        return;
	    }
	    String userIdParam = request.getParameter("user_id");
	    String campaignIdParam = request.getParameter("campaign_id");

	    // Validate input parameters
	    if (userIdParam==null || campaignIdParam==null) {
	        response.sendRedirect("campaigns?error=missingParameters");
	        return;
	    }

	    try {
	        int userId = Integer.parseInt(userIdParam);
	        int campaignId = Integer.parseInt(campaignIdParam);

	        CampaignsService service = new CampaignsService();
	        boolean alreadyEnrolled = service.isUserEnrolledInCampaign(userId, campaignId);
	        if (alreadyEnrolled) {
	            // If user is already enrolled, redirect to campaigns page with a message
	            response.sendRedirect("campaigns?error=alreadyEnrolled");
	            return;
	        }
	        boolean enrolled = service.enrollUserInCampaign(userId, campaignId);

	        if (enrolled) {
	            response.sendRedirect("campaigns?success=true");
	        } else {
	            response.sendRedirect("campaigns?error=enrollmentFailed");
	        }
	    } catch (NumberFormatException e) {
	        System.err.println("[ERROR] Invalid ID format:");
	        e.printStackTrace();
	        response.sendRedirect("campaigns?error=invalidData");
	    }
	}
}


