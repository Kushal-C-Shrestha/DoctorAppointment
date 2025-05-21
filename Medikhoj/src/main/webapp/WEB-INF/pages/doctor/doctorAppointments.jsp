<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.medikhoj.model.AppointmentModel" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Appointments</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/doctorAppointments.css"/>
</head>

<body>
<%@ include file="doctorNav.jsp" %>

<div class="main-content">
  <div class="page-header">
    <h1 class="page-title">My Appointments</h1>
    <div class="user-profile">
      <div class="user-avatar">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2">
          <path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2"></path>
          <circle cx="12" cy="7" r="4"></circle>
        </svg>
      </div>
    </div>
  </div>

  <!-- Search Bar -->
  <div class="search-add">
    <div class="search-bar">
      <input type="text" id="searchInput" placeholder="Search by title" onkeyup="filterAppointments()">
      <button>
        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <circle cx="11" cy="11" r="8"></circle>
          <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
        </svg>
      </button>
    </div>
  </div>

  <div class="appoint-list" id="appointmentList">
    <% List<AppointmentModel> appointments = (List<AppointmentModel>) request.getAttribute("appointments");
       if (appointments != null && !appointments.isEmpty()) {
         for (AppointmentModel app : appointments) {
    %>
    <div class="appoint-card">
      <div class="appoint-header">
        <div class="appoint-avatar">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-width="2">
            <path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2"></path>
            <circle cx="12" cy="7" r="4"></circle>
          </svg>
        </div>
        <div class="appoint-name"><%= app.getAppointment_title() %></div>
      </div>
      <p class="appoint-bio">Date: <%= app.getAppointment_date() %></p>
      <p class="appoint-bio">Time Slot ID: <%= app.getAppointment_time() %></p>
      <p class="appoint-bio">Type: <%= app.getAppointment_type() %></p>
      <p class="appoint-bio">Status: <%= app.getAppointment_status() %></p>
      <div class="appoint-actions">
        <button class="edit-btn">Edit</button>
        <button class="delete-btn">Delete</button>
      </div>
    </div>
    <% }} else { %>
    <p style="margin: 1rem;">No appointments found.</p>
    <% } %>
  </div>
</div>

<script>
  const navLinks = document.querySelectorAll(".nav-link a");
  navLinks.forEach((link) => {
    link.addEventListener("click", () => {
      navLinks.forEach((link) => link.classList.remove("active"));
      link.classList.add("active");
    });
  });

  let admindoc_menu_icon = document.querySelector(".nav .navbar-top svg");
  let admindoc_menu = document.querySelector(".nav");
  let admindoc_cont = document.querySelector(".nav-links__container");

  admindoc_menu_icon.onclick = () => {
    admindoc_menu.classList.toggle('close');
    admindoc_cont.classList.toggle('close');
  }


</script>

</body>
</html>
