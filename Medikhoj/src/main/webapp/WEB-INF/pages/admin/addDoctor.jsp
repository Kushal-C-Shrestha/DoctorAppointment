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
    <div class="form-container">
      <div class="logo">LOGO</div>
      <h1 class="title">Add Doctor</h1>
  
      <form id="registrationForm" action="register" method="post" enctype="multipart/form-data">
        <input type="hidden" name="role" value="doctor">
  
        <!-- Full Name -->
        <div class="input-group full-width">
          <div class="input-wrapper">
            <input type="text" placeholder="Full Name" name="fullname" id="fullname" />
            <i class="fas fa-user"></i>
          </div>
          
        </div>
  
        <!-- Email & Phone -->
        <div class="input-row">
          <div class="input-group">
            <div class="input-wrapper">
              <input type="email" placeholder="Email address" name="email" id="email" />
              <i class="fas fa-envelope"></i>
            </div>
            
          </div>
  
          <div class="input-group">
            <div class="input-wrapper">
              <input type="tel" placeholder="Phone No." name="phone" id="phone"/>
              <i class="fas fa-phone"></i>
            </div>
          
          </div>
        </div>
  
        <!-- Date of Birth -->
        <div class="input-group full-width">
          <div class="input-wrapper">
            <input type="date" placeholder="Date of birth" name="dob" id="dob"/>
            <i class="fas fa-calendar"></i>
          </div>
          
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
            
          </div>
        </div>
  
        <!-- Specialization + Qualification -->
        <div class="input-row">
          <div class="input-group">
            <div class="input-wrapper">
              <input type="text" placeholder="Specialization (e.g., Cardiologist)" name="specialization" id="specialization" />
              <i class="fas fa-user-md"></i>
            </div>
            
          </div>
  
          <div class="input-group">
            <div class="input-wrapper">
              <input type="text" placeholder="Qualification (e.g., MBBS, MD)" name="qualification" id="qualification" />
              <i class="fas fa-certificate"></i>
            </div>
           
          </div>
        </div>
  
        <!-- Experience -->
        <div class="input-group full-width">
          <div class="input-wrapper">
            <input type="number" placeholder="Years of Experience" name="experience" id="experience"  min="0"/>
            <i class="fas fa-briefcase"></i>
          </div>
          
         
        </div>
  
        <!-- Password -->
        <div class="input-group full-width">
          <div class="input-wrapper">
            <input type="password" id="password" placeholder="Password" name="password" "/>
            <i class="fas fa-lock"></i>
            <i class="fas fa-eye-slash toggle-password" onclick="togglePassword(this, 'password')"></i>
          </div>
         
        
          
        </div>
  
        <!-- Confirm Password -->
        <div class="input-group full-width">
          <div class="input-wrapper">
            <input type="password" id="confirm-password" placeholder="Confirm Password" name="confirm_password" />
            <i class="fas fa-lock"></i>
            <i class="fas fa-eye-slash toggle-password" onclick="togglePassword(this, 'confirm-password')"></i>
          </div>
          
        </div>
  
        <!-- Profile Picture -->
        <div class="input-group full-width">
          <div class="input-wrapper">
            <input type="file" id="profile-pic" name="profile-pic" />
            <i class="fas fa-file"></i>
          </div>
        
        
        </div>
  
        <!-- Register Button -->
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