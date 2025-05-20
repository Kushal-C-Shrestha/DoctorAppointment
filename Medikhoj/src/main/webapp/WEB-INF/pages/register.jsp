<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
</head>
<body>
<div class="container">
    <div class="form-container" >
      <div class="logo">LOGO</div>
      <h1 class="title">Create Account</h1>
      <p class="sub-text">Skip the long queues, book your appointment in seconds, and get the care you deserve!</p>
      
      <form id="registrationForm" action="register" method="post" enctype="multipart/form-data">
      <input type="hidden" name="role" value="user">
        <!-- Full Name (full width) -->
        <div class="input-group full-width">
          <div class="input-wrapper">
            <input type="text" placeholder="Full Name" name="fullname" id="fullname" value="${userName}"/>
            <i class="fas fa-user"></i>
          </div>
          <c:if test="${not empty errorMap['fullName']}">
			<p class="error-message" id="fullname-error">${errorMap.fullName}</p>
          </c:if>
        </div>
        
        <!-- Email and Phone -->
        <div class="input-row">
          <div class="input-group">
            <div class="input-wrapper">
              <input type="email" placeholder="Email address" name="email" id="email" value="${userEmail}"/>
              <i class="fas fa-envelope"></i>
            </div>
            <c:if test="${not empty errorMap['email']}">
				<p class="error-message" id="email-error">${errorMap['email']}</p>
            </c:if>
            
          </div>
        
          <div class="input-group">
            <div class="input-wrapper">
              <input type="tel" placeholder="Phone No." name="phone" id="phone" value="${userPhone}"/>
              <i class="fas fa-phone"></i>
            </div>
            <c:if test="${not empty errorMap['phone']}">
            	<p class="error-message" id="phone-error">${errorMap['phone']}</p>
            </c:if>
            
          </div>
        </div>

        <div class="input-group full-width">
          <div class="input-wrapper">
            <input type="date" placeholder="Date of birth" name="dob" id="dob" value="${userDob}"/>
            <i class="fas fa-calendar"></i>
          </div>
          <c:if test="${not empty errorMap['dob']}">
          		<p class="error-message" id="dob-error">${errorMap['dob']}</p>
          </c:if>
        </div>

        <!-- Gender + Blood Group -->
        <div class="input-row">
          <div class="input-group dropdown-icon">
            <div class="input-wrapper">
              <select name="gender" id="gender" value="${userGender}">
                <option value="" disabled selected>Gender</option>
                <option value="male">Male</option>
                <option value="female">Female</option>
                <option value="other">Other</option>
              </select>
              <i class="fas fa-venus-mars"></i>
            </div>
            <c:if test="${not empty errorMap['gender']}">
            	<p class="error-message" id="gender-error">${errorMap['gender']}</p>
            </c:if>
          </div>
          <div class="input-group dropdown-icon">
            <div class="input-wrapper">
              <select name="bloodgroup" id="bloodgroup" value="${userBloodGroup}">
                <option value="" disabled selected>Blood Group</option>
                <option value="A+">A+</option>
                <option value="A-">A-</option>
                <option value="B+">B+</option>
                <option value="B-">B-</option>
                <option value="AB+">AB+</option>
                <option value="AB-">AB-</option>
                <option value="O+">O+</option>
                <option value="O-">O-</option>
              </select>
              <i class="fas fa-tint"></i>
            </div>
            <c:if test="${not empty errorMap['bloodGroup']}">
            	<p class="error-message" id="bloodgroup-error">${errorMap['bloodGroup']}</p>
            </c:if>
          </div>
        </div>

        <!-- Password -->
        <div class="input-group full-width">
          <div class="input-wrapper">
            <input type="password" id="password" placeholder="Password" name="password" value="${userPassword}"/>
            <i class="fas fa-lock"></i>
            <i class="fas fa-eye-slash toggle-password" onclick="togglePassword(this, 'password')"></i>
          </div>
          <c:if test="${not empty errorMap['password']}">
          		<p class="error-message" id="password-error">${errorMap['password']}</p>
          </c:if>
        </div>

        <!-- Confirm Password -->
        <div class="input-group full-width">
          <div class="input-wrapper">
            <input type="password" id="confirm-password" placeholder="Confirm Password" name="confirm_password" value="${confirmPassword}"/>
            <i class="fas fa-lock"></i>
            <i class="fas fa-eye-slash toggle-password" onclick="togglePassword(this, 'confirm-password')"></i>
          </div>
          <c:if test="${not empty errorMap['confirmPassword']}">
          		<p class="error-message" id="confirm-password-error">${errorMap['confirmPassword']}</p>
          </c:if>
        </div>
        
        <div class="input-group full-width">
          <div class="input-wrapper">
            <input type="file" id="profile-pic" name="profile-pic" value="${image}"/>
            <i class="fas fa-file"></i>
          </div>
          <c:if test="${not empty errorMap['image']}">
          		<p class="error-message" id="confirm-password-error">${errorMap['image']}</p>
          </c:if>
        </div>

        <button type="submit" class="register-btn">Register</button>
        <div class="login-link">
          Already have an account? <a href="#">Login</a>
        </div>
      </form>
    </div>

    <div class="image-container">
      <img src="image 6.png" alt="Medical professionals illustration" />
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