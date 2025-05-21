<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<c:set var="page" value="reviews"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminReviews.css"/></head>
</head>
<body>
	<%@ include file="adminNav.jsp" %>

<!-- Main Content -->
  <div class="main-content">
    <div class="page-header">
      <h1 class="page-title">Reviews</h1>
      <div class="user-profile">
        <div class="user-avatar">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2"></path>
            <circle cx="12" cy="7" r="4"></circle>
          </svg>
        </div>
      </div>
    </div>

<<<<<<< HEAD
=======

>>>>>>> branch 'main' of https://github.com/Kushal-C-Shrestha/DoctorAppointment.git
<div class="reviews-container">
  <c:forEach var="review" items="${allReviews}">
    <div class="review-card">
      <div class="review-header">
        <div class="reviewer">
          <div class="reviewer-avatar">A</div>
          <div class="reviewer-info">
            <h3>${review.user_name}</h3>
            <p>${review.review_date}</p>
          </div>
        </div>
        <div class="reviews-actions">
          <form action="deleteReview" method="post">
            <input type="hidden" name="reviewId" value="${review.review_id}" />
            <button class="delete-btn" type="submit">
              <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="trash-icon">
                <path d="M3 6h18"></path>
                <path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6"></path>
                <path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2"></path>
              </svg>
              Delete
            </button>
          </form>
        </div>
      </div>
      <div class="doctor-info">Doctor: ${review.doctor_name}</div>
      <div class="star-rating">
        <c:forEach begin="1" end="${review.review_rating}" var="i">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="currentColor" stroke="none">
            <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z" />
          </svg>
        </c:forEach>
      </div>
      <p class="user-review">${review.review_desc}</p>
    </div>
  </c:forEach>
</div>
</div>

  <script>
    // JavaScript for sidebar toggle
    let admindoc_menu_icon = document.querySelector(".nav .navbar-top svg");
    let admindoc_menu = document.querySelector(".nav");
    let admindoc_cont = document.querySelector(".nav-links__container");
    let mainContent = document.querySelector(".main-content");

    admindoc_menu_icon.onclick = () => {
      admindoc_menu.classList.toggle('close');
      admindoc_cont.classList.toggle('close');
      mainContent.style.marginLeft = admindoc_menu.classList.contains('close') ? '52px' : '300px';
      mainContent.style.width = admindoc_menu.classList.contains('close') ? 'calc(100% - 52px)' : 'calc(100% - 300px)';
    }

    // JavaScript for navigation links
    const navLinks = document.querySelectorAll(".nav-link a");
    navLinks.forEach((link) => {
      link.addEventListener("click", () => {
        navLinks.forEach((link) => {
          link.classList.remove("active");
        });
        link.classList.add("active");
      });
    });
  </script>
</body>
</html>