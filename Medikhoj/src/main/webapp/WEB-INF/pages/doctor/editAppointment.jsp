<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.medikhoj.model.AppointmentModel" %>
<%
    AppointmentModel appointment = (AppointmentModel) request.getAttribute("appointment");
    if (appointment == null) {
        response.sendRedirect(request.getContextPath() + "/doctorAppointments");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Appointment</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/doctorAppointments.css" />
</head>
<body>

<%@ include file="doctorNav.jsp" %>

<div class="main-content" style="padding: 2rem;">
    <h2>Edit Appointment</h2>

    <form action="${pageContext.request.contextPath}/editAppointment" method="post" style="display: flex; flex-direction: column; max-width: 400px;">
        <input type="hidden" name="appointment_id" value="<%= appointment.getAppointment_id() %>"/>

        <label for="appointment_title">Title:</label>
        <input type="text" id="appointment_title" name="appointment_title" value="<%= appointment.getAppointment_title() %>" required />
        <label for="appointment_date">Date:</label>
		<input type="date" id="appointment_date" name="appointment_date" value="<%= appointment.getAppointment_date() %>" required />
		
		<label for="appointment_time">Time Slot:</label>
		<select name="appointment_time" id="appointment_time" required>
		    <c:forEach var="slot" items="${slots}">
			  <c:set var="isSelected" value="${appointment.appointment_time == slot.slot_id}" />
			  <option value="${slot.slot_id}" ${isSelected ? 'selected="selected"' : ''}>
			    ${slot.formatted_time}
			  </option>
			</c:forEach>

		</select>
        

        <label for="appointment_type">Type:</label>
        <select name="appointment_type" id="appointment_type" required>
            <option value="online" <%= "online".equals(appointment.getAppointment_type()) ? "selected" : "" %>>Online</option>
            <option value="in_person" <%= "in_person".equals(appointment.getAppointment_type()) ? "selected" : "" %>>In Person</option>
        </select>

        <label for="appointment_status">Status:</label>
        <select name="appointment_status" id="appointment_status" required>
            <option value="pending" <%= "pending".equals(appointment.getAppointment_status()) ? "selected" : "" %>>Pending</option>
            <option value="confirmed" <%= "confirmed".equals(appointment.getAppointment_status()) ? "selected" : "" %>>Confirmed</option>
            <option value="cancelled" <%= "cancelled".equals(appointment.getAppointment_status()) ? "selected" : "" %>>Cancelled</option>
        </select>

        <br/>
        <button type="submit">Save Changes</button>
        <a href="${pageContext.request.contextPath}/doctorAppointments" style="margin-top: 1rem;">Cancel</a>
    </form>

  

</body>
</html>
