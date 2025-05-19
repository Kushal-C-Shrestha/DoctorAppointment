<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Appointment</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/appointment.css">
</head>
<body>
	<%@ include file="header.jsp" %>
	
	<c:if test="${not empty errorMap}">
	<c:set var="error" value="${errorMap}">	</c:set>
	</c:if>
	
    <div class="container">
        <div class="form-header">
            <div class="icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M19 4H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2z"></path>
                    <line x1="16" y1="2" x2="16" y2="6"></line>
                    <line x1="8" y1="2" x2="8" y2="6"></line>
                    <line x1="3" y1="10" x2="21" y2="10"></line>
                </svg>
            </div>
            <div>
                <h1>Book Your Appointment</h1>
                <p>Schedule a visit with your healthcare provider</p>
            </div>
        </div>
        
        <div class="form-content">
            <form id="appointment-form" action="appointment" method="post" >
            	<input type="hidden" name="doctor_id" value="${doctor.doctor_id }">
        		<input type="hidden" name="user_id" value="${user.user_id}">
        		<input type="hidden" name="action" value="" id="form-action">
        		
                <div class="patient-doctor-info">
                    
                    
                    <!-- Doctor Information -->
                    <div class="form-section">
                        <div class="section-title">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                                <polyline points="9 22 9 12 15 12 15 22"></polyline>
                            </svg>
                            Doctor
                        </div>
                        
                        <div class="info-field">
                            <div class="icon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M8 2v4"></path>
                                    <path d="M16 2v4"></path>
                                    <rect x="3" y="6" width="18" height="16" rx="2"></rect>
                                    <path d="M12 14v-3"></path>
                                    <path d="M12 14h3"></path>
                                </svg>
                            </div>
                            <div>
                                <div class="label">Doctor's Name</div>
                                <div class="value">${doctorFullDetails.user_name}</div>
                                <input type="hidden" id="doctorName" name="doctor_name" value="${doctorFullDetails.user_name}">
                            </div>
                        </div>
                        
                        <div class="info-field">
                            <div class="icon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M22 12h-4l-3 9L9 3l-3 9H2"></path>
                                </svg>
                            </div>
                            <div>
                                <div class="label">Specialization</div>
                                <div class="value">${doctor.doctor_specialization}</div>
                                <input type="hidden" id="specialization" name="doctor_specialization" value="${doctor.doctor_specialization}">
                            </div>
                        </div>
                    </div>
                    
                    
                    <!-- Patient Information -->
                    <div class="form-section">
                        <div class="section-title">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                <circle cx="12" cy="7" r="4"></circle>
                            </svg>
                            Patient
                        </div>
                        
                        <div class="info-field">
                            <div class="icon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                    <circle cx="12" cy="7" r="4"></circle>
                                </svg>
                            </div>
                            <div>
                                <div class="label">Patient Name</div>
                                <div class="value">${user.user_name}</div>
                                <input type="hidden" id="userName" name="user_name" value="${user.user_name}">
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="divider"></div>
                
                <div class="form-section">
                    <div class="section-title">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                            <line x1="16" y1="2" x2="16" y2="6"></line>
                            <line x1="8" y1="2" x2="8" y2="6"></line>
                            <line x1="3" y1="10" x2="21" y2="10"></line>
                        </svg>
                        Schedule Your Visit
                    </div>
                    
                    <div class="form-group">
                        <label for="appointmentTitle">Reason for Visit *</label>
                        <input type="text" id="appointmentTitle" name="appointment_title" placeholder="Brief description of your visit reason" class="${not empty error['appointmentTitle'] ? 'error' : ''}">
						<p class="error-message"><c:if test="${not empty error['appointmentTitle']}">${error['appointmentTitle']}</c:if></p>
                        
                    </div>
                    
                    <div class="form-group">
                        <label for="appointmentDate">Select Date *</label>
                        <div class="date-selection">
                            <input type="date" id="appointmentDate" name="appointment_date" min="" value="${appointmentDate}" class="${not empty error['appointmentDate'] ? 'error' : ''}">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                <line x1="16" y1="2" x2="16" y2="6"></line>
                                <line x1="8" y1="2" x2="8" y2="6"></line>
                                <line x1="3" y1="10" x2="21" y2="10"></line>
                            </svg>
                        </div>
                       	<p class="error-message"><c:if test="${not empty error['appointmentDate']}">${error['appointmentDate']}</c:if></p>
                    </div>
                    
                    <div class="form-group">
                        <label>Select Time *</label>
                        <div class="time-slots">
                        <c:forEach var="slot" items="${slots}">
                        	<div class="time-slot">
                                <input type="radio" id="slot-${slot.slot_id}" name="appointment_time" value="${slot.slot_id}"
                                <c:choose>
							            <c:when test="${not dateSelected}">
							                disabled
							            </c:when>
							            <c:when test="${bookedSlots != null and bookedSlots.contains(slot.slot_id)}">
							                disabled
							            </c:when>
		       	 					</c:choose>  
		       	 					>                          
                                <label for="slot-${slot.slot_id}">
                                    <div class="time">${slot.formatted_time}</div>
                                </label>
                            </div>
                        </c:forEach>
                        </div>
                        <p class="error-message"><c:if test="${not empty error['appointmentTime']}">${error['appointmentTime']}</c:if></p>
                    </div>
                    
                    <div class="form-group">
                        <label>Appointment Type *</label>
                        <div class="appointment-type">
                            <div class="type-option">
                                <input type="radio" id="type-physical" name="appointment_type" value="physical">
                                <label for="type-physical">
                                    <div class="icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <path d="M22 12h-4l-3 9L9 3l-3 9H2"></path>
                                        </svg>
                                    </div>
                                    <div class="title">Physical Visit</div>
                                    <div class="desc">Visit in person</div>
                                </label>
                            </div>
                            <div class="type-option">
                                <input type="radio" id="type-online" name="appointment_type" value="online">
                                <label for="type-online">
                                    <div class="icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <path d="M23 7l-7 5 7 5V7z"></path>
                                            <rect x="1" y="5" width="15" height="14" rx="2" ry="2"></rect>
                                        </svg>
                                    </div>
                                    <div class="title">Online</div>
                                    <div class="desc">Video call</div>
                                </label>
                            </div>
                        </div>
						<p class="error-message"><c:if test="${not empty error['appointmentType']}">${error['appointmentType']}</c:if></p>
                    </div>
                    <button type="submit" onclick="document.getElementById('form-action').value='book'" class="submit-btn">Submit</button>
				</div>
			</form>
		</div>
    </div>

    <script>
    console.log("running");
    	let input= document.getElementById('appointmentDate');
    	console.log(input);
    	input.addEventListener('change',()=>{
    		if (input.value){
    			document.getElementById('form-action').value="check";
    			document.getElementById('appointment-form').submit();
    		}
    	}) 
    </script>
</body>
</html>