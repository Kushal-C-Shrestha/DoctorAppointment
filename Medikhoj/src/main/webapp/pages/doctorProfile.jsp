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
                    <p class="dname">Dr. Ram Lal Maharjan</p>
                    <p class="dspecialization">Cardiologist</p>
                    <p class="dqualificaiton">MBBS, MD</p>
                    <p class="drating">Rating: 4.5/5</p>
                </div>
            </div>
            <div class="profile-contents">
                <section class="profile-section">
                    <p class="profile-section__header">About</p>
                    <p>Dr. Suman Sharma is a dedicated and compassionate general physician with over 8 years of clinical experience. She specializes in diagnosing and treating a wide range of health conditions, with a strong focus on preventive care and patient education. Known for her patient-centric approach, Dr. Sharma believes in building trust and providing personalized treatment plans to promote long-term health and well-being. Her calm demeanor and thorough consultations have earned her the confidence of countless patients over the years.</p>
                </section>
                <div class="main-action__buttons action-buttons">
                    <button class="action-btn" id="mark-favorite">Mark as favorite</button>
                    <button class="action-btn" id="book-appointment">Book appointment</button>
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
                <div class="review-action__buttons action-buttons">
                    <button class="action-btn" id="see-reviews">See all reviews</button>
                    <button class="action-btn" id="give-review">Leave your review</button>
                </div>
            </div>
        </div>
    </main>
</body>
</html>