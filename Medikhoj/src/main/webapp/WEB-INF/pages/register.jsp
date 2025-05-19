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
      
      <form id="registrationForm" action="register" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
      <input type="hidden" name="role" value="user">
        <!-- Full Name (full width) -->
        <div class="input-group full-width">
          <div class="input-wrapper">
            <input type="text" placeholder="Full Name" name="fullname" id="fullname"/>
            <i class="fas fa-user"></i>
          </div>
          <p class="error-message" id="fullname-error">Please enter your name</p>
        </div>
        
        <!-- Email and Phone -->
        <div class="input-row">
          <div class="input-group">
<<<<<<< HEAD
            <div class="input-wrapper">
              <input type="email" placeholder="Email address" name="email" id="email"/>
              <i class="fas fa-envelope"></i>
            </div>
            <p class="error-message" id="email-error">Please enter a valid email</p>
=======
            <input type="email" placeholder="Email address" name="email"/>
            <i class="fas fa-envelope"></i>
            <p>Error message</p>
>>>>>>> branch 'main' of https://github.com/Kushal-C-Shrestha/DoctorAppointment.git
          </div>
        
          <div class="input-group">
            <div class="input-wrapper">
              <input type="tel" placeholder="Phone No." name="phone" id="phone"/>
              <i class="fas fa-phone"></i>
            </div>
            <p class="error-message" id="phone-error">Please enter your phone number</p>
          </div>
        </div>

        <div class="input-group full-width">
          <div class="input-wrapper">
            <input type="date" placeholder="Date of birth" name="dob" id="dob"/>
            <i class="fas fa-calendar"></i>
          </div>
          <p class="error-message" id="dob-error">Please select your date of birth</p>
        </div>

        <!-- Gender + Blood Group -->
        <div class="input-row">
          <div class="input-group dropdown-icon">
            <div class="input-wrapper">
              <select name="gender" id="gender">
                <option value="" disabled selected>Gender</option>
                <option value="male">Male</option>
                <option value="female">Female</option>
                <option value="other">Other</option>
              </select>
              <i class="fas fa-venus-mars"></i>
            </div>
            <p class="error-message" id="gender-error">Please select your gender</p>
          </div>
          <div class="input-group dropdown-icon">
            <div class="input-wrapper">
              <select name="bloodgroup" id="bloodgroup">
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
            <p class="error-message" id="bloodgroup-error">Please select your blood group</p>
          </div>
        </div>

        <!-- Password -->
        <div class="input-group full-width">
          <div class="input-wrapper">
            <input type="password" id="password" placeholder="Password" name="password"/>
            <i class="fas fa-lock"></i>
            <i class="fas fa-eye-slash toggle-password" onclick="togglePassword(this, 'password')"></i>
          </div>
          <p class="error-message" id="password-error">Password must be at least 6 characters</p>
        </div>

        <!-- Confirm Password -->
        <div class="input-group full-width">
          <div class="input-wrapper">
            <input type="password" id="confirm-password" placeholder="Confirm Password" name="confirm_password"/>
            <i class="fas fa-lock"></i>
            <i class="fas fa-eye-slash toggle-password" onclick="togglePassword(this, 'confirm-password')"></i>
          </div>
          <p class="error-message" id="confirm-password-error">Passwords do not match</p>
        </div>
        
        <div class="input-group full-width">
          <div class="input-wrapper">
            <input type="file" id="profile-pic" name="profile-pic"/>
            <i class="fas fa-file"></i>
          </div>
          <p class="error-message" id="profile-pic-error">Please upload a profile picture</p>
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
    
    function validateForm() {
      let isValid = true;
      
      // Hide all error messages initially
      const errorMessages = document.querySelectorAll('.error-message');
      errorMessages.forEach(msg => {
        msg.style.display = 'none';
      });
      
      // Validate Full Name
      const fullname = document.getElementById('fullname');
      if (!fullname.value.trim()) {
        document.getElementById('fullname-error').style.display = 'block';
        isValid = false;
      }
      
      // Validate Email
      const email = document.getElementById('email');
      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      if (!email.value.trim() || !emailRegex.test(email.value.trim())) {
        document.getElementById('email-error').style.display = 'block';
        isValid = false;
      }
      
      // Validate Phone
      const phone = document.getElementById('phone');
      if (!phone.value.trim() || phone.value.trim().length < 10) {
        document.getElementById('phone-error').style.display = 'block';
        isValid = false;
      }
      
      // Validate Date of Birth
      const dob = document.getElementById('dob');
      if (!dob.value) {
        document.getElementById('dob-error').style.display = 'block';
        isValid = false;
      }
      
      // Validate Gender
      const gender = document.getElementById('gender');
      if (gender.value === "" || gender.selectedIndex === 0) {
        document.getElementById('gender-error').style.display = 'block';
        isValid = false;
      }
      
      // Validate Blood Group
      const bloodgroup = document.getElementById('bloodgroup');
      if (bloodgroup.value === "" || bloodgroup.selectedIndex === 0) {
        document.getElementById('bloodgroup-error').style.display = 'block';
        isValid = false;
      }
      
      // Validate Password
      const password = document.getElementById('password');
      if (!password.value || password.value.length < 6) {
        document.getElementById('password-error').style.display = 'block';
        isValid = false;
      }
      
      // Validate Confirm Password
      const confirmPassword = document.getElementById('confirm-password');
      if (password.value !== confirmPassword.value) {
        document.getElementById('confirm-password-error').style.display = 'block';
        isValid = false;
      }
      
      // Validate Profile Picture (optional, remove if not required)
      const profilePic = document.getElementById('profile-pic');
      if (!profilePic.files || profilePic.files.length === 0) {
        document.getElementById('profile-pic-error').style.display = 'block';
        isValid = false;
      }
      
      return isValid;
    }
  </script>
</body>
</html>