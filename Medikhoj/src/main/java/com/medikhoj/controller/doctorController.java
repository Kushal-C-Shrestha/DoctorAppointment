package com.medikhoj.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.medikhoj.service.DoctorService;
import java.util.List;

import com.medikhoj.model.DoctorModel;
import com.medikhoj.model.DoctorUserModel;
/**
 * Servlet implementation class doctorController
 */
@WebServlet(asyncSupported=true, urlPatterns={"/doctors"})
public class doctorController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public doctorController() {
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
