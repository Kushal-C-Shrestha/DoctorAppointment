package com.medikhoj.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.medikhoj.model.DoctorUserModel;
import com.medikhoj.model.UserModel;
import com.medikhoj.service.DoctorService;

/**
 * Servlet implementation class adminDoctor
 */
@WebServlet(asyncSupported = true,urlPatterns = "/adminDoctor")
public class adminDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminDoctor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DoctorService doctorService=new DoctorService();
		
		List<DoctorUserModel> doctors=doctorService.getAllDoctors();
		
		if (doctors==null) {
			request.setAttribute("error", "Database is down. Please try again in a few minutes.");
		}
		
		HttpSession session = request.getSession(false); // don't create a new session if none exists
        if (session != null) {
            //for popups
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
		request.setAttribute("doctorList", doctors);
		request.getRequestDispatcher("WEB-INF/pages/admin/adminDoctor.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
