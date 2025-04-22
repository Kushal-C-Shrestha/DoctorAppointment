<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
</head>
<body>
<%@ include file="header.jsp" %>
    <div class="container">
        <div class="left">
            <h2>Welcome back!</h2>
            <p>Skip the long queues, book your appointment in seconds,<br> and get the care you deserve!</p>

            <form action="${pageContext.request.contextPath}/login" method="post">
                <div class="textfield">
                    <input type="email" name="email" placeholder="  Email address" required>
                </div>
                <div class="textfield">
                    <input type="password" name="password" placeholder="  Password" required>
                </div>
                <div class="forgotpassword">
                    <a href="#">Forgot Password?</a>
                </div>
                <button type="submit" class="login">Login</button>
            </form>

            <div class="register">
                Not a member? <a href="${pageContext.request.contextPath}/register">Register Now</a>
            </div>
        </div>

        <div class="right">

        </div>
    </div>
</body>
</html>