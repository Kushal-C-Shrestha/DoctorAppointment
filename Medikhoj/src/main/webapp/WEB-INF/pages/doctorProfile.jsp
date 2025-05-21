<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/doctorProfile.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/popup.css">
</head>
<body>
	<%@ include file="header.jsp" %>

	<main>
        <div class="container">
            <div class="profile-top">
				<img src="${pageContext.request.contextPath}/resources/images/uploads/${doctor.user_profile}" alt="doctor-profile" class="profile-photo">
                <div class="profile-texts">
                    <p class="dname">${doctor.user_name}</p>
                    <p class="dspecialization">${doctor.doctor_specialization}</p>
                    <p class="dqualificaiton">${doctor.doctor_qualification}</p>
                    <!-- <p class="drating">Rating: ${doctor.doctor_rating}</p> -->
                </div>
            </div>
            <div class="profile-contents">
                <section class="profile-section">
                    <p class="profile-section__header">About</p>
                    <p>${doctor.doctor_about}</p>
                </section>
                <div class="main-action__buttons action-buttons">
	                <form action="favourite" method="post">
					    <input type="hidden" name="favouriteState" id="favoriteState"
					           value="${isFavorite ? 'remove' : 'add'}" />
					    <input type="hidden" name="doctor_id" value="${doctor.doctor_id}">
					    <input type="hidden" name="user_id" value="${user.user_id}">
					    <button class="action-btn" id="mark-favorite">
					        <c:choose>
					            <c:when test="${isFavorite}">
					                Remove from favorites
					            </c:when>
					            <c:otherwise>
					                Add to favorites
					            </c:otherwise>
					        </c:choose>
					    </button>
					</form>
	                <form action="appointment" method="get">
	                	<input type="hidden" name="doctor_id" value="${doctor.doctor_id}">
	                	<input type="hidden" name="user_id" value="${user.user_id}">
	                	<button class="action-btn" id="book-appointment">Book appointment</button>
	                </form>
                </div>
                <section class="profile-section">
                    <div class="profile-section__header">
                        <p>Reviews</p>
                        <p class="rating-text">Rating: ${doctor.doctor_rating}</p>
                    </div>
                    <div class="review-list">
                        <div class="review">
                            <div class="review-img">

                            </div>
                            <div class="review-text__container">
                                <p class="reviewer-name">
                                    John Doe
                                </p>
                                <p class="review-text">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Sed magni placeat vel culpa molestiae dolores neque reiciendis saepe totam accusamus ipsum, eum maiores aliquam fugit, dignissimos in dolorum, optio iusto?</p>
                            </div>
                        </div>

                        <div class="review">
                            <div class="review-img">

                            </div>
                            <div class="review-text__container">
                                <p class="reviewer-name">
                                    John Doe
                                </p>
                                <p class="review-text">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Sed magni placeat vel culpa molestiae dolores neque reiciendis saepe totam accusamus ipsum, eum maiores aliquam fugit, dignissimos in dolorum, optio iusto?</p>
                            </div>
                        </div>

                        <div class="review">
                            <div class="review-img">

                            </div>
                            <div class="review-text__container">
                                <p class="reviewer-name">
                                    John Doe
                                </p>
                                <p class="review-text">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Sed magni placeat vel culpa molestiae dolores neque reiciendis saepe totam accusamus ipsum, eum maiores aliquam fugit, dignissimos in dolorum, optio iusto?</p>
                            </div>
                        </div>
                        
                    </div>
                </section>
                <form class="review-action__buttons action-buttons" action="${pageContext.request.contextPath}/reviews">
                	<input type="hidden" value="${doctor.doctor_id}" name="doctor_id">
                	<input type="hidden" value="seeReview" name="action">
                    <button class="action-btn" id="see-reviews">See all reviews</button>
                </form>
               	<form class="review-action__buttons action-buttons" action="${pageContext.request.contextPath}/reviews">
                	<input type="hidden" value="${doctor.doctor_id}" name="doctor_id">
                	<input type="hidden" value="leaveReview" name="action">
                    <button class="action-btn" id="give-review">Leave your review</button>
                </form>
            </div>
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
	
	<script>
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