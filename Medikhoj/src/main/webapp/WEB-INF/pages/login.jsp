<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css"/>
</head>
<body>
    <div class="container">
        <div class="left">
            <h2>Welcome back!</h2>
            <p>Skip the long queues, book your appointment in seconds,<br> and get the care you deserve!</p>

            <form action=#>
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
                Not a member? <a href="register.jsp">Register Now</a>
            </div>
        </div>

        <div class="right">

        </div>
    </div>
</body>
</html>