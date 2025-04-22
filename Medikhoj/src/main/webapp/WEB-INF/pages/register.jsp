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

</head>
<body>
	<%@ include file="header.jsp" %>
	<div class="container">
    <div class="form-section">
      <div class="logo">LOGO</div>
      <h1>Create Account</h1>
      <p class="sub-text">Skip the long queues, book your appointment in seconds, and get the care you deserve!</p>

      <form action="${pageContext.request.contextPath}/register" method="post">
         <input type="text" placeholder="Full Name" name="fullname" required />
          
        <input type="email" placeholder="Email address" name="email" required />
        <div class="name-group">
          <input type="text" placeholder="Phone No." name="phone" required />
          <input type="text" placeholder="Gender" name="gender"  required />
        </div>
        <input type="date" name="dob"/>
        <input type="password" placeholder="Password" name="password" required />
        <input type="password" placeholder="Confirm Password" name="confirm_password" required />
		<input type="text" placeholder="Blood group" name="bloodgroup" required />
		
        <button type="submit">Register</button>
        <p class="login-text">Already have an account? <a href="${pageContext.request.contextPath}/login">Login</a></p>
      </form>
    </div>
    <div class="image-section">
      <img src="image 6.png" alt="Doctors Image" />
    </div>
  </div>
</body>
</html>