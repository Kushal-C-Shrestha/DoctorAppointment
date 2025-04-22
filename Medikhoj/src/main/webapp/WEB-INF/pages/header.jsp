<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <h1 class="logo">
            <a href="${contextPath}/home.jsp">
                <img src="${contextPath}/resources/images/system/logo.png"></a>
        </h1>
        <ul class="main-nav">
            <li><a href="${pageContext.request.contextPath}/home">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/doctors">Doctor</a></li>
            <li><a href="${pageContext.request.contextPath}/campaigns">Campaigns</a></li>
            <li><a href="${pageContext.request.contextPath}/aboutus">About Us</a></li>
        </ul>
        <ul class="user-nav">
            <li><a href="${pageContext.request.contextPath}/register" class="btn-signup">SignUp</a></li>
            <li><a href="${pageContext.request.contextPath}/login" class="btn-login">LogIn</a></li>
            <li><a href="${pageContext.request.contextPath}/profile" class="btn-login">Profile</a></li>
        </ul>
    </header>
</div>
</body>



