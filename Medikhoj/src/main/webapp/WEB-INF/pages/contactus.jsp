<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/contactus.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
</head>
<body>
<%@ include file="header.jsp" %>
	<div class="contact_heading">
        <h1 class="contact_title">Contact our team</h1>
        <p class="contact_msg">Have questions about your treatment or medical reports? We are here to help.<br>
            Chat with our friendly team 24/7 and get onboard in less than 5 minutes.</p>
    </div>
    <div class="main_contact">
        <form>
            <div class="cust_names">
                <div class="cust_names_sub"><label>First Name:</label><input type="text"></div>
                <div class="cust_names_sub"><label>Last Name:</label><input type="text"></div>
            </div>
            <div class="cust_details"><label>Email:</label><input type="text"></div>
            <div class="cust_details"><label>Phone number:</label><input type="text"></div>
            <div class="cust_details"><label>Message:</label><textarea rows="5" cols="30" style="resize: none;"></textarea></div>
            <div class="cust_details" style="padding-top:2em;"><button type="submit">Send message</button></div>
        </form>
        <div class="contact_details">
            <div class="contact_details_cont">
                <h2>Chat with us</h2>
                <p>Speak with our friendly team via</p>
                <a href="#"><img src="">Shoot us an email</a> 
                <a href="#"><img src="">Message us on Instagram</a>
            </div>
            <div class="contact_details_cont">
                <h2>Call Us</h2>
                <p>Call our team from Sun-Fri from 7am to 7pm</p>
                <p><img src="">+01 4557789</p> 
            </div>
            <div class="contact_details_cont">
                <h2>Visit Us</h2>
                <a href="#"><img src="">Chat with us in person at Kalanki, Kathmandu</a>
            </div>
        </div>
    </div>
	<%@ include file="footer.jsp" %>
</body>
</html>