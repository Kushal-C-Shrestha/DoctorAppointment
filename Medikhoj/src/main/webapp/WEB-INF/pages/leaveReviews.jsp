<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Leave a Review</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/leaveReviews.css">
</head>
<body>
    <div class="review-action__form action-buttons">
        <form action="reviews" method="post" class="review-form">
            <h2 class="form-title">Leave a Review</h2>
            
            <input type="hidden" value="${doctor.doctor_id}" name="doctor_id">
            
            <div class="form-group">
                <label for="rating">Rating (1 to 5):</label>
                <div class="rating-group">
                    <input type="number" name="rating" id="rating" min="1" max="5" required>
                    <div class="stars">
                        <svg class="star" data-rating="1" viewBox="0 0 24 24">
                            <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/>
                        </svg>
                        <svg class="star" data-rating="2" viewBox="0 0 24 24">
                            <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/>
                        </svg>
                        <svg class="star" data-rating="3" viewBox="0 0 24 24">
                            <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/>
                        </svg>
                        <svg class="star" data-rating="4" viewBox="0 0 24 24">
                            <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/>
                        </svg>
                        <svg class="star" data-rating="5" viewBox="0 0 24 24">
                            <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/>
                        </svg>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="reviewText">Your Review:</label>
                <textarea name="reviewText" id="reviewText" rows="4" placeholder="Share your experience..." required></textarea>
            </div>

            <button type="submit" class="action-btn">Submit Review</button>
            
            <div class="error-message" id="errorMsg"></div>
        </form>
    </div>

    <script>
        const stars = document.querySelectorAll('.star');
        const ratingInput = document.getElementById('rating');
        const form = document.querySelector('.review-form');
        const errorMsg = document.getElementById('errorMsg');

        // Star rating functionality
        stars.forEach((star, index) => {
            star.addEventListener('click', () => {
                const rating = index + 1;
                ratingInput.value = rating;
                updateStars(rating);
            });

            star.addEventListener('mouseenter', () => {
                updateStars(index + 1);
            });
        });

        document.querySelector('.stars').addEventListener('mouseleave', () => {
            updateStars(ratingInput.value || 0);
        });

        function updateStars(rating) {
            stars.forEach((star, index) => {
                star.classList.toggle('active', index < rating);
            });
        }

        // Form validation
        form.addEventListener('submit', function(e) {
            const rating = ratingInput.value;
            const reviewText = document.getElementById('reviewText').value.trim();
            
            if (!rating || !reviewText) {
                e.preventDefault();
                showError('Please provide both a rating and review text.');
            } else if (rating < 1 || rating > 5) {
                e.preventDefault();
                showError('Rating must be between 1 and 5.');
            } else {
                hideError();
            }
        });

        function showError(message) {
            errorMsg.textContent = message;
            errorMsg.style.display = 'block';
        }

        function hideError() {
            errorMsg.style.display = 'none';
        }
    </script>
</body>
</html>