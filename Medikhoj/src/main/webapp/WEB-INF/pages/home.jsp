<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
</head>
<body>
	<%@ include file="header.jsp" %>
		<div class="home">
  <section class="main">  
    <div class="main-content">
      <h1 class="main-title">
        <span class="main-title-accent">EXPERT CARE,</span> JUST A CLICK <br>AWAY.
      </h1>
      <p class="main-description">
        <span class="teal-text">Skip the long queues,</span> book your appointment in seconds, and get the care <br>you deserve! Ready to take control of your health? <span class="teal-text">Go ahead</span> or book an <br>appointment today.
      </p>
      <form action="doctors" method="get">
      	<button class="btn btn-appoint" type="submit">BOOK AN APPOINTMENT</button>
      </form>
      
    </div>
    <div class="main-image">
        <img src="${pageContext.request.contextPath}/resources/images/assets/image 914.png" alt="Doctor with clipboard" width="380px" height="340px">
    </div>
  </section>

  <!-- Features Section -->
  <section class="features">
    <!-- Feature 1 -->
    <div class="feature-card">
      <div class="feature-icon">
        <img src="${pageContext.request.contextPath}/resources/images/assets//book.png" width="60px" height="70px"/>
      </div>
      <div class="feature-content">
        <h3>Book an Appointment</h3>
        <p>Schedule a visit with one of our healthcare providers</p>
      </div>
    </div>

    <!-- Feature 2 -->
    <div class="feature-card">
      <div class="feature-icon">
        <img src="${pageContext.request.contextPath}/resources/images/assets/campaign.png" width="60px" height="70px"/>
      </div>
      <div class="feature-content">
        <h3>Health Campaigns</h3>
        <p>Stay informed about health awareness events</p>
      </div>
    </div>

    <!-- Feature 3 -->
    <div class="feature-card">
      <div class="feature-icon">
        <img src="${pageContext.request.contextPath}/resources/images/assets/online.png" width="60px" height="70px"/>
      </div>
      <div class="feature-content">
        <h3>Online Consultation</h3>
        <p>Connect with doctors virtually for medical advice</p>
      </div>
    </div>

    <!-- Feature 4 -->
    <div class="feature-card">
      <div class="feature-icon">
        <img src="${pageContext.request.contextPath}/resources/images/assets/24hour.png" width="60px" height="70px"/>
      </div>
      <div class="feature-content">
        <h3>24 hour service</h3>
        <p>Support available around the clock for emergencies</p>
      </div>
    </div>
  </section>

  <!-- Services Section -->
  <section class="section">
    <h2 class="section-heading">Our Medical Services</h2>
    <p class="section-description">We have been providing quality treatment to our patients since 2010. 
    Enjoy personalized, professional and affordable medical advice, services and support.</p>
    
    <div class="services-grid">
      <!-- General Services Card -->
      <div class="service-card">
        <div class="service-icon">
          <img src="${pageContext.request.contextPath}/resources/images/assets/general.png" width="70px" height="75px">
        </div>
        <h3 class="service-title">General Services</h3>
        <p class="service-description">We provide essential healthcare services including routine check-ups and primary care.</p>
      </div>
      
      <!-- Diagnostic Services Card -->
      <div class="service-card">  
        <div class="service-icon">
          <img src="${pageContext.request.contextPath}/resources/images/assets/diagnostic.png" width="75px" height="80px">
        </div>
        <h3 class="service-title">Diagnostic Services</h3>
        <p class="service-description">Our clinic offers reliable lab tests and screenings for accurate health assessment.</p>
      </div>
      
      <!-- Specialist Consultation Card -->
      <div class="service-card">
        <div class="service-icon">
          <img src="${pageContext.request.contextPath}/resources/images/assets/specialist.png" width="75px" height="90px">
        </div>
        <h3 class="service-title">Specialist Consultation</h3>
        <p class="service-description">Consult with experienced specialists for personalized care and expert medical advice.</p>
      </div>
    </div>
  </section>

  <!-- How It Works Section -->
  <section class="how-it-works">
    <div class="how-it-works-heading">
      <h2>How </h2>
      <h2 class="teal-text">Our Platform</h2>
      <h2> Works</h2>
    </div>
    
    <div class="steps-container">
      <div class="steps-list">
        <div class="steps-timeline"></div>
        
        <!-- Step 1 -->
        <div class="step">
          <div class="step-number">1</div>
          <div class="step-content">
            <h3 class="step-title">Create your Profile</h3>
            <p class="step-description">Create an account and complete your detailed health profile. Our doctors will know all your needs even before meeting with you. Upload medical history.</p>
          </div>
        </div>
        
        <!-- Step 2 -->
        <div class="step">
          <div class="step-number">2</div>
          <div class="step-content">
            <h3 class="step-title">Choose your Service</h3>
            <p class="step-description">Select your type of appointment and find an available doctor for your needs. Medical help is simple and straight forward to access.</p>
          </div>
        </div>
        
        <!-- Step 3 -->
        <div class="step">
          <div class="step-number">3</div>
          <div class="step-content">
            <h3 class="step-title">Meet your doctor</h3>
            <p class="step-description">Meet in-clinic or connect with your doctor through our secure video conferencing tool. After your consultation, we'll create payment for services rendered.</p>
          </div>
        </div>
      </div>  
      
      <div class="steps-image">
        <img src="${pageContext.request.contextPath}/resources/images/assets/doc_work.png" alt="Doctor with tablet" width="360px" height="420px">
      </div>
    </div>
  </section>

  <!-- Testimonials Section -->
  <section class="testimonials">
    <div class="testimonials-heading">
      <h2 class="section-heading">What our Patients' Say</h2>
      <h2 class="section-heading teal-text">about our service</h2>
    </div>
    
    <div class="testimonials-grid">
      <!-- Testimonial 1 -->
      <div class="testimonial-card">
        <div class="testimonial-rating">
          <span>★</span>
          <span>★</span>
          <span>★</span>
          <span>★</span>
          <span>★</span>
        </div>
        <h4 class="testimonial-title">Great Caring Service</h4>
        <p class="testimonial-text">The doctors were so attentive and took the time to really understand my concerns. I felt heard and cared for throughout my visit.</p>
        <div class="testimonial-header">
          <div class="testimonial-image">
            <img src="${pageContext.request.contextPath}/resources/images/assets/rev1.png" alt="Patient Avatar">
          </div>
          <div class="testimonial-info">
            <h4>Sarah Reed</h4>
            <p>Patient</p>
          </div>
        </div>
      </div>

      <!-- Testimonial 2 -->
      <div class="testimonial-card">
        <div class="testimonial-rating">
          <span>★</span>
          <span>★</span>
          <span>★</span>
          <span>★</span>
          <span>★</span>
        </div>
        <h4 class="testimonial-title">Great Caring Service</h4>
        <p class="testimonial-text">The online consultation saved me so much time. The doctor was professional and the follow-up was excellent. Highly recommend!</p>
        <div class="testimonial-header">
          <div class="testimonial-image">
            <img src="${pageContext.request.contextPath}/resources/images/assets//rev2.png" alt="Patient Avatar">
          </div>
          <div class="testimonial-info">
            <h4>Maria Reed</h4>
            <p>Patient</p>
          </div>
        </div>
      </div>

      <!-- Testimonial 3 -->
      <div class="testimonial-card">
        <div class="testimonial-rating">
          <span>★</span>
          <span>★</span>
          <span>★</span>
          <span>★</span>
          <span>★</span>
        </div>
        <h4 class="testimonial-title">Great Caring Service</h4>
        <p class="testimonial-text">The appointment booking process was seamless, and the staff was friendly and efficient. I'm very pleased with the care I received.</p>
        <div class="testimonial-header">
          <div class="testimonial-image">
            <img src="${pageContext.request.contextPath}/resources/images/assets/rev3.png" alt="Patient Avatar">
          </div>
          <div class="testimonial-info">
            <h4>David Reed</h4>
            <p>Patient</p>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>
	<%@ include file="footer.jsp" %>
</body>
</html>