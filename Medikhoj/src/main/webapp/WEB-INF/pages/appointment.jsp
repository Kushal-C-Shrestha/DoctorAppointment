<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/appointment.css">
</head>
<body>
	<%@ include file="header.jsp" %>
	<form action="appointment" method="post" id="appointment-form">
        <input type="hidden" name="doctor_id" value="${doctor.doctor_id }">
        <input type="hidden" name="user_id" value="${user.user_id}">
        <input type="hidden" name="action" value="" id="form-action">

		<c:if test="${not empty doctor}">
			<p>Not empty</p>
			<p>"${doctor.doctor_id}"</p>
			<p>"${doctor.doctor_specialization}"</p>
			<p>"${doctor.doctor_qualification }"</p>
		</c:if>
		
		<label for="doctorName">Patient's Name:</label>
        <input type="text" id="username" name="user_name" value="${user.user_name}" readonly>
        <br>
        
        <label for="doctorName">Doctor Name:</label>
        <input type="text" id="doctorName" name="doctor_name" value="${doctorFullDetails.user_name}" readonly>
        <br>

        <label for="doctorSpecialization">Doctor Specialization:</label>
        <input type="text" id="doctorSpecialization" name="doctor_specialization" value="${doctor.doctor_specialization}" readonly>
        <br>

        <label for="doctorExperience">Doctor Experience (in years):</label>
        <input type="number" id="doctorExperience" name="doctor_experience" value="${doctor.doctor_experience}" readonly>
        <br>

        <label for="appointmentDate">Appointment Date:</label>
        <input type="date" id="appointmentDate" name="appointment_date" value="${appointmentDate}" >
        <br>
        <label>Appointment Time:</label>
        <br>
        
		<c:forEach var="slot" items="${slots}">
	    	<c:set var="slotId" value="${slot.slot_id}" />
		    <input 
		        type="radio" 
		        id="slot${slotId}" 
		        name="appointment_time" 
		        value="${slotId}" 
		        class="slot-option"
		        <c:choose>
		            <c:when test="${not dateSelected}">
		                disabled
		            </c:when>
		            <c:when test="${bookedSlots != null and bookedSlots.contains(slotId)}">
		                disabled
		            </c:when>
		        </c:choose>
	    	/>
		    <label for="slot${slotId}" class="slot-label">
		        ${slot.slot_time}
		    </label>
		</c:forEach>

		<br>
        <label for="appointmentType">Appointment Type:</label>
        <select id="appointmentType" name="appointment_type" required>
            <option value="physical">Physical</option>
            <option value="online">Online</option>
        </select>
        <br>

        <button type="submit" onclick="document.getElementById('form-action').value='book'">Submit</button>
    </form>

</body>
    <script>
    console.log("running");
    	let input= document.getElementById('appointmentDate');
    	console.log(input);
    	input.addEventListener('change',()=>{
    		if (input.value){
    			document.getElementById('form-action').value="check";
    			document.getElementById('appointment-form').submit();
    		}
    	}) 
    </script>
</html>