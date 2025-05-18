package com.medikhoj.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.medikhoj.model.HighestAppointments;
import com.medikhoj.model.HighestRated;
import com.medikhoj.model.StatsCard;
import com.medikhoj.model.UpcomingAppointments;
import com.medikhoj.service.DashboardService;

/**
 * Servlet implementation class dashboard
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/dashboard" })
public class DashboardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DashboardController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DashboardService dashboardService=new DashboardService();
		
		List <StatsCard> statsList=dashboardService.getAllStats();
		Map<String,Integer> barGraphData=dashboardService.getBarChartData();
		Map<String,Integer> lineGraphData=dashboardService.getLineChartData();
		List<HighestAppointments> highestAppointed=dashboardService.getHighestAppointedDoctors();
		List<HighestRated> highestrated=dashboardService.getHighestRatedDoctors();
		List<UpcomingAppointments> upcomingAppointments=dashboardService.getUpcomingAppointments();
		

		request.setAttribute("statsList", statsList);
		request.setAttribute("barGraphData", barGraphData);
		request.setAttribute("lineGraphData", lineGraphData);
		request.setAttribute("highestAppointed", highestAppointed);
		request.setAttribute("highestrated", highestrated);
		request.setAttribute("upcomingAppointments", upcomingAppointments);
		request.getRequestDispatcher("WEB-INF/pages/admin/dashboard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
