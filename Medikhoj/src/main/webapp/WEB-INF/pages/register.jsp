<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<<<<<<< HEAD
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
=======
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
>>>>>>> branch 'main' of https://github.com/Kushal-C-Shrestha/DoctorAppointment.git
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
</head>
<body>
  <div class="container">
    <div class="form-container">
      <div class="logo">LOGO</div>
<<<<<<< HEAD
      <h1 class="title">Create Account</h1>
      <form>
        <!-- Full Name (full width) -->
        <div class="input-group full-width">
          <input type="text" placeholder="Full Name" required />
          <i class="fas fa-user"></i>

      <h1>Create Account</h1>
      <p class="sub-text">Skip the long queues, book your appointment in seconds, and get the care you deserve!</p>
	  <form action="${pageContext.request.contextPath}/register" enctype="multipart/form-data" method="POST">
	  	<input type="hidden" value="user" name="role">
        <label for="fullname">Full Name:</label>
        <input type="text" id="fullname" name="fullname" ><br><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" ><br><br>

        <label for="phone">Phone:</label>
        <input type="tel" id="phone" name="phone" ><br><br>

        <label for="dob">Date of Birth:</label>
        <input type="date" id="dob" name="dob" ><br><br>

        <label for="gender">Gender:</label>
        <select id="gender" name="gender" >
            <option value="">Select</option>
            <option value="male">Male</option>
            <option value="female">Female</option>
            <option value="other">Other</option>
        </select><br><br>

        <label for="bloodgroup">Blood Group:</label>
        <select id="bloodgroup" name="bloodgroup" >
            <option value="">Select</option>
            <option value="A+">A+</option>
            <option value="A-">A-</option>
            <option value="B+">B+</option>
            <option value="B-">B-</option>
            <option value="O+">O+</option>
            <option value="O-">O-</option>
            <option value="AB+">AB+</option>
            <option value="AB-">AB-</option>
        </select><br><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" ><br><br>

        <label for="confirm_password">Confirm Password:</label>
        <input type="password" id="confirm_password" name="confirm_password" ><br><br>

        <label for="profile-pic">Upload Picture:</label>
        <input type="file" id="profile-pic" name="profile-pic" accept="image/*" ><br><br>

        <button type="submit">Register</button>
    </form>
     

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
=======
        <input type="date" name="dob"/>
        <input type="password" placeholder="Password" name="password" required />
        <input type="password" placeholder="Confirm Password" name="confirm_password" required />
		<input type="text" placeholder="Blood group" name="bloodgroup" required />
		
        <button type="submit">Register</button>
        <p class="login-text">Already have an account? <a href="${pageContext.request.contextPath}/login">Login</a></p>
        
        <input type="file" name="profile-pic"/>
      </form>-->
>>>>>>> branch 'main' of https://github.com/Kushal-C-Shrestha/DoctorAppointment.git
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