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
	<section class="hero">
    <div class="hero-content">
      <h1 class="hero-title">
        <span class="hero-title-accent">EXPERT CARE,</span> JUST A CLICK AWAY.
      </h1>
      <p class="hero-description">
        Skip the long queues, book your appointment in seconds, and get the care you deserve! Ready to take control of your health? <span class="teal-text">Go ahead</span> or book an appointment today.
      </p>
      <button class="btn btn-accent">BOOK AN APPOINTMENT</button>
    </div>
    <div class="hero-image">
      <div class="hero-image-container">
        <div class="speech-bubble"></div>
        <img src="/api/placeholder/350/350" alt="Doctor with clipboard">
      </div>
    </div>
  </section>

  <!-- Features Section -->
  <section class="features">
    <!-- Feature 1 -->
    <div class="feature-card">
      <div class="feature-icon">
        <svg viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">
          <rect width="40" height="48" rx="4" fill="#E6FCFD"/>
          <path d="M8 10H32" stroke="#07B9C4" stroke-width="2"/>
          <path d="M8 16H26" stroke="#07B9C4" stroke-width="2"/>
          <path d="M8 22H28" stroke="#07B9C4" stroke-width="2"/>
          <path d="M18 38V28" stroke="#07B9C4" stroke-width="2"/>
          <path d="M13 33H23" stroke="#07B9C4" stroke-width="2"/>
          <rect x="4" y="4" width="32" height="40" rx="4" stroke="#07B9C4" stroke-width="2"/>
        </svg>
      </div>
      <div class="feature-content">
        <h3>Book an Appointment</h3>
        <p>Schedule a visit with one of our healthcare providers</p>
      </div>
    </div>

    <!-- Feature 2 -->
    <div class="feature-card">
      <div class="feature-icon">
        <svg viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M8 20C8 14.4772 12.4772 10 18 10C23.5228 10 28 14.4772 28 20V32C28 37.5228 23.5228 42 18 42C12.4772 42 8 37.5228 8 32V20Z" fill="#E6FCFD"/>
          <path d="M28 18L34 14" stroke="#07B9C4" stroke-width="2" stroke-linecap="round"/>
          <path d="M28 22L34 26" stroke="#07B9C4" stroke-width="2" stroke-linecap="round"/>
          <path d="M28 26L34 30" stroke="#07B9C4" stroke-width="2" stroke-linecap="round"/>
          <path d="M8 20C8 14.4772 12.4772 10 18 10C23.5228 10 28 14.4772 28 20V32C28 37.5228 23.5228 42 18 42C12.4772 42 8 37.5228 8 32V20Z" stroke="#07B9C4" stroke-width="2"/>
        </svg>
      </div>
      <div class="feature-content">
        <h3>Health Campaigns</h3>
        <p>Stay informed about health awareness events</p>
      </div>
    </div>

    <!-- Feature 3 -->
    <div class="feature-card">
      <div class="feature-icon">
        <svg viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">
          <rect x="8" y="8" width="32" height="24" rx="2" fill="#E6FCFD"/>
          <rect x="8" y="8" width="32" height="24" rx="2" stroke="#07B9C4" stroke-width="2"/>
          <path d="M8 16H40" stroke="#07B9C4" stroke-width="2"/>
          <path d="M18 24H30" stroke="#07B9C4" stroke-width="2"/>
          <path d="M18 30H24" stroke="#07B9C4" stroke-width="2"/>
          <path d="M16 40L24 32L32 40" stroke="#07B9C4" stroke-width="2"/>
        </svg>
      </div>
      <div class="feature-content">
        <h3>Online Consultation</h3>
        <p>Connect with doctors virtually for medical advice</p>
      </div>
    </div>

    <!-- Feature 4 -->
    <div class="feature-card">
      <div class="feature-icon">
        <svg viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">
          <circle cx="24" cy="24" r="16" fill="#E6FCFD"/>
          <circle cx="24" cy="24" r="16" stroke="#07B9C4" stroke-width="2"/>
          <path d="M24 16V24L30 30" stroke="#07B9C4" stroke-width="2"/>
          <path d="M36 24H32" stroke="#07B9C4" stroke-width="2" stroke-linecap="round"/>
          <path d="M16 24H12" stroke="#07B9C4" stroke-width="2" stroke-linecap="round"/>
          <path d="M24 12V16" stroke="#07B9C4" stroke-width="2" stroke-linecap="round"/>
          <path d="M24 32V36" stroke="#07B9C4" stroke-width="2" stroke-linecap="round"/>
        </svg>
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
          <svg viewBox="0 0 64 64" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M32 56C45.2548 56 56 45.2548 56 32C56 18.7452 45.2548 8 32 8C18.7452 8 8 18.7452 8 32C8 45.2548 18.7452 56 32 56Z" fill="#E6FCFD"/>
            <path d="M32 20V32H44" stroke="#07B9C4" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"/>
            <path d="M32 56C45.2548 56 56 45.2548 56 32C56 18.7452 45.2548 8 32 8C18.7452 8 8 18.7452 8 32C8 45.2548 18.7452 56 32 56Z" stroke="#07B9C4" stroke-width="3"/>
          </svg>
        </div>
        <h3 class="service-title">General Services</h3>
        <p class="service-description">We provide essential healthcare services including routine check-ups and primary care.</p>
      </div>
      
      <!-- Diagnostic Services Card -->
      <div class="service-card">
        <div class="service-icon">
          <svg viewBox="0 0 64 64" fill="none" xmlns="http://www.w3.org/2000/svg">
            <rect x="16" y="8" width="32" height="48" rx="2" fill="#E6FCFD"/>
            <path d="M16 16H48" stroke="#07B9C4" stroke-width="3"/>
            <path d="M32 32V40" stroke="#07B9C4" stroke-width="3" stroke-linecap="round"/>
            <circle cx="32" cy="48" r="4" fill="#07B9C4"/>
            <rect x="16" y="8" width="32" height="48" rx="2" stroke="#07B9C4" stroke-width="3"/>
          </svg>
        </div>
        <h3 class="service-title">Diagnostic Services</h3>
        <p class="service-description">Our clinic offers reliable lab tests and screenings for accurate health assessment.</p>
      </div>
      
      <!-- Specialist Consultation Card -->
      <div class="service-card">
        <div class="service-icon">
          <svg viewBox="0 0 64 64" fill="none" xmlns="http://www.w3.org/2000/svg">
            <circle cx="32" cy="24" r="16" fill="#E6FCFD"/>
            <path d="M32 40V48" stroke="#07B9C4" stroke-width="3"/>
            <circle cx="32" cy="24" r="16" stroke="#07B9C4" stroke-width="3"/>
            <path d="M16 48H48" stroke="#07B9C4" stroke-width="3"/>
            <path d="M28 20C28 17.7909 29.7909 16 32 16V16C34.2091 16 36 17.7909 36 20V20C36 22.2091 34.2091 24 32 24V24C29.7909 24 28 22.2091 28 20V20Z" fill="#07B9C4"/>
            <path d="M24 36V36C24 31.5817 27.5817 28 32 28V28C36.4183 28 40 31.5817 40 36V36" stroke="#07B9C4" stroke-width="3"/>
          </svg>
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
      <h2 class="teal-text">our platform</h2>
      <h2> works</h2>
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
        <img src="/api/placeholder/400/500" alt="Doctor with tablet">
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
            <img src="/api/placeholder/48/48" alt="Patient Avatar">
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
            <img src="/api/placeholder/48/48" alt="Patient Avatar">
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
            <img src="/api/placeholder/48/48" alt="Patient Avatar">
          </div>
          <div class="testimonial-info">
            <h4>David Reed</h4>
            <p>Patient</p>
          </div>
        </div>
      </div>
    </div>
  </section>
	<%@ include file="footer.jsp" %>
</body>
</html>