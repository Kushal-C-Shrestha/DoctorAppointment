<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/campaigns.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/popup.css">
</head>
<body>

		<%@ include file="header.jsp" %>
<main>
        <div class="container">
            <div class="campaign-header">
                <p>Campaigns</p>
            </div>
            <c:choose>
            <c:when test="${not empty error}">
            	<p>${error }</p>
            </c:when>
            <c:otherwise>
            
            <div class="campaign-list" >
            <c:forEach var="campaign" items="${campaigns}">
	            <div class="campaign">
	                    <div class="campaign-texts">
	                        <div class="campaign-title">
	                            <p>${campaign.campaign_name}</p>
	                        </div>
	                        <div class="campaign-info">
	                            <div class="campaign-date campaign-info__item" >
	                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-calendar-icon lucide-calendar"><path d="M8 2v4"/><path d="M16 2v4"/><rect width="18" height="18" x="3" y="4" rx="2"/><path d="M3 10h18"/></svg>
	                                <p>${campaign.formatted_date}</p>
	                            </div>
	                            <div class="campaign-time campaign-info__item">
	                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-clock-icon lucide-clock"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg>
	                                <p>${campaign.formatted_time}</p>
	                            </div>
	                        </div>
	                    </div>
	                    <c:set var="user" value="${sessionScope.loggedInUser}" />
	                    <form action="campaigns" method="post">
	                    	<input type="hidden" name="campaign_id" value="${campaign.campaign_id}">
	                    	<input type="hidden" name="user_id" value="${user.user_id}">
		                    <button class="campaign-enroll">
		                        Enroll
		                    </button>
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
			        
			        <!-- Show information icon if it's an error popup -->
			        <c:if test="${popupTitle== 'Information'}">
			            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" stroke="none" class="neutral-icon">
                			<path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1 15h-2v-6h2v6zm0-8h-2V7h2v2z"/>
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
    <c:if test="${param.error != null}">
        <p style="color: red;">${param.error}</p>
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