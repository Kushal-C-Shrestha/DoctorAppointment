<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/doctorOwnProfile.css"/></head>

</head>
<body>
<main>
	<%@ include file="doctorNav.jsp" %>

      <div class="profile-container">
        <h1>My Profile</h1>
        
        <div class="profile-image-name">
          <img src="/api/placeholder/60/60" alt="Doctor profile picture" class="profile-image">
          <div class="profile-name">Slesha Rawal</div>
        </div>
        
        <div class="section-divider"></div>
        
        <div class="info-section">
          <h2 class="section-title">Personal Information</h2>
          <div class="info-grid">
            <div class="info-item">
              <div class="info-label">First Name</div>
              <div class="info-value">Slesha</div>
            </div>
            
            <div class="info-item">
              <div class="info-label">Last Name</div>
              <div class="info-value">Rawal</div>
            </div>
            
            <div class="info-item">
              <div class="info-label">Date of birth</div>
              <div class="info-value">180/01/01</div>
            </div>
            
            <div class="info-item">
              <div class="info-label">Blood Group</div>
              <div class="info-value">A positive</div>
            </div>
            
            <div class="info-item">
              <div class="info-label">Gender</div>
              <div class="info-value">Mahila</div>
            </div>
          </div>
        </div>
        
        <div class="section-divider"></div>
        
        <div class="info-section">
          <h2 class="section-title">Account Information</h2>
          <div class="info-grid">
            <div class="info-item">
              <div class="info-label">Phone number</div>
              <div class="info-value">+977-9841222222</div>
            </div>
            
            <div class="info-item">
              <div class="info-label">Email</div>
              <div class="info-value">sleshasiswa@gmail.com</div>
            </div>
          </div>
        </div>
      </div>
    </main>
    
    <script>
      const navLinks = document.querySelectorAll(".nav-link a");
      navLinks.forEach((link) => {
        link.addEventListener("click", () => {
          navLinks.forEach((link) => {
            link.classList.remove("active");
          });
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
</body>
</html>