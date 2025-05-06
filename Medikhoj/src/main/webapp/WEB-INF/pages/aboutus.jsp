<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/aboutus.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
</head>
<body>
	<%@ include file="header.jsp" %>
	<div class="hero-banner">
        <h1>Get to know Clinic</h1>
        <p>Who are we and what we do goes beyond providing health services.<br>Learn how we make difference around the world</p>
      </div>
      
      <div class="container">
        <!-- Our Story Section -->
        <section class="content-section">
          <h2 class="section-label">Our Story</h2>
          <h2 class="section-heading">Welcome to Our Medical Clinic</h2>
          <div class="story-container">
            <div class="story-content">
              <p>Established in 2015, our clinic has grown into a trusted healthcare provider, backed by a dedicated team of experienced medical professionals.  Our collaborative approach ensures that every patient receives tailored treatment plans designed to meet their unique needs, from initial consultation to follow-up care.</p>
              <p>Equipped with state-of-the-art medical technology and modern facilities, [Clinic Name] offers a wide range of diagnostic and therapeutic services under one roof. Whether you're seeking routine check-ups, specialized treatment, or long-term health management, our clinic is here to support you at every stage of your wellness journey.</p>
            </div>
            <div class="story-image">
              <img src="${pageContext.request.contextPath}/resources/images/assets/bed.png" alt="Hospital room with medical equipment">
            </div>
          </div>
        </section>
        
        <section class="content-section">
            <div class="section-label" style="text-align: right;">Our Doctors</div>
            <!-- <h2 class="section-heading">Meet Our Experts</h2> -->
            
            <div class="story-container">
              <!-- Left Side: Image -->
              <div class="story-image">
                <img src="${pageContext.request.contextPath}/resources/images/assets/check.png" alt="Doctor examining patient's hand">
              </div>
          
              <!-- Right Side: Doctor Cards -->
              <div class="story-content doctors-list">
                <div class="doctor-card">
                  <div class="doctor-image">
                    <img src="${pageContext.request.contextPath}/resources/images/assets/slesha.png" alt="Dr. Samyukta Rai">
                  </div>
                  <div class="doctor-info">
                    <h3 class="doctor-name">Dr. Samyukta Rai</h3>
                    <p class="doctor-specialty">Cardiologist with 10+ years of experience. Specializes in cardiac care, treatment, and ECG test interpretation.</p>
                  </div>
                </div>
          
                <div class="doctor-card">
                  <div class="doctor-image">
                    <img src="${pageContext.request.contextPath}/resources/images/assets/doc2.png" alt="Dr. Suyesh Rimal">
                  </div>
                  <div class="doctor-info">
                    <h3 class="doctor-name">Dr. Suyesh Rimal</h3>
                    <p class="doctor-specialty">General Physician with 15+ years of experience. Expert in general checkups and treatment of common illnesses.</p>
                  </div>
                </div>
              </div>
            </div>
          </section>
      </div>
	<%@ include file="footer.jsp" %>
</body>
</html>