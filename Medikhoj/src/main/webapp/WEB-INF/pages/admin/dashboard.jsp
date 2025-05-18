<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
    <%@ page import="java.util.Map, java.util.Map.Entry" %>
      
       <c:set var="page" value="dashboard"></c:set>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Insert title here</title>
<head>
       
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dashboard.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
</head>
<body>
	<%@ include file="adminNav.jsp" %>

    <div class="main-content">
    	<div class="topbar">
            <div class="topbar__title">Admin Dashboard</div>
            <div class="topbar__actions">
                <span>Welcome, Admin</span>
                <div class="topbar__avatar">A</div>
            </div>
        </div>
        <div class="main-content-wrapper">
            <div class="dashboard-stats-row">
	            <c:forEach var="stat" items="${statsList}">
	            	<div class="stat-card stat-card-flex">
	                    <div class="stat-card-content">
	                        <h4>${stat.statTitle}</h4>
	                        <p class="stat-value appointments">${stat.statValue}</p>
	                        <c:if test="${not empty stat.trendValue}">
		                        <div class="stat-trend ${stat.trendDirection}">
		                            <span class="trend-arrow"><i class="fa-solid fa-arrow-${stat.trendDirection}"></i></span>
		                            <span class="trend-value">${stat.trendValue}</span>
		                            <span class="trend-label">
		                            <c:choose>
		                            <c:when  test="${stat.statTitle.equals('Weekly Registrations') }">
		                            	since last week
		                            </c:when>
		                            <c:otherwise>
		                            	since yesterday
		                            </c:otherwise>
		                            </c:choose>
		                            </span>
		                        </div>
	                        </c:if>
	                    </div>
	                    <c:choose>
							<c:when test="${stat.statTitle == 'Today\\'s Appointments'}">
		                    	<div class="stat-card-icon calendar">
		                        	<i class="fa-solid fa-calendar" style="color: #2a7be4; font-size: 1.3em;"></i>
		                    	</div>
	                    	</c:when>
	                    	<c:when test="${stat.statTitle.equals('Weekly Registrations') }">
	                    		<div class="stat-card-icon user">
			                        <i class="fa-solid fa-user" style="color: #27ae60; font-size: 1.3em;"></i>
			                    </div>
	                    	</c:when>
	                    	<c:when test="${stat.statTitle.equals('Pending Appointment') }">
	                    		<div class="stat-card-icon hourglass">
			                        <i class="fa-solid fa-hourglass-half" style="color: #ff9800; font-size: 1.3em;"></i>
			                    </div>
	                    	</c:when>
	                    	<c:otherwise>
		                    	<div class="stat-card-icon calendar-days">
			                        <i class="fa-solid fa-calendar-days" style="color: #8e44ad; font-size: 1.3em;"></i>
			                    </div>
	                    	</c:otherwise>
	                    </c:choose>
	                    
	                </div>
	            </c:forEach>
            </div>
            <div class="dashboard-main-row">
                <div class="appointments-overview">
                    <h3 class="dashboard-section-title">Appointments Overview</h3>
                    <div class="chart-placeholder">
                        <div id="apptOverviewChart" width="100%" height="60"></div>
                    </div>
                </div>
                <div class="department-chart">
                    <h3 class="dashboard-section-title">Time slots with Most Appointments</h3>
                    <div class="chart-placeholder">
                        <div id="timeChart" width="100%" height="60"></div>
                    </div>
                </div>
            </div>
            <div class="dashboard-main-row">
                <div class="most-appointed-doctors">
                    <h3 class="dashboard-section-title">Most Appointed Doctors</h3>
                    <ul class="doctors-list">
	                    <c:forEach var="doctor" items="${highestAppointed}">
	                   	 	<li>
	                            <div style="display: flex; align-items: center;">
	                                <img src="https://randomuser.me/api/portraits/women/44.jpg" alt="Dr. Jane Smith" class="doctors-list-img">
	                                <span>${doctor.doctor_name}</span>
	                            </div>
	                            <span class="appt-count"><i class="fa-solid fa-calendar-check"></i>${doctor.total_appointments}</span>
	                        </li>
	                    </c:forEach>
                    </ul>
                </div>
                <div class="most-reviewed-doctors">
                    <h3 class="dashboard-section-title">Highest Rated Doctors</h3>
                    <ul class="doctors-list">
                    <c:forEach var="doctor" items="${highestrated}">
                    	<li>
                            <div style="display: flex; align-items: center;">
                                <img src="https://randomuser.me/api/portraits/men/45.jpg" alt="Dr. Alex Turner" class="doctors-list-img">
                                <span>${doctor.doctor_name }</span>
                            </div>
                            <span class="appt-count">
                                <i class="fa-solid fa-star" style="color: #f1c40f;"></i>
                                ${doctor.doctor_rating }
                            </span>
                        </li>
                    </c:forEach>
                    </ul>
                </div>
                <div class="recent-appointments" style="flex:1.5; min-width:320px; margin-left:10px; background:#fff; border-radius:10px; box-shadow:0 2px 8px rgba(0,0,0,0.05); padding:24px 20px;">
                    <h3 class="dashboard-section-title">Upcoming Appointments</h3>
                    <ul class="doctors-list">
                    <c:forEach var="appointment" items="${upcomingAppointments}">
                    	<li>
                            <div style="display:flex; align-items:center;">
                                <img src="https://randomuser.me/api/portraits/men/23.jpg" alt="Patient John Carter" class="doctors-list-img">
                                <div style="margin-left:10px;">
                                    <div><strong>${appointment.user_name}</strong> with ${appointment.doctor_name }</div>
                                    <div style="font-size:0.95em; color:#888;">${appointment.doctor_specialization} &middot; ${appointment.appointment_date} ${appointment.appointment_time}</div>
                                </div>
                            </div>
                            <span class="appt-count"><i class="fa-solid fa-calendar-check"></i>Upcoming</span>
                        </li>
                    </c:forEach>	
                    </ul>
                </div>
            </div>
        </div>
    </div>
    
    <script>
	  // Render the  map passed by java as a JS object literal
	  const barGraphData = {
	    <% 
	      Map<String, Integer> barMap = (Map<String, Integer>) request.getAttribute("barGraphData");
	      if (barMap != null) {
	        int count = 0;
	        for (Map.Entry<String, Integer> entry : barMap.entrySet()) {
	          String key = entry.getKey();
	          Integer value = entry.getValue();
	          out.print("'" + key + "': " + value);
	          if (++count < barMap.size()) out.print(", ");
	        }
	      }
	    %>
	  };
	  
	  
	  const lineGraphData = {
			    <% 
			      Map<String, Integer> lineMap = (Map<String, Integer>) request.getAttribute("lineGraphData");
			      if (lineMap != null) {
			        int count = 0;
			        for (Map.Entry<String, Integer> entry : lineMap.entrySet()) {
			          String key = entry.getKey();
			          Integer value = entry.getValue();
			          out.print("'" + key + "': " + value);
			          if (++count < lineMap.size()) out.print(", ");
			        }
			      }
			    %>
			  };
	
	  // Convert the object into arrays
	  const barGraphLabels = Object.keys(barGraphData);
	  const barGraphValues = Object.values(barGraphData);
	  
	  const lineGraphLabels=Object.keys(lineGraphData);
	  const lineGraphValues=Object.values(lineGraphData);
	  
	  // Bar chart
	  var barOptions = {
	    chart: {
	      type: 'bar',
	      height: '100%'
	    },
	    series: [{
	      name: 'Appointments',
	      data: barGraphValues
	    }],
	    xaxis: {
	      categories: barGraphLabels
	    },
	    yaxis: {
	        min: 0,
	        max: Math.max(...barGraphValues),
	        tickAmount: Math.max(...barGraphValues) // creates step of 1
	      }
	  };

	  var barChart = new ApexCharts(document.querySelector("#timeChart"), barOptions);
	  barChart.render();

	  // Line chart
	  var lineOptions = {
	    chart: {
	      type: 'line',
	      height: '100%'
	    },
	    series: [{
	      name: 'Appointments',
	      data: lineGraphValues
	    }],
	    xaxis: {
	      categories: lineGraphLabels
	    },
	    yaxis: {
	        min: 0,
	        max: Math.max(...barGraphValues),
	        tickAmount: Math.max(...barGraphValues) // creates step of 1
	     }
	  };

	  var lineChart = new ApexCharts(document.querySelector("#apptOverviewChart"), lineOptions);
	  lineChart.render();


	
	  console.log(barGraphLabels);
	  console.log(barGraphValues);
	  
	  
	  
	</script>

    
</body>
</html>
