package com.medikhoj.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import com.medikhoj.service.CampaignsService;
import com.medikhoj.util.CookieUtil;
import com.medikhoj.util.SessionUtil;
import com.medikhoj.model.CampaignModel;
import com.medikhoj.model.UserModel;

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
		HttpSession session=request.getSession(false);
		CampaignsService campaignService=new CampaignsService();
		List <CampaignModel> campaigns=campaignService.getAllCampaigns();
		
		if (campaigns==null) {
			request.setAttribute("error", "Database is down. Please try again in a few minutes.");
		}
		
		if(session!=null) {
			String showPopup = (String) session.getAttribute("showPopup");
		    if ("true".equals(showPopup)) {
		        String title = (String) session.getAttribute("popupTitle");
		        String message = (String) session.getAttribute("popupMessage");

		        request.setAttribute("showPopup", true); // pass to JSP
		        request.setAttribute("popupTitle", title);
		        request.setAttribute("popupMessage", message);

		        // Clear the session attributes so it doesn't show again on refresh
		        session.removeAttribute("showPopup");
		        session.removeAttribute("popupTitle");
		        session.removeAttribute("popupMessage");
		    }
		}
		
		request.setAttribute("campaigns", campaigns);
		request.getRequestDispatcher("WEB-INF/pages/campaigns.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession(false);
		UserModel user = (UserModel) session.getAttribute("loggedInUser");
		if (user != null) {
			String userRole = user.getUser_role();

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
		        session.setAttribute("showPopup","true");
		        if (alreadyEnrolled) {
		            // If user is already enrolled, redirect to campaigns page with a message
		    		session.setAttribute("popupTitle", "Information");
		    		session.setAttribute("popupMessage", "You are already enrolled this campaign.");
		    		response.sendRedirect("campaigns");
		            return;
		        }
		        boolean enrolled = service.enrollUserInCampaign(userId, campaignId);
	
		        if (enrolled) {
		    		session.setAttribute("popupTitle", "Success");
		    		session.setAttribute("popupMessage", "Your have been enrolled to the campaign successfully.");
		    		response.sendRedirect("campaigns");
		        } else {
		    		session.setAttribute("popupTitle", "Error");
		    		session.setAttribute("popupMessage", "Database error, please try again later.");
		    		response.sendRedirect("campaigns");
		        }
		    } catch (NumberFormatException e) {
		        System.err.println("[ERROR] Invalid ID format:");
		        e.printStackTrace();
		        response.sendRedirect("campaigns?error=invalidData");
		    }
		}
	}
}


