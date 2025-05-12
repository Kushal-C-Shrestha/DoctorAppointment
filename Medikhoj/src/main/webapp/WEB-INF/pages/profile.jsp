<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    if (session.getAttribute("loggedInUser") == null) {
    	response.sendRedirect(request.getContextPath() + "/login");
        return;
   }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Profile</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/profile.css">
</head>
<body>
	<%@ include file="header.jsp" %>
    <div class="container">
        <h2>My Profile</h2>
        <form action="UpdateProfileController" method="post">
            <c:set var="user" value="${sessionScope.loggedInUser}" />

            <div class="form-group">
                <label>Name:</label>
                <input type="text" name="user_name" value="${user.user_name}" required>
            </div>

            <div class="form-group">
                <label>Email:</label>
                <input type="email" name="user_email" value="${user.user_email}" readonly>
            </div>

            <div class="form-group">
                <label>Phone:</label>
                <input type="text" name="user_phone" value="${user.user_phone}">
            </div>

            <div class="form-group">
                <label>Date of Birth:</label>
                <input type="date" name="user_dob" value="${user.user_dob}">
            </div>

            <div class="form-group">
                <label>Gender:</label>
                <select name="user_gender">
                    <option value="Male" ${user.user_gender == 'Male' ? 'selected' : ''}>Male</option>
                    <option value="Female" ${user.user_gender == 'Female' ? 'selected' : ''}>Female</option>
                    <option value="Other" ${user.user_gender == 'Other' ? 'selected' : ''}>Other</option>
                </select>
            </div>

            <div class="form-group">
                <label>Blood Group:</label>
                <input type="text" name="user_bloodgroup" value="${user.user_bloodgroup}">
            </div>

            <button type="submit">Update Profile</button>
        </form>
    </div>
</body>
</html>
