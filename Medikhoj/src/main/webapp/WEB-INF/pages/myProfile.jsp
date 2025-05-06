<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/myProfile.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
</head>
<body>
<%@ include file="header.jsp" %>
<div class="container">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="sidebar-logo">
                <div class="logo">M</div>
                <div class="logo-text">MedCare</div>
            </div>
            
            <div class="menu-section">
                <div class="menu-header">Overview</div>
                <a href="profile?section=appointments" class="menu-item ${section == 'appointments' ? 'active' : ''}">
                    <div class="menu-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                            <line x1="16" y1="2" x2="16" y2="6"></line>
                            <line x1="8" y1="2" x2="8" y2="6"></line>
                            <line x1="3" y1="10" x2="21" y2="10"></line>
                        </svg>
                    </div>
                    Appointments
                </a>
                <a href="profile?section=doctors" class="menu-item ${section == 'doctors' ? 'active' : ''}">
                    <div class="menu-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path>
                        </svg>
                    </div>
                    My Doctors
                </a>
                <a href="profile?section=reviews" class="menu-item ${section == 'reviews' ? 'active' : ''}">
                    <div class="menu-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <polygon points="12 2 15 8.5 22 9.3 17 14 18.5 21 12 17.8 5.5 21 7 14 2 9.3 9 8.5 12 2"></polygon>
                          </svg>                          
                    </div>
                    My Reviews
                </a>
                 <a href="profile?section=enrollments" class="menu-item ${section == 'enrollments' ? 'active' : ''}">
                    <div class="menu-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
						  <path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2" />
						  <circle cx="9" cy="7" r="4" />
						  <line x1="19" y1="8" x2="19" y2="14" />
						  <line x1="22" y1="11" x2="16" y2="11" />
						</svg>

                    </div>
                    My Enrollments
                </a>
            </div>
            
            <div class="menu-section">
                <div class="menu-header">Settings</div>
                <a href="profile?section=details" class="menu-item ${section == 'details' ? 'active' : ''}">
                    <div class="menu-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                            <circle cx="12" cy="7" r="4"></circle>
                        </svg>
                    </div>
                    Profile
                </a>
                <a href="#" class="menu-item">
                    <div class="menu-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
                            <polyline points="16 17 21 12 16 7"></polyline>
                            <line x1="21" y1="12" x2="9" y2="12"></line>
                        </svg>
                    </div>
                    Logout
                </a>
            </div>
            
            <div class="user-section">
                <div class="user-avatar">RP</div>
                <div class="user-info">
                    <div class="user-name">Raj Patel</div>
                    <div class="user-role">Patient</div>
                </div>
            </div>
        </div>
        
        <!-- Main Content -->
        <c:choose>
        	<c:when test="${section=='appointments'}">
		        <div class="main-content">
			        <div class="header">
			            <h1 class="page-title">My Appointments</h1>
			        </div>
		            
			        <div class="tabs">
					    <div class="tab active" data-tab="pending">
					        Upcoming 
					        <span class="tab-count">${fn:length(pendingAppointments)}</span>
					    </div>
					    <div class="tab" data-tab="completed">
					        Past 
					        <span class="tab-count">${fn:length(completedAppointments)}</span>
					    </div>
					</div>
		            
			        <!-- Pending Appointments -->
			        <div class="tab-content active" id="pending-tab">
			        <c:choose>
			        <c:when test="${fn:length(pendingAppointments)==0 }">
			        	<p>No pending appointments</p>
			        </c:when>
			        <c:otherwise>
			            <div class="appointments-grid">
			                <!-- Appointment Card 1 -->
			                <c:forEach var="appointment" items="${pendingAppointments }">
			        		
			                <div class="appointment-card">
			                    <div class="appointment-card-header">
			                        <h3 class="appointment-title">${appointment.appointment_title}</h3>
			                        <div class="appointment-status pending">
			                            <span class="appointment-status-dot pending"></span>
			                            ${appointment.appointment_status}
			                        </div>
			                    </div>
			                    <div class="appointment-details">
			                        <div class="detail-item">
			                            <div class="detail-icon">
			                                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
			                                    <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
			                                    <line x1="16" y1="2" x2="16" y2="6"></line>
			                                    <line x1="8" y1="2" x2="8" y2="6"></line>
			                                    <line x1="3" y1="10" x2="21" y2="10"></line>
			                                </svg>
			                            </div>
			                            <div class="detail-content">
			                                <div class="detail-label">Date</div>
			                                <div class="detail-value">${appointment.appointment_date}</div>
			                            </div>
			                        </div>
			                        <div class="detail-item">
			                            <div class="detail-icon">
			                                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
			                                    <rect x="3" y="4" width="18" height="12" rx="2" ry="2"></rect>
			                                    <line x1="3" y1="20" x2="21" y2="20"></line>
			                                    <line x1="12" y1="16" x2="12" y2="20"></line>
			                                </svg>
			                            </div>
			                            <div class="detail-content">
			                                <div class="detail-label">Type</div>
			                                <div class="detail-value">${appointment.appointment_type }</div>
			                            </div>
			                        </div>
			                        <div class="detail-item">
			                            <div class="detail-icon">
			                                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
			                                    <circle cx="12" cy="12" r="10"></circle>
			                                    <polyline points="12 6 12 12 16 14"></polyline>
			                                </svg>
			                            </div>
			                            <div class="detail-content">
			                                <div class="detail-label">Time</div>
			                                <div class="detail-value">${appointment.slot_time }</div>
			                            </div>
			                        </div>
			                        <div class="detail-item">
			                            <div class="detail-icon">
			                                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
			                                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
			                                    <circle cx="12" cy="7" r="4"></circle>
			                                </svg>
			                            </div>
			                            <div class="detail-content">
			                                <div class="detail-label">Doctor</div>
			                                <div class="detail-value">${appointment.user_name}</div>
			                            </div>
			                        </div>
			                    </div>
			                    <div class="appointment-actions">
			                        <a href="#" class="action-link">
			                            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
			                                <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
			                                <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
			                            </svg>
			                            Reschedule
			                        </a>
			                    </div>
			                </div>
			                </c:forEach>
			            </div>
			            
			        </c:otherwise>
			        </c:choose>
			        </div>
			        
		
		            <!-- Completed Appointments -->
		            
			        <div class="tab-content" id="completed-tab">
			         <c:choose>
			        <c:when test="${fn:length(completedAppointments)==0 }">
			        	<p>No completed appointments</p>
			        </c:when>
			        <c:otherwise>
			            <div class="appointments-grid">
			            <c:forEach var="appointment" items="${completedAppointments}">
			                <!-- Appointment Card 1 -->
			                <div class="appointment-card">
			                    <div class="appointment-card-header">
			                        <h3 class="appointment-title">${appointment.appointment_title}</h3>
			                        <div class="appointment-status completed">
			                            <span class="appointment-status-dot completed"></span>
			                            ${appointment.appointment_status}
			                        </div>
			                    </div>
			                    <div class="appointment-details">
			                        <div class="detail-item">
			                            <div class="detail-icon">
			                                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
			                                    <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
			                                    <line x1="16" y1="2" x2="16" y2="6"></line>
			                                    <line x1="8" y1="2" x2="8" y2="6"></line>
			                                    <line x1="3" y1="10" x2="21" y2="10"></line>
			                                </svg>
			                            </div>
			                            <div class="detail-content">
			                                <div class="detail-label">Date</div>
			                                <div class="detail-value">${appointment.appointment_date }</div>
			                            </div>
			                        </div>
			                        <div class="detail-item">
			                            <div class="detail-icon">
			                                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
			                                    <rect x="3" y="4" width="18" height="12" rx="2" ry="2"></rect>
			                                    <line x1="3" y1="20" x2="21" y2="20"></line>
			                                    <line x1="12" y1="16" x2="12" y2="20"></line>
			                                </svg>
			                            </div>
			                            <div class="detail-content">
			                                <div class="detail-label">Type</div>
			                                <div class="detail-value">${appointment.appointment_type }</div>
			                            </div>
			                        </div>
			                        <div class="detail-item">
			                            <div class="detail-icon">
			                                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
			                                    <circle cx="12" cy="12" r="10"></circle>
			                                    <polyline points="12 6 12 12 16 14"></polyline>
			                                </svg>
			                            </div>
			                            <div class="detail-content">
			                                <div class="detail-label">Time</div>
			                                <div class="detail-value">${appointment.slot_time }</div>
			                            </div>
			                        </div>
			                        <div class="detail-item">
			                            <div class="detail-icon">
			                                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
			                                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
			                                    <circle cx="12" cy="7" r="4"></circle>
			                                </svg>
			                            </div>
			                            <div class="detail-content">
			                                <div class="detail-label">Doctor</div>
			                                <div class="detail-value">${appointment.user_name}</div>
			                            </div>
			                        </div>
			                    </div>
			                    <div class="appointment-actions">
			                        <a href="#" class="action-link">
			                            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
			                                <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
			                                <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
			                            </svg>
			                            Reschedule
			                        </a>
			                    </div>
			                </div>
			                </c:forEach>
			            </div>
			             </c:otherwise>
			        	</c:choose>
			        </div>
		        </div>
        	</c:when>
        	<c:when test="${section=='doctors'}">
        	    <div class="main-content">
        	    
        	        <div class="header">
                        <h1 class="page-title">My Doctors</h1>
                    </div>
                    <c:choose>
		        	    <c:when test="${fn:length(favoriteList)==0}">
		        	    	<p>No favorite doctors</p>
		        	    </c:when>
		        	    <c:otherwise>
		        	    	
		        	    </c:otherwise>
        	    	</c:choose>
                    <!-- Add doctor content here -->
                </div>
        	</c:when>
        	<c:when test="${section=='reviews'}">
        	    <div class="main-content">
        	        <div class="header">
                        <h1 class="page-title">My Reviews</h1>
                    </div>
                    <c:choose>
                    	<c:when test="${fn:length(reviewList)==0}">
		        	    	<p>No reviews</p>
		        	    </c:when>
		        	    <c:otherwise>
		        	    	
		        	    </c:otherwise>
                    </c:choose>
                    	
                    <!-- Add reviews content here -->
                </div>
        	</c:when>
        	<c:when test="${section=='enrollments'}">
        	    <div class="main-content">
        	        <div class="header">
                        <h1 class="page-title">My Enrollments</h1>
                    </div>
                    <!-- Add campaigns content here -->
                    <c:choose>
                    	<c:when test="${fn:length(enrollmentList)==0}">
		        	    	<p>No enrollments</p>
		        	    </c:when>
		        	    <c:otherwise>
		        	    	
		        	    </c:otherwise>
                    </c:choose>
                </div>
        	</c:when>
        	<c:when test="${section=='details'}">
        	    <div class="main-content">
        	        <div class="header">
                        <h1 class="page-title">My Details</h1>
                    </div>
                    <!-- Add profile details content here -->
                    
                </div>
        	</c:when>
        	<c:otherwise>
        	    <div class="main-content">
        	        <div class="header">
                        <h1 class="page-title">Welcome to Your Dashboard</h1>
                    </div>
                    <div class="content-section">
                        <p>Please select a section from the sidebar to view your information.</p>
                    </div>
                </div>
        	</c:otherwise>
        </c:choose>
    </div>
    <script>
 // Wait for the DOM to be fully loaded
 document.addEventListener('DOMContentLoaded', function() {
	 
     // Find all tab elements
     const tabs = document.querySelectorAll('.tab');
     console.log(tabs)
     
     // Add click handler to each tab
     tabs.forEach(tab => {
         tab.addEventListener('click', function() {
        	 console.log(tab)
             const tabId = this.getAttribute('data-tab');
        	 console.log(tabId)
             switchTabContent(tabId);
         });
     });
     
     // Function to switch tab content
     function switchTabContent(tabId) {
         // 1. Handle the tab buttons
         tabs.forEach(tab => {
             if (tab.getAttribute('data-tab') === tabId) {
                 tab.classList.add('active');
             } else {
                 tab.classList.remove('active');
             }
         });
         
         // 2. Handle the tab content
         const allContent = document.querySelectorAll('.tab-content');
         allContent.forEach(content => {
             if (content.id === tabId + '-tab') {
                 content.classList.add('active');
             } else {
                 content.classList.remove('active');
             }
         });
     }
     
     // Initialize with the pending tab active
     switchTabContent('pending');
 });
 </script>
</body>
</html>
