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
                    <p class="drating">Rating: ${doctor.doctor_rating}</p>
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
                        <p class="rating-text">Rating: 4.5/5</p>
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
    
   <!-- <script>
	    const button = document.getElementById('mark-favorite');
	    const favoriteStateInput = document.getElementById('favoriteState');

	    button.addEventListener('click', function (event) {
	        if (favoriteStateInput.value === 'add') {
	            favoriteStateInput.value = 'remove';
	            button.textContent = 'Remove from favorites';
	        } else {
	            favoriteStateInput.value = 'add';
	            button.textContent = 'Add to favorites';
	        }
	    });
    </script> --> 
</body>
</html>