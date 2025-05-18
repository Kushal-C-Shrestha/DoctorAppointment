<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="review-action__form action-buttons" style="margin-top: 30px;">
	    <form action="${pageContext.request.contextPath}/reviews" method="post" class="review-form">
	    	<input type="hidden" value="${doctor.doctor_id}" name="doctor_id">
	        <label for="rating">Rating (1 to 5):</label>
	        <input type="number" name="rating" id="rating" min="1" max="5">
	
	        <label for="reviewText">Your Review:</label>
	        <textarea name="reviewText" id="reviewText" rows="4"></textarea>
		
	        <button type="submit" class="action-btn">Leave your review</button>
	    </form>
    	<c:if test="${param.success != null}">
        	<p style="color: green;">Review submitted successfully!</p>
	    </c:if>
	
	    <c:if test="${param.error != null}">
	        <p style="color: red;">${param.error}</p>
	    </c:if>
	</div>
</body>
</html>