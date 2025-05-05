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
	<main>
        <div class="container">
            <div class="profile-top">
                <div class="profile-photo">

                </div>
                <div class="profile-texts">
                    <p class="dname">${doctor.user_name}</p>
                    <p class="dspecialization">${doctor.doctor_specialization}</p>
                    <p class="dqualificaiton">${doctor.doctor_qualification}</p>
                    <p class="drating">Rating: 4.5/5</p>
                </div>
            </div>
            <div class="profile-contents">
                <section class="profile-section">
                    <p class="profile-section__header">About</p>
                    <p>${doctor.doctor_about}</p>
                </section>
                <div class="main-action__buttons action-buttons">
	                <form>
	                	<button class="action-btn" id="mark-favorite">Mark as favorite</button>
	                </form>
	                <form action="appointment" method="get">
	                	<input type="hidden" name="doctor_id" value="${doctor.doctor_id}">
	                	<input type="hidden" name="user_id" value="1">
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
                <form class="review-action__buttons action-buttons" action="reviews">
                	<input type="hidden" value="${doctor.doctor_id}" name="doctor_id">
                    <button class="action-btn" id="see-reviews">See all reviews</button>
                    <button class="action-btn" id="give-review">Leave your review</button>
                </form>
            </div>
        </div>
    </main>
</body>
</html>