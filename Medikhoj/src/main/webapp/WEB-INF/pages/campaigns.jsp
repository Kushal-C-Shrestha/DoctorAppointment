<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/campaigns.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
</head>
<body>

		<%@ include file="header.jsp" %>
<main>
        <div class="container">
            <div class="campaign-header">
                <p>Campaigns</p>
            </div>
            <div class="campaign-list" >
            <c:forEach var="campaign" items="${campaigns}">
	            <div class="campaign">
	                    <div class="campaign-texts">
	                        <div class="campaign-title">
	                            <p>${campaign.campaign_name}</p>
	                        </div>
	                        <div class="campaign-info">
	                            <div class="campaign-date campaign-info__item" >
	                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-calendar-icon lucide-calendar"><path d="M8 2v4"/><path d="M16 2v4"/><rect width="18" height="18" x="3" y="4" rx="2"/><path d="M3 10h18"/></svg>
	                                <p>${campaign.formatted_date}</p>
	                            </div>
	                            <div class="campaign-time campaign-info__item">
	                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-clock-icon lucide-clock"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg>
	                                <p>${campaign.formatted_time}</p>
	                            </div>
	                        </div>
	                    </div>
	                    <c:set var="user" value="${sessionScope.loggedInUser}" />
	                    <form action="campaigns" method="post">
	                    	<input type="hidden" name="campaign_id" value="${campaign.campaign_id}">
	                    	<input type="hidden" name="user_id" value="${user.user_id}">
		                    <button class="campaign-enroll">
		                        Enroll
		                    </button>
	                    </form>
	                </div>
            </c:forEach>
                
            </div>
        </div>
    </main>
</body>
</html>