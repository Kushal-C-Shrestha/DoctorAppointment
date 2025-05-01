<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">-->
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
      <!-- <form action="${pageContext.request.contextPath}/register" method="post">
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
        
        <input type="file" name="profile-pic"/>
      </form>-->
    </div>
    <div class="image-section">
      <img src="image 6.png" alt="Doctors Image" />
    </div>
  </div>
</body>
</html>