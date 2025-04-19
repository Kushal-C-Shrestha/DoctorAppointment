<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">

</head>
<body>
	<div class="container">
    <div class="form-section">
      <div class="logo">LOGO</div>
      <h1>Create Account</h1>
      <p class="sub-text">Skip the long queues, book your appointment in seconds, and get the care you deserve!</p>

      <form>
        <div class="name-group">
          <input type="text" placeholder="First Name" required />
          <input type="text" placeholder="Last Name" required />
        </div>
        <input type="email" placeholder="Email address" required />
        <div class="name-group">
          <input type="text" placeholder="Phone No." required />
          <input type="text" placeholder="Gender" required />
        </div>
        <input type="password" placeholder="Password" required />
        <input type="password" placeholder="Confirm Password" required />

        <button type="submit">Register</button>
        <p class="login-text">Already have an account? <a href="#">Login</a></p>
      </form>
    </div>
    <div class="image-section">
      <!-- You can add the character image as a background or insert an image tag -->
      <img src="image 6.png" alt="Doctors Image" />
    </div>
  </div>
</body>
</html>