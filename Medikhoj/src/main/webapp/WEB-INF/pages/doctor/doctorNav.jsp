

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Doctor Navigation</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/doctorNav.css"/>
</head>

<body>
  <nav class="nav">
    <div class="navbar-top">
      <h1>Medikhoj</h1>
      <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor"
           stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-menu-icon lucide-menu">
        <line x1="4" x2="20" y1="12" y2="12" />
        <line x1="4" x2="20" y1="6" y2="6" />
        <line x1="4" x2="20" y1="18" y2="18" />
      </svg>
    </div>

    <div class="nav-links__container">
      <div class="nav-section">
        <h3 class="nav-section__heading">OVERVIEW</h3>
        <ul>
          <li class="nav-link">
            <a href="#">
              <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 24 24" fill="none"
                   stroke="currentColor" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round"
                   class="lucide lucide-layout-dashboard-icon lucide-layout-dashboard">
                <rect width="7" height="9" x="3" y="3" rx="1" />
                <rect width="7" height="5" x="14" y="3" rx="1" />
                <rect width="7" height="9" x="14" y="12" rx="1" />
                <rect width="7" height="5" x="3" y="16" rx="1" />
              </svg>
              <span class="nav-section__link">Dashboard</span>
            </a>
          </li>
        </ul>
      </div>

      <div class="nav-section">
        <h3 class="nav-section__heading">MANAGEMENT</h3>
        <ul>
          <li class="nav-link">
            <a href="#" class="active">
              <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 24 24" fill="none"
                   stroke="currentColor" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round"
                   class="lucide lucide-users-icon lucide-users">
                <path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2" />
                <circle cx="9" cy="7" r="4" />
                <path d="M22 21v-2a4 4 0 0 0-3-3.87" />
                <path d="M16 3.13a4 4 0 0 1 0 7.75" />
              </svg>
              <span class="nav-section__link">My Profile</span>
            </a>
          </li>

          <li class="nav-link">
            <a href="${pageContext.request.contextPath}/doctorAppointments">
              <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 24 24" fill="none"
                   stroke="currentColor" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round"
                   class="lucide lucide-calendar-days-icon lucide-calendar-days">
                <path d="M8 2v4" />
                <path d="M16 2v4" />
                <rect width="18" height="18" x="3" y="4" rx="2" />
                <path d="M3 10h18" />
                <path d="M8 14h.01" />
                <path d="M12 14h.01" />
                <path d="M16 14h.01" />
                <path d="M8 18h.01" />
                <path d="M12 18h.01" />
                <path d="M16 18h.01" />
              </svg>
              <span class="nav-section__link">My Appointments</span>
            </a>
          </li>

          <li class="nav-link">
            <a href="${pageContext.request.contextPath}/doctorReviews">
              <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 24 24" fill="none"
                   stroke="currentColor" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round"
                   class="lucide lucide-star-icon lucide-star">
                <path d="M11.525 2.295a.53.53 0 0 1 .95 0l2.31 4.679a2.123 2.123 0 0 0 1.595 1.16l5.166.756a.53.53 0 0 1 .294.904l-3.736 3.638a2.123 2.123 0 0 0-.611 1.878l.882 5.14a.53.53 0 0 1-.771.56l-4.618-2.428a2.122 2.122 0 0 0-1.973 0L6.396 21.01a.53.53 0 0 1-.77-.56l.881-5.139a2.122 2.122 0 0 0-.611-1.879L2.16 9.795a.53.53 0 0 1 .294-.906l5.165-.755a2.122 2.122 0 0 0 1.597-1.16z" />
              </svg>
              <span class="nav-section__link">My Reviews</span>
            </a>
          </li>
        </ul>
      </div>

      <div class="nav-section">
        <h3 class="nav-section__heading">ACCOUNT</h3>
        <ul>
          <li class="nav-link">
            <a href="${pageContext.request.contextPath}/logout">
              <svg width="25" height="25" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M21 12L13 12" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M18 15L20.913 12.087C20.961 12.039 20.961 11.961 20.913 11.913L18 9" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M16 5V4.5C16 3.67 15.33 3 14.5 3H5C3.9 3 3 3.9 3 5V19C3 20.1 3.9 21 5 21H14.5C15.33 21 16 20.33 16 19.5V19" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
              </svg>
              <span class="nav-section__link">Log out</span>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</body>
</html>
