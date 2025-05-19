<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>
	<div class="container">
        <!-- LEFT: Login Form -->
        <div class="form-container">
          <h1 class="title">Welcome Back!</h1>
          <p class="subtext">
            Skip the long queues, book your appointment in seconds,and get the care you deserve!
          </p>

          <form action="#" method="post">
            <!-- Email -->
                <div class="input-group full-width">
                  <input type="email" name="email" placeholder="Email address" required />
                   <i class="fas fa-envelope"></i>
                </div>

            <!-- Password -->
             <div class="input-group full-width">
                <input type="password" id="password" name="password" placeholder="Password" required />
                <i class="fas fa-lock"></i>
                <i class="fas fa-eye-slash toggle-password" onclick="togglePassword(this, 'password')"></i>
              </div> 

             <div class="forgot-link">
               <a href="#">Forgot Password?</a>
             </div>

            <button type="submit" class="register-btn">Login</button>

            <div class="login-link">
              Not a member? <a href="register.html">Register Now</a>
            </div>
          </form>
        </div>

        <!-- RIGHT: Illustration / Background -->
         <div class="image-container">
           <img src="image-6.png" alt="Medical professionals illustration" />
         </div>
  </div>
    <script>
    function togglePassword(iconElement, inputId) {
      const input = document.getElementById(inputId);
      const isPassword = input.type === "password";
      input.type = isPassword ? "text" : "password";
      iconElement.classList.toggle("fa-eye");
      iconElement.classList.toggle("fa-eye-slash");
    }
  </script>
</body>
</html>