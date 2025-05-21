package com.medikhoj.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.medikhoj.model.DoctorUserModel;
import com.medikhoj.model.UserModel;
import com.medikhoj.service.DoctorService;
import com.medikhoj.service.FavoriteService;
import com.medikhoj.service.UserService;
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
		int user_id=0;
		UserService userService = new UserService();
		
		HttpSession session = request.getSession(false); // don't create a new session if none exists
        if (session != null) {
            UserModel loggedInUser = (UserModel) session.getAttribute("loggedInUser");
            //for popups
            Boolean showPopup = (Boolean) session.getAttribute("showPopup");
		    if (Boolean.TRUE.equals(showPopup)) {
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
            if (loggedInUser != null) {
                user_id = loggedInUser.getUser_id(); // get user ID from session object
            }
        }
        
		UserModel user = userService.getUser(user_id);
		int id;
		if (session.getAttribute("doctorId")!=null) {
			id=(Integer)(session.getAttribute("doctorId"));
		}else {
			id=Integer.parseInt(request.getParameter("doctorId")) ;
		}
		DoctorService doctorProfileService=new DoctorService();
		DoctorUserModel doctor=doctorProfileService.getFullDoctorDetails(id);
		
		FavoriteService favoriteService = new FavoriteService();
		boolean isFavorite = favoriteService.isDoctorFavorited(user_id, id);
		request.setAttribute("isFavorite", isFavorite);
		request.setAttribute("doctor", doctor);
		request.setAttribute("user", user);
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
