<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/doctors.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/popup.css">

</head>
<body>
	<%@ include file="header.jsp" %>
<c:set var="selectedSpecs" value="${fn:join(paramValues.specialization, ',')}"  />

    <main>
        <div class="filter">
            <div class="filter-heading">
                <p>Filter</p>
            </div>
            <div class="filter-content">
                <form action="search" class="filter-form">
                    <fieldset class="filter-fieldset">
                        <legend class="fieldset-header">Specialization</legend>
                        <div class="filter-options">

                            <div class="filter-option">
							    <input type="checkbox" id="physician" name="specialization" value="physician"
							        <c:if test="${selectedSpecs != null && fn:contains(selectedSpecs, 'physician')}">checked</c:if>>
							    <label for="physician">Physician</label>
							</div>
							<div class="filter-option">
							    <input type="checkbox" id="ent" name="specialization" value="ent"
							        <c:if test="${selectedSpecs != null && fn:contains(selectedSpecs, 'ent')}">checked</c:if>>
							    <label for="ent">ENT</label>
							</div>
							<div class="filter-option">
							    <input type="checkbox" id="cardiologist" name="specialization" value="cardiologist"
							        <c:if test="${selectedSpecs != null && fn:contains(selectedSpecs, 'cardiologist')}">checked</c:if>>
							    <label for="cardiologist">Cardiologist</label>
							</div>
							<div class="filter-option">
							    <input type="checkbox" id="neurologist" name="specialization" value="neurologist"
							        <c:if test="${selectedSpecs != null && fn:contains(selectedSpecs, 'neurologist')}">checked</c:if>>
							    <label for="neurologist">Neurologist</label>
							</div>
							<div class="filter-option">
							    <input type="checkbox" id="dermatologist" name="specialization" value="dermatologist"
							        <c:if test="${selectedSpecs != null && fn:contains(selectedSpecs, 'dermatologist')}">checked</c:if>>
							    <label for="dermatologist">Dermatologist</label>
							</div>
                        </div>
                    </fieldset>
                    <fieldset class="filter-fieldset">
                        <legend class="fieldset-header">Qualification</legend>
                        <div class="filter-options">

                            <div class="filter-option">
                                <input type="checkbox" id="mbbs" name="qualification" value="mbbs">
                                <label for="mbbs">MBBS</label>
                            </div>
                            <div class="filter-option">
                                <input type="checkbox" id="md" name="qualification" value="md">
                                <label for="md">MD</label>
                            </div>
                            <div class="filter-option">
                                <input type="checkbox" id="ms" name="qualification" value="ms">
                                <label for="ms">MS</label>
                            </div>
                        </div>
                    </fieldset >
                    <fieldset class="filter-fieldset">
                        <legend class="fieldset-header">Experience</legend>
                        <div class="filter-options">

							<div class="filter-option">
							    <input type="radio" id="experience-0-5" name="experience" value="0-5"
							        <c:if test="${param.experience == '0-5'}">checked</c:if>>
							    <label for="experience-0-5">0-5 yrs</label>
							</div>
							
							<div class="filter-option">
							    <input type="radio" id="experience-5-10" name="experience" value="5-10"
							        <c:if test="${param.experience == '5-10'}">checked</c:if>>
							    <label for="experience-5-10">5-10 yrs</label>
							</div>
							
							<div class="filter-option">
							    <input type="radio" id="experience-10-plus" name="experience" value="10+"
							        <c:if test="${param.experience == '10+'}">checked</c:if>>
							    <label for="experience-10-plus">10+ yrs</label>
							</div>

                        </div>
                    </fieldset>
                    <button type="button" class="reset-filter">Reset filters</button>
                    <button type="submit">Filter</button>
                </form>
            </div>
        </div>
        <div class="main-content">
            <div class="main-top">
                <div class="search-bar">
                <form action="search" >
                	<input type="text" placeholder="Search for doctors" name="doctorSearch" value="${param.doctorSearch}"/>
                </form>
                    <!--<img src="Search icon.png" alt="">-->
                </div>
                <form action="search">
	                <div class="sort-section">
	                    <p>Sort by:</p>
	                    <select name="sort" id="sort" onchange="this.form.submit()">
	                        <option value="desc" ${param.sort == 'desc' ? 'selected' : ''}>Ratings: High to low</option>
			                <option value="asc" ${param.sort == 'asc' ? 'selected' : ''}>Ratings: Low to high</option>
	                    </select>
	                </div>
                </form>
            </div>
            <c:choose>
            	<c:when test="${not empty error}">
            		<p>${error}</p>
            	</c:when>
            	<c:otherwise>
            	
            	
            <div class="doctors-list">
            	<c:forEach var="doctor" items="${doctorList}">
            		<div class="doctor-card__container">
	                    <form action="${pageContext.request.contextPath}/doctorProfile" class="doctor-card">
	                    	<input type="hidden" name="doctorId" value="${doctor.doctor_id}">
	                        <button class="doctor">
	                            <img src="${pageContext.request.contextPath}/resources/images/uploads/${doctor.user_profile}" alt="" class="doctor-image">
	                            <div class="doctor-info">
	                                <p>${doctor.user_name}</p>
	                                <p>${doctor.doctor_specialization}</p>
	                                <div class="doctor-availability">
	                                    <div class="available-date availability-info">
	                                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" 
	                                        stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-calendar-icon 
	                                        lucide-calendar"><path d="M8 2v4"/><path d="M16 2v4"/><rect width="18" height="18" x="3" y="4" rx="2"/><path d="M3 10h18"/>
	                                        </svg>
	
	                                        <p>Available dates: Monday-Friday </p>
	                                    </div>
	                                    <div class="available-time availability-info" >
	                                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" 
	                                        stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round" 
	                                        class="lucide lucide-clock-icon lucide-clock"><circle cx="12" cy="12" r="10"/>
	                                        <polyline points="12 6 12 12 16 14"/>
	                                        </svg>
	                                        <p>Available time: 1:00 P.M - 3:00 P.M</p>
	                                    </div>
	                                </div>
	                                <p>${doctor.doctor_rating}</p>
	                            </div>
	                        </button>
	                    </form> 
	                    <form action="appointment">
	                        <div class="action-buttons">
	                        	<input type="hidden" name="doctor_id" value="${doctor.doctor_id}">
	                            <button>Book appointment</button>
	                        </div>
	                    </form>
                	</div>
            	</c:forEach>
            </div>
            </c:otherwise>
            </c:choose>
        </div>
    </main>
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

    
    <%@ include file="footer.jsp" %>
    
    <script>
    	document.querySelector('.reset-filter').addEventListener('click',()=>{
    		console.log("clciked");
    		document.querySelectorAll("input[type='checkbox']").forEach(checkbox=>{
    			checkbox.checked=false;
    		})
    		
    		document.querySelectorAll("input[type='radio']").forEach(radio=>{
    			radio.checked=false;
    		})
    		
    		 window.location.href = '/Medikhoj/doctors';  
    	})
    	
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