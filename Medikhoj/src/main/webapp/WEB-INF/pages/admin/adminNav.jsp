<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    <c:set var="page" value="${page}"></c:set>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/adminNav.css"/>

<!-- Navigation Sidebasr -->
  <nav class="nav">
    <div class="navbar-top">
      <h1>Medikhoj</h1>
      <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-menu-icon lucide-menu">
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
            <a href="dashboard" class="${page == 'dashboard' ? 'active' : ''}">
              <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-layout-dashboard-icon lucide-layout-dashboard">
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
          <li class="nav-link" >
            <a href="adminDoctors" class="${page == 'doctors' ? 'active' : ''}">
              <svg height="25px" width="25px" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 63.287 63.287" xml:space="preserve" fill="currentColor" stroke="currentColor">
                <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                <g id="SVGRepo_iconCarrier">
                  <path d="M60.993,20.124c0-4.404-3.583-7.987-7.987-7.987s-7.987,3.583-7.987,7.987
                                c0,4.065,3.054,7.423,6.987,7.918v20.74c0,6.896-5.61,12.505-12.506,12.505h-8.43
                                c-6.896,0-12.506-5.61-12.506-12.505V36.945h3.572c4.458,0,7.064-4.508,7.739-7.587
                                c0.104-0.625,2.575-15.366,2.941-20.494c0.139-1.929-0.544-3.806-1.92-5.284
                                c-1.503-1.614-3.628-2.54-5.83-2.54h-1.422C23.599,0.463,23.126,0,22.537,0H20.52
                                c-0.619,0-1.125,0.506-1.125,1.125v1.829c0,0.619,0.506,1.125,1.125,1.125h2.016
                                c0.589,0,1.062-0.462,1.108-1.04h1.422c1.648,0,3.24,0.694,4.366,1.903
                                c0.994,1.067,1.487,2.409,1.39,3.778c-0.36,5.033-2.895,20.153-2.91,20.256
                                c-0.507,2.307-2.522,5.967-5.776,5.967h-9.145c-3.254,0-5.27-3.66-5.767-5.918
                                C7.2,28.874,4.666,13.755,4.305,8.721c-0.098-1.369,0.396-2.71,1.39-3.778
                                C6.821,3.734,8.413,3.04,10.061,3.04h1.402c0.046,0.577,0.519,1.04,1.108,1.04h2.016
                                c0.619,0,1.125-0.506,1.125-1.125V1.125C15.714,0.506,15.207,0,14.588,0h-2.016
                                c-0.589,0-1.062,0.463-1.108,1.04h-1.402c-2.202,0-4.326,0.926-5.83,2.541
                                c-1.376,1.478-2.058,3.354-1.92,5.283c0.366,5.127,2.837,19.869,2.951,20.542
                                c0.665,3.03,3.271,7.539,7.729,7.539h3.572v11.836c0,7.999,6.507,14.505,14.506,14.505h8.43
                                c7.999,0,14.506-6.507,14.506-14.505v-20.74C57.939,27.547,60.993,24.189,60.993,20.124z
                                M53.006,26.111c-3.302,0-5.987-2.686-5.987-5.987s2.686-5.987,5.987-5.987
                                s5.987,2.686,5.987,5.987S56.307,26.111,53.006,26.111z
                                M53.006,16.732c-1.87,0-3.392,1.521-3.392,3.392s1.521,3.392,3.392,3.392
                                s3.392-1.521,3.392-3.392S54.876,16.732,53.006,16.732z
                                M53.006,21.515c-0.768,0-1.392-0.625-1.392-1.392s0.624-1.392,1.392-1.392
                                s1.392,0.625,1.392,1.392S53.773,21.515,53.006,21.515z"></path>
                </g>
              </svg>
              <span class="nav-section__link">Doctors</span>
            </a>
          </li>

          <li class="nav-link">
            <a href="adminUsers" class="${page == 'users' ? 'active' : ''}">
              <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-users-icon lucide-users">
                <path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2" />
                <circle cx="9" cy="7" r="4" />
                <path d="M22 21v-2a4 4 0 0 0-3-3.87" />
                <path d="M16 3.13a4 4 0 0 1 0 7.75" />
              </svg>
              <span class="nav-section__link">Users</span>
            </a>
          </li>

          <li class="nav-link">
            <a href="adminAppointments" class="${page == 'appointments' ? 'active' : ''}">
              <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-calendar-days-icon lucide-calendar-days">
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
              <span class="nav-section__link">Appointments</span>
            </a>
          </li>
        </ul>
      </div>

      <div class="nav-section">
        <h3 class="nav-section__heading">ENGAGEMENT</h3>
        <ul>
          <li class="nav-link">
            <a href="/adminCampaigns" class="${page == 'campaigns' ? 'active' : ''}">
              <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-megaphone-icon lucide-megaphone">
                <path d="m3 11 18-5v12L3 14v-3z" />
                <path d="M11.6 16.8a3 3 0 1 1-5.8-1.6" />
              </svg>
              <span class="nav-section__link">Campaigns</span>
            </a>
          </li>

          <li class="nav-link">
            <a href="adminReviews" class="${page == 'reviews' ? 'active' : ''}">
              <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.25" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-star-icon lucide-star">
                <path d="M11.525 2.295a.53.53 0 0 1 .95 0l2.31 4.679a2.123 2.123 0 0 0 1.595 1.16l5.166.756a.53.53 0 0 1 .294.904l-3.736 3.638a2.123 2.123 0 0 0-.611 1.878l.882 5.14a.53.53 0 0 1-.771.56l-4.618-2.428a2.122 2.122 0 0 0-1.973 0L6.396 21.01a.53.53 0 0 1-.77-.56l.881-5.139a2.122 2.122 0 0 0-.611-1.879L2.16 9.795a.53.53 0 0 1 .294-.906l5.165-.755a2.122 2.122 0 0 0 1.597-1.16z" />
              </svg>
              <span class="nav-section__link">Reviews</span>
            </a>
          </li>
        </ul>
      </div>

      <div class="nav-section">
        <h3 class="nav-section__heading">ACCOUNT</h3>
        <ul>
          <li class="nav-link">
            <a href="logout">
              <svg width="25px" height="25px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                <g id="SVGRepo_iconCarrier">
                  <path d="M21 12L13 12" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                  <path d="M18 15L20.913 12.087V12.087C20.961 12.039 20.961 11.961 20.913 11.913V11.913L18 9" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                  <path d="M16 5V4.5V4.5C16 3.67157 15.3284 3 14.5 3H5C3.89543 3 3 3.89543 3 5V19C3 20.1046 3.89543 21 5 21H14.5C15.3284 21 16 20.3284 16 19.5V19.5V19" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                </g>
              </svg>
              <span class="nav-section__link">Log out</span>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
