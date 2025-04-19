package com.medikhoj.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.medikhoj.service.DoctorProfileService;
import com.medikhoj.model.DoctorModel;
/**
 * Servlet implementation class doctorProfileController
 */
@WebServlet(asyncSupported=true, urlPatterns={"/doctorProfile"})
public class doctorProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public doctorProfileController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idParam=request.getParameter("doctorId");
		int id=Integer.parseInt(idParam);
		
		DoctorProfileService doctorProfileService=new DoctorProfileService();
		DoctorModel doctor=doctorProfileService.getDoctorById(id);
		// TODO Auto-generated method stub
		request.setAttribute("doctor", doctor);
		request.getRequestDispatcher("WEB-INF/pages/doctorProfile.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
