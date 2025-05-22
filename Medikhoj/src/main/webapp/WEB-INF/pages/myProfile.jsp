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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/popup.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    
</head>
<body>
<%@ include file="header.jsp" %>

<div class="container">
        <!-- Sidebar -->
        <div class="sidebar">
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
                <a href="logout" class="menu-item">
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
        </div>
        
        <!-- Main Content -->
        <div class="main-content">
        	<c:choose>
        		<c:when test="${section=='appointments'}">
				        <div class="page-header">
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
        		</c:when>
        		<c:when test="${section=='doctors'}">
        	        <div class="page-header">
                        <h1 class="page-title">My Doctors</h1>
                    </div>
                    <c:choose>
		        	    <c:when test="${fn:length(favoriteList)==0}">
		        	    	<p>No favorite doctors</p>
		        	    </c:when>
		        	    <c:otherwise>
		        	    	<div class="doctor-list">
							    <c:forEach var="favoriteList" items="${favoriteList}">
							      <div class="doctor-card">
							        <div class="doctor-header">
							          <div class="doctor-name">${favoriteList.user_name}</div>
							        </div>
							       	<p class="appoint-bio">${favoriteList.user_email}</p>
							       	<p class="appoint-bio">${favoriteList.user_phone}</p>
							       	<a href="${pageContext.request.contextPath}/doctorProfile?doctorId=${favoriteList.doctor_id}">Go to profile</a>
							      </div>
							      <br>
							     </c:forEach>
							</div>		        	    	
		        	    </c:otherwise>
        	    	</c:choose>
                    <!-- Add doctor content here -->
        		</c:when>
        		<c:when test="${section=='reviews'}">
        	        <div class="page-header">
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
        		</c:when>
        		<c:when test="${section=='enrollments'}">
        	        <div class="page-header">
                        <h1 class="page-title">My Enrollments</h1>
                    </div>
                    <!-- Add campaigns content here -->
                    <c:choose>
                    	<c:when test="${fn:length(enrollmentList)==0}">
		        	    	<p>No enrollments</p>
		        	    </c:when>
		        	    <c:otherwise>
		        	    	<div class="enrollments-section">
							    <c:forEach var="enrollment" items="${enrollmentList}">
							        <div class="enrollment-card">
							            <h3>${enrollment.campaign_name}</h3>
							            <p class="enrollment-detail"><strong>Date:</strong> ${enrollment.campaign_date}</p>
							            <p class="enrollment-detail"><strong>Time:</strong> ${enrollment.campaign_time}</p>
							            <p class="enrollment-detail"><strong>Description:</strong> ${enrollment.campaign_desc}</p>
							        </div>
							    </c:forEach>
							</div>

		        	    </c:otherwise>
                    </c:choose>
        		</c:when>
        		
				<c:when test="${section=='details'}">
				        <div class="page-header">
				            <h1 class="page-title">My Details</h1>
				            <div class="details-action_buttons">
					            <button id="viewProfileBtn" class="view-button">
								    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
								        <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
								        <circle cx="12" cy="12" r="3"></circle>
								    </svg>
								    View Profile
								</button>
					            
					            
					            <button id="changePasswordBtn" class="password-button">
								    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
								        <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
								        <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
								    </svg>
							    	Change Password
								</button>
					            
					            <button id="editProfileBtn" class="edit-button">
					                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
					                    <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
					                    <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
					                </svg>
					                Edit Profile
					            </button>
				            </div>
				            
				        </div>
				        
				        <div class="profile-container">
				            <div class="profile-header">
				                <div class="profile-avatar">
				                    <div class="avatar-circle">RP</div>
				                </div>
				                <div class="profile-info">
				                    <h2>${user.user_name}</h2>
				                    <p>Patient</p>
				                </div>
				            </div>
				            
				            <div class="profile-details" id="viewProfileSection" style="display: ${subSection=='viewDetailsSection' ? 'block' : 'none'}">
				                <div class="detail-row">
				                    <div class="detail-group">
				                        <label>Full Name</label>
				                        <p>${user.user_name}</p>
				                    </div>
				                    <div class="detail-group">
				                        <label>Blood Group</label>
				                        <p>${user.user_bloodgroup}</p>
				                    </div>
				                </div>
				                
				                <div class="detail-row">
				                    <div class="detail-group">
				                        <label>Gender</label>
				                        <p>${user.user_gender}</p>
				                    </div>
				                    <div class="detail-group">
				                        <label>Email</label>
				                        <p>${user.user_email}</p>
				                    </div>
				                </div>
				                
				                <div class="detail-row">
				                    <div class="detail-group">
				                        <label>Date of Birth</label>
				                        <p>${user.user_dob}</p>
				                    </div>
				                </div>
				                
				                <div class="detail-row">
				                    <div class="detail-group">
				                        <label>Phone</label>
				                        <p>${user.user_phone}</p>
				                    </div>
				                    <div class="detail-group">
				                        <label>Password</label>
				                        <p>••••••••</p>
				                    </div>
				                </div>
				            </div>
				            
				            <div class="profile-form" id="editProfileSection" style="display: ${subSection=='editProfileSection' ? 'block' : 'none'}">
				                <form action="updateProfile" method="post" enctype="multipart/form-data">
				                	<input name="action" value="edit" type="hidden"/>
				                    <div class="form-row">
				                        <div class="form-group">
				                            <label for="userName">Full Name</label>
				                            <input type="text" id="userName" name="fullName" value="${user.user_name}" >
											<c:if test="${not empty errorMap['fullname']}">
				                            	<p class="error-message">${errorMap['fullname']}</p>
				                            </c:if>					                        
				                        </div>
				                        <div class="form-group">
				                            <label for="bloodGroup">Blood Group</label>
				                            <select id="bloodGroup" name="bloodGroup">
				                                <option value="A+" ${user.user_bloodgroup == 'A+' ? 'selected' : ''}>A+</option>
				                                <option value="A-" ${user.user_bloodgroup == 'A-' ? 'selected' : ''}>A-</option>
				                                <option value="B+" ${user.user_bloodgroup == 'B+' ? 'selected' : ''}>B+</option>
				                                <option value="B-" ${user.user_bloodgroup == 'B-' ? 'selected' : ''}>B-</option>
				                                <option value="AB+" ${user.user_bloodgroup == 'AB+' ? 'selected' : ''}>AB+</option>
				                                <option value="AB-" ${user.user_bloodgroup == 'AB-' ? 'selected' : ''}>AB-</option>
				                                <option value="O+" ${user.user_bloodgroup == 'O+' ? 'selected' : ''}>O+</option>
				                                <option value="O-" ${user.user_bloodgroup == 'O-' ? 'selected' : ''}>O-</option>
				                            </select>
				                            <c:if test="${not empty errorMap['bloodgroup']}">
				                            	<p class="error-message">${errorMap['bloodgroup']}</p>
				                            </c:if>	
				                        </div>
				                    </div>
				                    
				                    <div class="form-row">
				                        <div class="form-group">
				                            <label for="gender">Gender</label>
				                            <select id="gender" name="gender">
				                                <option value="Male" ${user.user_gender == 'Male' ? 'selected' : ''}>Male</option>
				                                <option value="Female" ${user.user_gender == 'Female' ? 'selected' : ''}>Female</option>
				                                <option value="Other" ${user.user_gender == 'Other' ? 'selected' : ''}>Other</option>
				                            </select>
				                            <c:if test="${not empty errorMap['gender']}">
				                            	<p class="error-message">${errorMap['gender']}</p>
				                            </c:if>	
				                        </div>
				                        <div class="form-group">
				                            <label for="email">Email</label>
				                            <input type="email" id="email" name="email" value="${user.user_email}" >
				                            <c:if test="${not empty errorMap['email']}">
				                            	<p class="error-message">${errorMap['email']}</p>
				                            </c:if>
				                        </div>
				                    </div>
				                    
				                    <div class="form-row">
				                        <div class="form-group">
				                            <label for="dob">Date of Birth</label>
				                            <input type="date" id="dob" name="dob" value="${user.user_dob}" >
				                            <c:if test="${not empty errorMap['dob']}">
				                            	<p class="error-message">${errorMap['dob']}</p>
				                            </c:if>	
				                        </div>
				                        <div class="form-group">
				                            <label for="phone">Phone</label>
				                            <input type="tel" id="phone" name="phone" value="${user.user_phone}" >
											<c:if test="${not empty errorMap['phone']}">
				                            	<p class="error-message">${errorMap['phone']}</p>
				                            </c:if>				                            
				                        </div>
				                    </div>
				                    
				                     <div class="form-row">
				                        <div class="form-group">
				                            <label for="avatar">Profile picture</label>
				                            <input type="file" id="profile-pic" name="profile-pic">
				                            <c:if test="${not empty errorMap['image']}">
				                            	<p class="error-message">${errorMap['image']}</p>
				                            </c:if>	
				                            
				                        </div>
				                    </div>
				                    
				                    
				                    <div class="form-actions">
				                        <button type="button" class="cancel-button">Cancel</button>
				                        <button type="submit" class="save-button">Save Changes</button>
				                    </div>
				                </form>
				            </div>
				            
				           <div class="profile-form" id="changePasswordSection" style="display: ${subSection=='changePasswordSection' ? 'block' : 'none'}">

				            	<c:if test="${not empty error}">
				            		<p>${error}</p>
				            	</c:if>
				            	
				            	<c:if test="${not empty success}">
				            		<p>${success}</p>
				            	</c:if>
				            	
				            	<form action="updateProfile" method="post">
								    <input type="hidden" name="action" value="pw"/>
								    <div class="form-row">
								        <div class="form-group">
								            <label for="currentPassword">Current Password</label>
								            <div class="input-wrapper">
								                <input type="password" id="currentPassword" name="currentPassword" value="${current_password}" class="${not empty errorMap['currentPassword'] ? 'error' : ''}">
								                <i class="fas fa-eye toggle-password" aria-label="Show current password" onclick="togglePasswordIcons('currentPassword', this)" style="display:none;"></i>
								                <i class="fas fa-eye-slash toggle-password" aria-label="Hide current password" onclick="togglePasswordIcons('currentPassword', this)"></i>
								            </div>
								            <c:if test="${not empty errorMap['currentPassword']}">
								                <p class="error-message">${errorMap['currentPassword']}</p>
								            </c:if>
								        </div>
								        <div class="form-group">
								            <label for="newPassword">New Password</label>
								            <div class="input-wrapper">
								                <input type="password" id="newPassword" name="newPassword" value="${new_password}" class="${not empty errorMap['newPassword'] ? 'error' : ''}">
								                <i class="fas fa-eye toggle-password" aria-label="Show new password" onclick="togglePasswordIcons('newPassword', this)" style="display:none;"></i>
								                <i class="fas fa-eye-slash toggle-password" aria-label="Hide new password" onclick="togglePasswordIcons('newPassword', this)"></i>
								            </div>
								            <c:if test="${not empty errorMap['newPassword']}">
								                <p class="error-message">${errorMap['newPassword']}</p>
								            </c:if>
								        </div>
								    </div>
								
								    <div class="form-actions">
								        <button type="button" class="cancel-button">Cancel</button>
								        <button type="submit" class="save-button">Save Changes</button>
								    </div>
								</form>


				            	
				            	
				                <%-- <form action="updateProfile" method="post">
				                	<input type="hidden" name="action" value="pw"/>
				                    <div class="form-row">
				                        <div class="form-group">
				                            <label for="currentPassword">Current Password</label>
				                            <input type="password" id="currentPassword" name="currentPassword" value="${current_password}" class="${not empty errorMap['currentPassword'] ? 'error' : ''}">
				                            <c:if test="${not empty errorMap['currentPassword']}">
				                            	<p class="error-message">${errorMap['currentPassword']}</p>
				                            </c:if>	
				                            
				                        </div>
				                        <div class="form-group">
				                            <label for="newPassword">New Password</label>
				                            <input type="password" id="newPassword" name="newPassword" value="${new_password}" class="${not empty errorMap['newPassword'] ? 'error' : ''}">
				                            <c:if test="${not empty errorMap['newPassword']}">
				                            	<p class="error-message">${errorMap['newPassword']}</p>
				                            </c:if>	
				                            
				                        </div>
				                    </div>
				                    
				                    <div class="form-actions">
				                        <button type="button" class="cancel-button">Cancel</button>
				                        <button type="submit" class="save-button">Save Changes</button>
				                    </div>
				                </form> --%>
				        </div>
				   </div>
				</c:when>
        	</c:choose>
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
 
 <script>
        document.addEventListener('DOMContentLoaded', function() {
            const editProfileBtn = document.getElementById('editProfileBtn');
            const changePwBtn=document.getElementById('changePasswordBtn');
            const cancelEditBtn = document.querySelectorAll('.cancel-button');
            const viewProfileSection = document.getElementById('viewProfileSection');
            const editProfileSection = document.getElementById('editProfileSection');
            const changePasswordSection=document.getElementById('changePasswordSection');
            const viewProfileBtn = document.getElementById('viewProfileBtn');
            
            viewProfileBtn.addEventListener('click', function() {
                viewProfileSection.style.display = 'block';
                changePasswordSection.style.display='none';
                editProfileSection.style.display = 'none';
            });
            
            
            // Toggle to edit mode
            editProfileBtn.addEventListener('click', function() {
                viewProfileSection.style.display = 'none';
                changePasswordSection.style.display='none';
                editProfileSection.style.display = 'block';
            });
            
            // Toggle back to view mode
            cancelEditBtn.forEach(btn=>{
            	btn.addEventListener('click', function() {
                    viewProfileSection.style.display = 'block';
                    editProfileSection.style.display = 'none';
                    changePasswordSection.style.display='none';
            	})
            });
            
            changePwBtn.addEventListener('click', function() {
            	console.log("clicked");
                viewProfileSection.style.display = 'none';
                editProfileSection.style.display = 'none';
                changePasswordSection.style.display='block';
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
		
		
		
		function togglePasswordIcons(inputId, clickedIcon) {
			  const input = document.getElementById(inputId);
			  const wrapper = clickedIcon.parentElement;
			  const eyeIcon = wrapper.querySelector('.fa-eye');
			  const eyeSlashIcon = wrapper.querySelector('.fa-eye-slash');

			  if (input.type === "password") {
			    input.type = "text";
			    eyeIcon.style.display = "inline";
			    eyeSlashIcon.style.display = "none";
			  } else {
			    input.type = "password";
			    eyeIcon.style.display = "none";
			    eyeSlashIcon.style.display = "inline";
			  }
			}

		
	</script>
</body>
</html>