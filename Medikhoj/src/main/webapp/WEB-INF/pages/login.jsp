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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
</head>
<body>
<%@ include file="header.jsp" %>
    <div class="container">
        <div class="left">
            <h2>Welcome back!</h2>
            <p>Skip the long queues, book your appointment in seconds,<br> and get the care you deserve!</p>

            <form action="login" method="post">
                <div class="textfield">
                    <input name="email" placeholder="Email address" required>
                    <img src="${pageContext.request.contextPath}/resources/mail.png" class="input-icon" alt="Email Icon">
                </div>
                <div class="textfield">
                	<img src="${pageContext.request.contextPath}/resources/padlock.png" class="input-icon" alt="Lock Icon">
                    <input type="password" name="password" placeholder="Password" id ="password" required>
                    <i id="toggleLoginPassword" class="fas fa-eye" style="cursor: pointer;" ></i>
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
  		document.addEventListener('DOMContentLoaded', function() {
    	const pwd = document.getElementById('loginPassword');
   		const icon = document.getElementById('toggleLoginPassword');
   		icon.addEventListener('click', function() {
      	const hidden = pwd.type === 'password';
     	pwd.type = hidden ? 'text' : 'password';
     	this.classList.toggle('fa-eye');
      	this.classList.toggle('fa-eye-slash');
    });
  });
</script>
</body>
</html>