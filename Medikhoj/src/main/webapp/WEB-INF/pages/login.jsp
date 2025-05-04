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

            <form action=#>
                <div class="textfield">
                    <input type="email" name="email" placeholder="Email address" required>
                    <img src="${pageContext.request.contextPath}/resources/mail.png" class="input-icon" alt="Email Icon">
                </div>
                <div class="textfield">
                	<img src="${pageContext.request.contextPath}/resources/padlock.png" class="input-icon" alt="Lock Icon">
                    <input type="password" name="password" placeholder="Password" id ="password" required>
                    <img src ="${pageContext.request.contextPath}/resources/eye.png" id = "eyeicon">
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
    <script>
    	let eyeicon = document.getElementById("eyeicon");
		let password = document.getElementById("password");
		eyeicon.onclick = function(){
			if(password.type == "password"){
				password.type = "text";
				eyeicon.src = "${pageContext.request.contextPath}/resources/eyeopen.png"
			}else {
				password.type = "password";
				eyeicon.src = "${pageContext.request.contextPath}/resources/eye.png";
			}
		};
  </script>
</body>
</html>