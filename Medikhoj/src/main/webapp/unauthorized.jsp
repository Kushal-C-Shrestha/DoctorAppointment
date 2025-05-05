<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Access Denied</title>
</head>
<body>
    <h2>Unauthorized Access</h2>
    <p>You do not have permission to view this page.</p>
    <%-- Check if logged in --%>
    <%
        // Retrieve logged-in user from session and role from cookie
        com.medikhoj.model.UserModel loggedInUser = (com.medikhoj.model.UserModel) session.getAttribute("loggedInUser");
        String userRole = null;

        // Check if a role cookie is present 
        if (request.getCookies() != null) {
            for (Cookie cookie : request.getCookies()) {
                if ("user_role".equals(cookie.getName())) {
                    userRole = cookie.getValue();
                }
            }
        }

        // Redirect based on role or login status
        if (loggedInUser != null) {
            if ("admin".equals(userRole)) {
                out.println("<a href='" + request.getContextPath() + "/dashboard'>Click here to go to the Admin Dashboard</a>");
            } else if ("user".equals(userRole)) {
                out.println("<a href='" + request.getContextPath() + "/home'>Click here to go to Home</a>");
            }
        } else {
            out.println("<a href='" + request.getContextPath() + "/login'>Click here to log in</a>");
        }
    %>
</body>
</html>