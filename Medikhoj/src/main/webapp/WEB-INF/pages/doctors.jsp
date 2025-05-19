<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/doctors.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/modal.css">

</head>
<body>
	<%@ include file="header.jsp" %>
	
    <main>
        <div class="filter">
            <div class="filter-heading">
                <p>Filter</p>
            </div>
            <div class="filter-content">
                <form action="" class="filter-form">
                    <fieldset class="filter-fieldset">
                        <legend class="fieldset-header">Specialization</legend>
                        <div class="filter-options">

                            <div class="filter-option">
                                <input type="checkbox" id="physician" name="specialization" value="physician">
                                <label for="physician">Physician</label>
                            </div>
                            <div class="filter-option">
                                <input type="checkbox" id="ent" name="specialization" value="ent">
                                <label for="ent">ENT</label>
                            </div>
                            <div class="filter-option">
                                <input type="checkbox" id="cardiologist" name="specialization" value="cardiologist">
                                <label for="cardiologist">Cardiologist</label>
                            </div>
                            <div class="filter-option">
                                <input type="checkbox" id="neurologist" name="specialization" value="neurologist">
                                <label for="neurologist">Neurologist</label>
                            </div>
                            <div class="filter-option">
                                <input type="checkbox" id="dermatologist" name="specialization" value="dermatologist">
                                <label for="dermatologist">Dermatologist</label>
                            </div>
                        </div>
                    </fieldset>
                    <fieldset class="filter-fieldset">
                        <legend class="fieldset-header">Qualification</legend>
                        <div class="filter-options">

                            <div class="filter-option">
                                <input type="checkbox" id="mbbs" name="qualification" value="mbbs">
                                <label for="mbbs">MBBS</label>
                            </div>
                            <div class="filter-option">
                                <input type="checkbox" id="md" name="qualification" value="md">
                                <label for="md">MD</label>
                            </div>
                            <div class="filter-option">
                                <input type="checkbox" id="ms" name="qualification" value="ms">
                                <label for="ms">MS</label>
                            </div>
                        </div>
                    </fieldset >
                    <fieldset class="filter-fieldset">
                        <legend class="fieldset-header">Experience</legend>
                        <div class="filter-options">

                            <div class="filter-option">
                                <input type="checkbox" id="experience-0-5" name="experience" value="0-5">
                                <label for="experience-0-5">0-5 yrs</label>
                            </div>
                            <div class="filter-option">
                                <input type="checkbox" id="experience-5-10" name="experience" value="5-10">
                                <label for="experience-5-10">5-10 yrs</label>
                            </div>
                            <div class="filter-option">
                                <input type="checkbox" id="experience-10-plus" name="experience" value="10+">
                                <label for="experience-10-plus">10+ yrs</label>
                            </div>
                        </div>
                    </fieldset>
                    <button type="reset" class="reset-filter">Reset filters</button>
                </form>
            </div>
        </div>
        <div class="main-content">
            <div class="main-top">
                <div class="search-bar">
                    <input type="text" placeholder="Search for doctors"/>
                    <!--<img src="Search icon.png" alt="">-->
                </div>
                <div class="sort-section">
                    <p>Sort by:</p>
                    <select name="sort" id="sort">
                        <option value="rating-desc">Ratings: High to low</option>
                        <option value="rating-aesc">Ratings: Low to high</option>
                        <option value="experience">Experience</option>
                    </select>
                </div>
            </div>
            <c:choose>
            	<c:when test="${not empty error}">
            		<p>${error}</p>
            	</c:when>
            	<c:otherwise>
            	
            	
            <div class="doctors-list">
            	<c:forEach var="doctor" items="${doctorList}">
            		<div class="doctor-card__container">
	                    <form action="${pageContext.request.contextPath}/doctorProfile" class="doctor-card">
	                    	<input type="hidden" name="doctorId" value="${doctor.doctor_id}">
	                        <button class="doctor">
	                            <img src="${pageContext.request.contextPath}/resources/images/uploads/${doctor.user_profile}" alt="" class="doctor-image">
	                            <div class="doctor-info">
	                                <p>${doctor.user_name}</p>
	                                <p>${doctor.doctor_specialization}</p>
	                                <div class="doctor-availability">
	                                    <div class="available-date availability-info">
	                                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" 
	                                        stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-calendar-icon 
	                                        lucide-calendar"><path d="M8 2v4"/><path d="M16 2v4"/><rect width="18" height="18" x="3" y="4" rx="2"/><path d="M3 10h18"/>
	                                        </svg>
	
	                                        <p>Available dates: Monday-Friday </p>
	                                    </div>
	                                    <div class="available-time availability-info" >
	                                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" 
	                                        stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round" 
	                                        class="lucide lucide-clock-icon lucide-clock"><circle cx="12" cy="12" r="10"/>
	                                        <polyline points="12 6 12 12 16 14"/>
	                                        </svg>
	                                        <p>Available time: 1:00 P.M - 3:00 P.M</p>
	                                    </div>
	                                </div>
	                                <p>Reviews : 4.5/5</p>
	                            </div>
	                        </button>
	                    </form> 
	                    <form action="">
	                        <div class="action-buttons">
	                            <button>Book appointment</button>
	                        </div>
	                    </form>
                	</div>
            	</c:forEach>
                
            </div>
            </c:otherwise>
            </c:choose>
        </div>
    </main>
    <%@ include file="footer.jsp" %>
</body>
</html>