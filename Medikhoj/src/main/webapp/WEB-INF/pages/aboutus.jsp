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
	<h1 class="aboutus_title">About Us</h1>
    <div class="welcome_cont">
        <div class="welcome_message">
            <h2>Welcome to MediKhoj</h2>
            <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Vero magnam totam soluta tempora ab pariatur illo atque placeat fuga tenetur. Provident veniam porro perferendis? Ipsa enim odit neque eum ipsam?  </p><br>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repellendus incidunt minus nulla neque non, aperiam beatae ratione aliquam deserunt perspiciatis quibusdam rerum exercitationem eum vitae illum architecto. Quaerat, similique voluptatum?</p>
        </div>
        <div class="welcome_photo">
            <img src="" alt="photo">
        </div>
    </div>
    <div class="meet_team">
        <h1>Meet our Members</h1>
        <div class="team_members">
            <div class="team_cont">
                <div class="team_subcont">
                    <img src="" alt="photo" height="20px" width="20px">
                    <div class="team_details">
                        <h2>Name</h2>
                        <p>College</p>
                    </div>
                </div>
                <div class="team_subcont">
                    <img src="" alt="photo" height="20px" width="20px">
                    <div class="team_details">
                        <h2>Name</h2>
                        <p>College</p>
                    </div>
                </div>
            </div>
            <div class="team_cont">
                <div class="team_subcont">
                    <img src="" alt="photo" height="20px" width="20px">
                    <div class="team_details">
                        <h2>Name</h2>
                        <p>College</p>
                    </div>
                </div>
                <div class="team_subcont">
                    <img src="" alt="photo" height="20px" width="20px">
                    <div class="team_details">
                        <h2>Name</h2>
                        <p>College</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<%@ include file="footer.jsp" %>
</body>
</html>