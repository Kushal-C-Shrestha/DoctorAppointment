<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reviews.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
</head>
<body>
	<main>
        <div class="container">
            <div class="reviews-container">
                <section class="profile-section">
                    <div class="profile-section__header">
                        <p>Reviews</p>
                        <p class="rating-text">Rating: 4.5/5</p>
                    </div>
                    <div class="review-list">
                    <c:forEach var="review" items="${reviewList}">
	                    <div class="review">
	                            <div class="review-img">
	    							
	                            </div>
	                            <div class="review-text__container">
	                                <div class="review-text__header">
	                                    <p class="reviewer-name">
	                                        ${review.user_name}
	                                    </p>
	                                    <p class="review-rating">${review.review_rating}</p>
	                                </div>
	                                <p class="review-text">
	                                	${review.review_desc}
	                                </p>
	                            </div>
	                        </div>
                    </c:forEach>
                        
                    </div>
                </section>

            </div>
            <!-- Review form (initially hidden) -->
			<div class="review-action__form action-buttons" style="margin-top: 30px;">
			    <form action="reviews" method="post" class="review-form">
			        <label for="rating">Rating (1 to 5):</label>
			        <input type="number" name="rating" id="rating" min="1" max="5" required>
			
			        <label for="reviewText">Your Review:</label>
			        <textarea name="reviewText" id="reviewText" rows="4" required></textarea>
			
			        <button type="submit" class="action-btn">Leave your review</button>
			    </form>
			</div>


        </div>
    </main>
</body>
</html>