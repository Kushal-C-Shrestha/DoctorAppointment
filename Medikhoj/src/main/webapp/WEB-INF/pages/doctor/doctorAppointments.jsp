<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/doctorAppointments.css"/></head>

</head>
<body>
	<%@ include file="doctorNav.jsp" %>
   <!-- Main Content -->
  <div class="main-content">
    <div class="page-header">
      <h1 class="page-title">My Appointments</h1>
      <div class="user-profile">
        <div class="user-avatar">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2"></path>
            <circle cx="12" cy="7" r="4"></circle>
          </svg>
        </div>
      </div>
    </div>

    <div class="search-add">
      <div class="search-bar">
        <input type="text" placeholder="Search">
        <button>
          <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <circle cx="11" cy="11" r="8"></circle>
            <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
          </svg>
        </button>
      </div>
    </div>

    <div class="appoint-list">
      <div class="appoint-card">
        <div class="appoint-header">
          <div class="appoint-avatar">
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2"></path>
              <circle cx="12" cy="7" r="4"></circle>
            </svg>
          </div>
          <div class="appoint-name">Anugrah Chor</div>
        </div>
        <p class="appoint-bio">abc@gmail.com</p>
        <p class="appoint-bio">2025/05/10</p>
        <div class="appoint-actions">
           <button class="edit-btn">
            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="pencil-icon">
              <path d="M17 3a2.85 2.85 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5Z"></path>
            </svg>
            Edit
          </button>
          <button class="delete-btn">
            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="trash-icon">
              <path d="M3 6h18"></path>
              <path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6"></path>
              <path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2"></path>
            </svg>
            Delete
          </button>
        </div>
      </div>


      
      
      <!-- You can add more doctor cards here -->
    </div>
  </div>

    <script>
      const navLinks = document.querySelectorAll(".nav-link a");
      navLinks.forEach((link) => {
        link.addEventListener("click", () => {
          navLinks.forEach((link) => {
            link.classList.remove("active");
            console.log("Removed");
          });
          link.classList.add("active");
        });
      });


      let admindoc_menu_icon=document.querySelector(".nav .navbar-top svg");
      let admindoc_menu=document.querySelector(".nav");
      let admindoc_cont=document.querySelector(".nav-links__container");

      admindoc_menu_icon.onclick = () => {
        admindoc_menu.classList.toggle('close');
        admindoc_cont.classList.toggle('close');
      }
    </script>
  </body>
</body>
</html>