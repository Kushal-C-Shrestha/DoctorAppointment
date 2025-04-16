<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/doctors.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
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
                    <img src="Search icon.png" alt="">
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
            <div class="main-content__container">
                <div class="doctors-list">
                    <div class="doctor">
                        <div class="doctor-image">
                            <img src="image 935.png" alt="">
                        </div>
                        <div class="doctor-content__container">
                            <div class="doctor-info">
                                <p>Dr. Ram bahadur Shrestha</p>
                                <p>Caridologist</p>
                                <p>Available dates: Monday-Friday </p>
                                <p>Available time: 1:00 P.M - 3:00 P.M</p>
                                <p>Reviews : 4.5/5</p>
                            </div>
    
                            <div class="action-buttons">
                                <button>Book appointment</button>
                            </div>
                        </div>
                    </div>
                    <div class="doctor">
                        <div class="doctor-image">
                            <img src="image 935.png" alt="">
                        </div>
                        <div class="doctor-content__container">
                            <div class="doctor-info">
                                <p>Dr. Ram bahadur Shrestha</p>
                                <p>Caridologist</p>
                                <p>Available dates: Monday-Friday Available time: 1:00 P.M - 3:00 P.M</p>
                                <p>Reviews : 4.5/5</p>
                            </div>
    
                            <div class="action-buttons">
                                <button>Book appointment</button>
                            </div>
                        </div>
                    </div>
                    <div class="doctor">
                        <div class="doctor-image">
                            <img src="image 935.png" alt="">
                        </div>
                        <div class="doctor-content__container">
                            <div class="doctor-info">
                                <p>Dr. Ram bahadur Shrestha</p>
                                <p>Caridologist</p>
                                <p>Available dates: Monday-Friday Available time: 1:00 P.M - 3:00 P.M</p>
                                <p>Reviews : 4.5/5</p>
                            </div>
    
                            <div class="action-buttons">
                                <button>Book appointment</button>
                            </div>
                        </div>
                    </div>
                    <div class="doctor">
                        <div class="doctor-image">
                            <img src="image 935.png" alt="">
                        </div>
                        <div class="doctor-content__container">
                            <div class="doctor-info">
                                <p>Dr. Ram bahadur Shrestha</p>
                                <p>Caridologist</p>
                                <p>Available dates: Monday-Friday Available time: 1:00 P.M - 3:00 P.M</p>
                                <p>Reviews : 4.5/5</p>
                            </div>
    
                            <div class="action-buttons">
                                <button>Book appointment</button>
                            </div>
                        </div>
                    </div>
                    <div class="doctor">
                        <div class="doctor-image">
                            <img src="image 935.png" alt="">
                        </div>
                        <div class="doctor-content__container">
                            <div class="doctor-info">
                                <p>Dr. Ram bahadur Shrestha</p>
                                <p>Caridologist</p>
                                <p>Available dates: Monday-Friday Available time: 1:00 P.M - 3:00 P.M</p>
                                <p>Reviews : 4.5/5</p>
                            </div>
    
                            <div class="action-buttons">
                                <button>Book appointment</button>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    </main>
    <%@ include file="footer.jsp" %>
</body>
</html>