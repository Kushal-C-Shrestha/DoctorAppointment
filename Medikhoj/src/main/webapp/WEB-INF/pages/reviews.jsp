<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                        <div class="review">
                            <div class="review-img">
    
                            </div>
                            <div class="review-text__container">
                                <div class="review-text__header">
                                    <p class="reviewer-name">
                                        John Doe
                                    </p>
                                    <p class="review-rating">4.5</p>
                                </div>
                                <p class="review-text">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Sed magni placeat vel culpa molestiae dolores neque reiciendis saepe totam accusamus ipsum, eum maiores aliquam fugit, dignissimos in dolorum, optio iusto?</p>
                            </div>
                        </div>
                    </div>
                </section>

            </div>
            <div class="review-action__buttons action-buttons">
                <button class="action-btn" id="give-review">Leave your review</button>
            </div>
        </div>
    </main>
</body>
</html>