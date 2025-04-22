package com.medikhoj.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.medikhoj.service.CampaignsService;
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
		
		request.setAttribute("campaigns", campaigns);
		request.getRequestDispatcher("WEB-INF/pages/campaigns.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
