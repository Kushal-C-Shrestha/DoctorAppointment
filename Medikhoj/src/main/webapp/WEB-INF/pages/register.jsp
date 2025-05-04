<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      <h1 class="title">Create Account</h1>
      <form>
        <!-- Full Name (full width) -->
        <div class="input-group full-width">
          <input type="text" placeholder="Full Name" required />
          <i class="fas fa-user"></i>
        </div>

        <!-- Email and Phone -->
        <div class="input-row">
          <div class="input-group">
            <input type="email" placeholder="Email address" required />
            <i class="fas fa-envelope"></i>
          </div>
          <div class="input-group">
            <input type="tel" placeholder="Phone No." required />
            <i class="fas fa-phone"></i>
          </div>
        </div>

        <!-- Gender + Blood Group -->
        <div class="input-row">
          <div class="input-group dropdown-icon">
            <select required>
              <option value="" disabled selected>Gender</option>
              <option value="male">Male</option>
              <option value="female">Female</option>
              <option value="other">Other</option>
            </select>
            <i class="fas fa-venus-mars"></i>
          </div>
          <div class="input-group dropdown-icon">
            <select required>
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

        <!-- Password -->
        <div class="input-group full-width">
          <input type="password" id="password" placeholder="Password" required />
          <i class="fas fa-lock"></i>
          <i class="fas fa-eye-slash toggle-password" onclick="togglePassword(this, 'password')"></i>
        </div>

        <!-- Confirm Password -->
        <div class="input-group full-width">
          <input type="password" id="confirm-password" placeholder="Confirm Password" required />
          <i class="fas fa-lock"></i>
          <i class="fas fa-eye-slash toggle-password" onclick="togglePassword(this, 'confirm-password')"></i>
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