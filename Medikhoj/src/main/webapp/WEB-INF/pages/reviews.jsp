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


        </div>
    </main>
</body>
</html>