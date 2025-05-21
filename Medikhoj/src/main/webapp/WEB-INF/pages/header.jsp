<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
</head>
<body>
<div id="header">
    <header class="header">
        <div class="logo">
            <a href="${pageContext.request.contextPath}/home">
                <img src="${pageContext.request.contextPath}/resources/images/assets/logo.png">
            </a>
        </div>
        <ul class="main-nav">
            <li><a href="${pageContext.request.contextPath}/home">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/doctors">Doctor</a></li>
            <li><a href="${pageContext.request.contextPath}/campaigns">Campaigns</a></li>
            <li><a href="${pageContext.request.contextPath}/aboutus">About Us</a></li>
        </ul>
        <ul class="user-nav">
        	<c:if test="${empty sessionScope.loggedInUser}">
        	 	<li><a href="${pageContext.request.contextPath}/register" class="btn-signup">SignUp</a></li>
            	<li><a href="${pageContext.request.contextPath}/login" class="btn-login">LogIn</a></li>
			</c:if>
           
            <li><a href="${pageContext.request.contextPath}/profile" class="btn-login">Profile</a></li>
        </ul>
    </header>
</div>
</body>



