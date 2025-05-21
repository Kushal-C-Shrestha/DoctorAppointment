<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/doctorOwnProfile.css"/></head>

</head>
<body>
<main>
	<%@ include file="doctorNav.jsp" %>
	
	<div class="container">
	 <div class="main-content">
       <c:choose>
        	<c:when test="${section=='details'}">
				        <div class="page-header">
				            <h1 class="page-title">My Details</h1>
				            <div class="details-action_buttons">
					            <button id="viewProfileBtn" class="view-button">
								    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
								        <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
								        <circle cx="12" cy="12" r="3"></circle>
								    </svg>
								    View Profile
								</button>
					            
					            
					            <button id="changePasswordBtn" class="password-button">
								    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
								        <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
								        <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
								    </svg>
							    	Change Password
								</button>
					            
					            <button id="editProfileBtn" class="edit-button">
					                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
					                    <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
					                    <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
					                </svg>
					                Edit Profile
					            </button>
				            </div>
				            
				        </div>
				        
				        <div class="profile-container">
				            <div class="profile-header">
				                <div class="profile-avatar">
				                    <div class="avatar-circle">RP</div>
				                </div>
				                <div class="profile-info">
				                    <h2>Aseem Rai</h2>
				                    <p>Doctor</p>
				                </div>
				            </div>
				            
				            <div class="profile-details" id="viewProfileSection" style="display: ${subSection=='viewDetailsSection' ? 'block' : 'none'}">
				                <div class="detail-row">
				                    <div class="detail-group">
				                        <label>Full Name</label>
				                        <p>${user.user_name}</p>
				                    </div>
				                    <div class="detail-group">
				                        <label>Blood Group</label>
				                        <p>${user.user_bloodgroup}</p>
				                    </div>
				                </div>
				                
				                <div class="detail-row">
				                    <div class="detail-group">
				                        <label>Gender</label>
				                        <p>${user.user_gender}</p>
				                    </div>
				                    <div class="detail-group">
				                        <label>Email</label>
				                        <p>${user.user_email}</p>
				                    </div>
				                </div>
				                
				                <div class="detail-row">
				                    <div class="detail-group">
				                        <label>Date of Birth</label>
				                        <p>${user.user_dob}</p>
				                    </div>
				                </div>
				                
				                <div class="detail-row">
				                    <div class="detail-group">
				                        <label>Phone</label>
				                        <p>${user.user_phone}</p>
				                    </div>
				                    <div class="detail-group">
				                        <label>Password</label>
				                        <p>••••••••</p>
				                    </div>
				                </div>
				            </div>
				            
				            <div class="profile-form" id="editProfileSection" style="display: ${subSection=='editProfileSection' ? 'block' : 'none'}">
				                <form action="updateProfile" method="post" enctype="multipart/form-data">
				                    <div class="form-row">
				                        <div class="form-group">
				                            <label for="userName">Full Name</label>
				                            <input type="text" id="userName" name="fullName" value="${user.user_name}" >
											<c:if test="${not empty errorMap['fullname']}">
				                            	<p class="error-message">${errorMap['fullname']}</p>
				                            </c:if>					                        
				                        </div>
				                        <div class="form-group">
				                            <label for="bloodGroup">Blood Group</label>
				                            <select id="bloodGroup" name="bloodGroup">
				                                <option value="A+" ${user.user_bloodgroup == 'A+' ? 'selected' : ''}>A+</option>
				                                <option value="A-" ${user.user_bloodgroup == 'A-' ? 'selected' : ''}>A-</option>
				                                <option value="B+" ${user.user_bloodgroup == 'B+' ? 'selected' : ''}>B+</option>
				                                <option value="B-" ${user.user_bloodgroup == 'B-' ? 'selected' : ''}>B-</option>
				                                <option value="AB+" ${user.user_bloodgroup == 'AB+' ? 'selected' : ''}>AB+</option>
				                                <option value="AB-" ${user.user_bloodgroup == 'AB-' ? 'selected' : ''}>AB-</option>
				                                <option value="O+" ${user.user_bloodgroup == 'O+' ? 'selected' : ''}>O+</option>
				                                <option value="O-" ${user.user_bloodgroup == 'O-' ? 'selected' : ''}>O-</option>
				                            </select>
				                            <c:if test="${not empty errorMap['bloodgroup']}">
				                            	<p class="error-message">${errorMap['bloodgroup']}</p>
				                            </c:if>	
				                        </div>
				                    </div>
				                    
				                    <div class="form-row">
				                        <div class="form-group">
				                            <label for="gender">Gender</label>
				                            <select id="gender" name="gender">
				                                <option value="Male" ${user.user_gender == 'Male' ? 'selected' : ''}>Male</option>
				                                <option value="Female" ${user.user_gender == 'Female' ? 'selected' : ''}>Female</option>
				                                <option value="Other" ${user.user_gender == 'Other' ? 'selected' : ''}>Other</option>
				                            </select>
				                            <c:if test="${not empty errorMap['gender']}">
				                            	<p class="error-message">${errorMap['gender']}</p>
				                            </c:if>	
				                        </div>
				                        <div class="form-group">
				                            <label for="email">Email</label>
				                            <input type="email" id="email" name="email" value="${user.user_email}" >
				                            <c:if test="${not empty errorMap['email']}">
				                            	<p class="error-message">${errorMap['email']}</p>
				                            </c:if>
				                        </div>
				                    </div>
				                    
				                    <div class="form-row">
				                        <div class="form-group">
				                            <label for="dob">Date of Birth</label>
				                            <input type="date" id="dob" name="dob" value="${user.user_dob}" >
				                            <c:if test="${not empty errorMap['dob']}">
				                            	<p class="error-message">${errorMap['dob']}</p>
				                            </c:if>	
				                        </div>
				                        <div class="form-group">
				                            <label for="phone">Phone</label>
				                            <input type="tel" id="phone" name="phone" value="${user.user_phone}" >
											<c:if test="${not empty errorMap['phone']}">
				                            	<p class="error-message">${errorMap['phone']}</p>
				                            </c:if>				                            
				                        </div>
				                    </div>
				                    
				                     <div class="form-row">
				                        <div class="form-group">
				                            <label for="avatar">Profile picture</label>
				                            <input type="file" id="profile-pic" name="profile-pic">
				                            <c:if test="${not empty errorMap['image']}">
				                            	<p class="error-message">${errorMap['image']}</p>
				                            </c:if>	
				                            
				                        </div>
				                    </div>
				                    
				                    
				                    <div class="form-actions">
				                        <button type="button" class="cancel-button">Cancel</button>
				                        <button type="submit" class="save-button">Save Changes</button>
				                    </div>
				                </form>
				            </div>
				            
				           <div class="profile-form" id="changePasswordSection" style="display: ${subSection=='changePasswordSection' ? 'block' : 'none'}">

				            	<c:if test="${not empty error}">
				            		<p>${error}</p>
				            	</c:if>
				            	
				            	<c:if test="${not empty success}">
				            		<p>${success}</p>
				            	</c:if>
				                <form action="updateProfile" method="post">
				                    <div class="form-row">
				                        <div class="form-group">
				                            <label for="currentPassword">Current Password</label>
				                            <input type="password" id="currentPassword" name="currentPassword" value="${current_password}" class="${not empty errorMap['currentPassword'] ? 'error' : ''}">
				                            <c:if test="${not empty errorMap['currentPassword']}">
				                            	<p class="error-message">${errorMap['currentPassword']}</p>
				                            </c:if>	
				                            
				                        </div>
				                        <div class="form-group">
				                            <label for="newPassword">New Password</label>
				                            <input type="password" id="newPassword" name="newPassword" value="${new_password}" class="${not empty errorMap['newPassword'] ? 'error' : ''}">
				                            <c:if test="${not empty errorMap['newPassword']}">
				                            	<p class="error-message">${errorMap['newPassword']}</p>
				                            </c:if>	
				                            
				                        </div>
				                    </div>
				                    
				                    <div class="form-actions">
				                        <button type="button" class="cancel-button">Cancel</button>
				                        <button type="submit" class="save-button">Save Changes</button>
				                    </div>
				                </form>
				        </div>
				   </div>
				</c:when>
       </c:choose>
     </div>
	</div>
    
    <script>
      const navLinks = document.querySelectorAll(".nav-link a");
      navLinks.forEach((link) => {
        link.addEventListener("click", () => {
          navLinks.forEach((link) => {
            link.classList.remove("active");
          });
          link.classList.add("active");
        });
      });

      let admindoc_menu_icon = document.querySelector(".nav .navbar-top svg");
      let admindoc_menu = document.querySelector(".nav");
      let admindoc_cont = document.querySelector(".nav-links__container");

      admindoc_menu_icon.onclick = () => {
        admindoc_menu.classList.toggle('close');
        admindoc_cont.classList.toggle('close');
      }
      
      
      document.addEventListener('DOMContentLoaded', function() {
          const editProfileBtn = document.getElementById('editProfileBtn');
          const changePwBtn=document.getElementById('changePasswordBtn');
          const cancelEditBtn = document.querySelectorAll('.cancel-button');
          const viewProfileSection = document.getElementById('viewProfileSection');
          const editProfileSection = document.getElementById('editProfileSection');
          const changePasswordSection=document.getElementById('changePasswordSection');
          const viewProfileBtn = document.getElementById('viewProfileBtn');
          
          viewProfileBtn.addEventListener('click', function() {
              viewProfileSection.style.display = 'block';
              changePasswordSection.style.display='none';
              editProfileSection.style.display = 'none';
          });
          
          
          // Toggle to edit mode
          editProfileBtn.addEventListener('click', function() {
              viewProfileSection.style.display = 'none';
              changePasswordSection.style.display='none';
              editProfileSection.style.display = 'block';
          });
          
          // Toggle back to view mode
          cancelEditBtn.forEach(btn=>{
          	btn.addEventListener('click', function() {
                  viewProfileSection.style.display = 'block';
                  editProfileSection.style.display = 'none';
                  changePasswordSection.style.display='none';
          	})
          });
          
          changePwBtn.addEventListener('click', function() {
          	console.log("clicked");
              viewProfileSection.style.display = 'none';
              editProfileSection.style.display = 'none';
              changePasswordSection.style.display='block';
          });
      });
    </script>
  </body>
</body>
</html>