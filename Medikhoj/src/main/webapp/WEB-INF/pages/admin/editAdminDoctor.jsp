<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>Edit Doctor</h2>

    <form action="editAdminDoctor" method="post" style="display: flex; flex-direction: column; max-width: 400px;">
    	<input type="hidden" name="doctor_id" value="${doctor.doctor_id}">
        <label for="doctor_name">Name:</label>
		<input type="text" id="doctor_name" name="doctor_name" value="${doctor.user_name}" required />
		
		<label for="doctor_specialization">Specialization:</label>
		<input type="text" id="doctor_specialization" name="doctor_specialization" value="${doctor.doctor_specialization}" required />
		
		<label for="doctor_qualification">Qualification:</label>
		<input type="text" id="doctor_qualification" name="doctor_qualification" value="${doctor.doctor_qualification}" required />
		
		<label for="doctor_experience">Experience:</label>
		<input type="text" id="doctor_experience" name="doctor_experience" value="${doctor.doctor_experience}" required />
		
		<label for="doctor_about">About:</label>
		<input type="text" id="doctor_about" name="doctor_about" value="${doctor.doctor_about}" required />
		
		<label for="doctor_dob">DOB:</label>
		<input type="date" id="doctor_dob" name="doctor_dob" value="${doctor.user_dob}" required />
		
		<label for="doctor_email">Email:</label>
		<input type="text" id="doctor_email" name="doctor_email" value="${doctor.user_email}" required />
		
		<label for="doctor_phone">Phone:</label>
		<input type="text" id="doctor_phone" name="doctor_phone" value="${doctor.user_phone}" required />
	
		<label for="doctor_gender">Gender:</label>
		<select name="doctor_gender" id="doctor_gender" required>
		    <option value="male" ${doctor.user_gender == 'male' ? 'selected' : ''}>Male</option>
		    <option value="female" ${doctor.user_gender == 'female' ? 'selected' : ''}>Female</option>
		    <option value="others" ${doctor.user_gender == 'others' ? 'selected' : ''}>Others</option>
		</select>
		
		<label for="doctor_bloodgroup">Bloodgroup:</label>
		<input type="text" id="doctor_bloodgroup" name="doctor_bloodgroup" value="${doctor.user_bloodgroup}" required />
		
		<label for="doctor_password">Password:</label>
		<input type="text" id="doctor_password" name="doctor_password" value="${decryptedPassword}" required />
        
        <br/>
        <button type="submit">Save Changes</button>
        <a href="${pageContext.request.contextPath}/adminDoctor" style="margin-top: 1rem;">Cancel</a>
    </form>

</body>
</html>