package com.medikhoj.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Map;

import com.medikhoj.config.DbConfig;
import com.medikhoj.model.DoctorUserModel;
import com.medikhoj.service.DoctorService;
import com.medikhoj.service.UpdateService;
import com.medikhoj.util.PasswordUtil;

/**
 * Servlet implementation class editAdminDoctor
 */
@WebServlet("/editAdminDoctor")
public class editAdminDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editAdminDoctor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int doctor_id = Integer.parseInt(request.getParameter("doctor_id"));
		DoctorService service = new DoctorService();
		DoctorUserModel docdetails= service.getFullDoctorDetails(doctor_id);
		String decryptedPassword = PasswordUtil.decrypt(docdetails.getUser_password(), docdetails.getUser_email());

		request.setAttribute("decryptedPassword", decryptedPassword);
		request.setAttribute("doctor", docdetails);
		request.getRequestDispatcher("WEB-INF/pages/admin/editAdminDoctor.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int doctorId = Integer.parseInt(request.getParameter("doctor_id")); // Ensure this hidden field is in your form
	    String name = request.getParameter("doctor_name");
	    String specialization = request.getParameter("doctor_specialization");
	    String qualification = request.getParameter("doctor_qualification");
	    String experience = request.getParameter("doctor_experience");
	    String about = request.getParameter("doctor_about");
	    String dob = request.getParameter("doctor_dob");
	    String email = request.getParameter("doctor_email");
	    String phone = request.getParameter("doctor_phone");
	    String gender = request.getParameter("doctor_gender");
	    String bloodgroup = request.getParameter("doctor_bloodgroup");
	    String password = request.getParameter("doctor_password");

	    Connection dbConn = null;
	    PreparedStatement stmt1 = null;
	    PreparedStatement stmt2 = null;
	    boolean isConnectionError = false;

	    try {
	        dbConn = DbConfig.getDbConnection();
	    } catch (SQLException | ClassNotFoundException ex) {
	        isConnectionError = true;
	        System.err.println("Database connection error: " + ex.getMessage());
	        ex.printStackTrace();
	    }

	    if (!isConnectionError) {
	        try {
	            // Update users table
	            String sql1 = "UPDATE users SET user_name=?, user_email=?, user_phone=?, user_gender=?, user_bloodgroup=?, user_password=?, user_dob=? WHERE user_id=?";
	            stmt1 = dbConn.prepareStatement(sql1);
	            stmt1.setString(1, name);
	            stmt1.setString(2, email);
	            stmt1.setString(3, phone);
	            stmt1.setString(4, gender);
	            stmt1.setString(5, bloodgroup);
	            String encryptedPassword = PasswordUtil.encrypt(email, password); 
	            stmt1.setString(6, encryptedPassword); 
	            stmt1.setString(7, dob);
	            stmt1.setInt(8, doctorId);
	            int rows1 = stmt1.executeUpdate();

	            // Update doctors table
	            String sql2 = "UPDATE doctors SET doctor_specialization=?, doctor_qualification=?, doctor_experience=?, doctor_desc=? WHERE doctor_id=?";
	            stmt2 = dbConn.prepareStatement(sql2);
	            stmt2.setString(1, specialization);
	            stmt2.setString(2, qualification);
	            stmt2.setString(3, experience);
	            stmt2.setString(4, about);
	            stmt2.setInt(5, doctorId);
	            int rows2 = stmt2.executeUpdate();

	            if (rows1 > 0 && rows2 > 0) {
	                response.sendRedirect("adminDoctor?update=success");
	            } else {
	            	response.sendRedirect("adminDoctor?update=failed");
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	            response.sendRedirect("adminDoctor?update=failed");
	        } finally {
	            try { if (stmt1 != null) stmt1.close(); } catch (Exception e) { e.printStackTrace(); }
	            try { if (stmt2 != null) stmt2.close(); } catch (Exception e) { e.printStackTrace(); }
	            try { if (dbConn != null) dbConn.close(); } catch (Exception e) { e.printStackTrace(); }
	        }
	    }

	}
}
