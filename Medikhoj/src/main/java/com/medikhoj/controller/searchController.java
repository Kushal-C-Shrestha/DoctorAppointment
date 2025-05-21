package com.medikhoj.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.cert.TrustAnchor;
import java.util.List;

import com.medikhoj.model.DoctorUserModel;
import com.medikhoj.service.DoctorService;

/**
 * Servlet implementation class searchController
 */
@WebServlet(asyncSupported = true, urlPatterns = "/search")
public class searchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name=request.getParameter("doctorSearch");
		String[] specialization=request.getParameterValues("specialization");
		String experience=request.getParameter("experience");
		String sortOrder=request.getParameter("sort");
		
		
		DoctorService doctorService=new DoctorService();
		
		List <DoctorUserModel> doctors=doctorService.searchDoctors(name, specialization, experience,sortOrder);
		
		request.setAttribute("doctorList", doctors);
		request.getRequestDispatcher("WEB-INF/pages/doctors.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
