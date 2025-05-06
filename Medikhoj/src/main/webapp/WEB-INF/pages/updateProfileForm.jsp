<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="updateProfile" method="post" enctype="multipart/form-data">
  <!-- Hidden user_id to identify the user -->
  <input type="hidden" name="user_id" value="${user.user_id}" />
  <input type="hidden" name="old_user_profile" value="${user.user_profile}" />

  <label for="user_name">Name:</label>
  <input type="text" id="user_name" name="user_name" value="${user.user_name}" required><br><br>

  <label for="user_email">Email:</label>
  <input type="email" id="user_email" name="user_email" value="${user.user_email}" required><br><br>

  <label for="user_phone">Phone:</label>
  <input type="text" id="user_phone" name="user_phone" value="${user.user_phone}" maxlength="10" required><br><br>

  <label for="user_dob">Date of Birth:</label>
  <input type="date" id="user_dob" name="user_dob" value="${user.user_dob}" required><br><br>

  <label for="user_gender">Gender:</label>
  <select id="user_gender" name="user_gender" required>
    <option value="male" ${user.user_gender == 'male' ? 'selected' : ''}>Male</option>
    <option value="female" ${user.user_gender == 'female' ? 'selected' : ''}>Female</option>
    <option value="others" ${user.user_gender == 'others' ? 'selected' : ''}>Others</option>
  </select><br><br>

  <label for="user_bloodgroup">Blood Group:</label>
  <input type="text" id="user_bloodgroup" name="user_bloodgroup" value="${user.user_bloodgroup}" maxlength="5" required><br><br>

  <label for="user_profile">Profile Image:</label>
  <input type="file" id="user_profile" name="user_profile" accept="image/*"><br><br>

  <button type="submit">Update</button>
</form>
</body>
</html>