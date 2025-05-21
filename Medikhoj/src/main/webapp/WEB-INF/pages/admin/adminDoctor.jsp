<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
       <c:set var="page" value="doctors"></c:set>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminDoctor.css"/></head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/popup.css">

</head>
<body>
	<%@ include file="adminNav.jsp" %>

<!-- Main Content -->
  <div class="main-content">
    <div class="page-header">
      <h1 class="page-title">Doctors</h1>
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
      <a href="addDoctor">
      <button class="add-doctor-btn">
        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
          <line x1="12" y1="5" x2="12" y2="19"></line>
          <line x1="5" y1="12" x2="19" y2="12"></line>
        </svg>
        Add Doctors
      </button>
      </a>
    </div>

    <div class="doctor-list">
     <c:forEach var="doctors" items="${doctorList}">
      <div class="doctor-card">
        <div class="doctor-header">
          <div class="doctor-avatar">
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2"></path>
              <circle cx="12" cy="7" r="4"></circle>
            </svg>
          </div>
          <div class="doctor-name">${doctors.user_name}</div>
        </div>
        <p class="doctor-bio">${doctors.user_email}</p>
        <p class="doctor-bio">${doctors.user_phone}</p>
        <p class="doctor-bio">${doctors.doctor_specialization}</p>
        <div class="doctor-actions">
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
     </c:forEach>

    

      
      
      <!-- You can add more doctor cards here -->
    </div>
  </div>

<c:if test="${showPopup}">
		<div class="modal-container show" id="modalContainer">
		    <div class="modal">
		        <div class="modal-icon" id="modalIcon">
		        	<!-- Show success icon if it's a success popup -->
			        <c:if test="${popupTitle == 'Success'}">
			            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" stroke="none" class="success-icon">
			                <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-2 15l-5-5 1.41-1.41L10 14.17l7.59-7.59L19 8l-9 9z"/>
			            </svg>
			        </c:if>
			        
			        <!-- Show error icon if it's an error popup -->
			        <c:if test="${popupTitle== 'Error'}">
			            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" stroke="none" class="error-icon">
			                <path d="M12 2C6.47 2 2 6.47 2 12s4.47 10 10 10 10-4.47 10-10S17.53 2 12 2zm5 13.59L15.59 17 12 13.41 8.41 17 7 15.59 10.59 12 7 8.41 8.41 7 12 10.59 15.59 7 17 8.41 13.41 12 17 15.59z"/>
			            </svg>
			        </c:if>
		        </div>
		        <div class="modal-title" id="modalTitle">${popupTitle}</div>
		        <div class="modal-message" id="modalMessage">${popupMessage}</div>
		        <div class="modal-actions">
		            <button class="close-button" id="closeModal">Close</button>
		        </div>
		    </div>
		</div>
	</c:if>
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
    
    
    
    const modalContainer = document.getElementById('modalContainer');
	const closeModal = document.getElementById('closeModal');
	
	// Function to hide the modal
	function hideModal() {
	    modalContainer.classList.remove('show');
	}
	
	// Close modal when close button is clicked
	closeModal.addEventListener('click', hideModal);
	
	// Close modal when clicking outside the modal content
	modalContainer.addEventListener('click', (event) => {
	    if (event.target === modalContainer) {
	        hideModal();
	    }
	});
	
	// Close modal when pressing the ESC key
	document.addEventListener('keydown', (event) => {
	    if (event.key === 'Escape' && modalContainer.classList.contains('show')) {
	        hideModal();
	    }
	});
  </script>
</body>
</html>