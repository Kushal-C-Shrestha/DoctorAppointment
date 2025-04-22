<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dashboard.css"/></head>
<body>
	 <div class="container">
        <h1>Admin Dashboard</h1>
        <h2>List of Doctors</h2>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>DOB</th>
                    <th>Gender</th>
                    <th>Blood Group</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>101</td>
                    <td>Dr. Anil Sharma</td>
                    <td>anil.sharma@example.com</td>
                    <td>9800000001</td>
                    <td>1980-05-12</td>
                    <td>Male</td>
                    <td>O+</td>
                </tr>
                <tr>
                    <td>102</td>
                    <td>Dr. Maya Singh</td>
                    <td>maya.singh@example.com</td>
                    <td>9800000002</td>
                    <td>1985-07-20</td>
                    <td>Female</td>
                    <td>A+</td>
                </tr>
                <tr>
                    <td>103</td>
                    <td>Dr. Ramesh Adhikari</td>
                    <td>ramesh.adhikari@example.com</td>
                    <td>9800000003</td>
                    <td>1978-03-08</td>
                    <td>Male</td>
                    <td>B-</td>
                </tr>
                <tr>
                    <td>104</td>
                    <td>Dr. Sita Koirala</td>
                    <td>sita.koirala@example.com</td>
                    <td>9800000004</td>
                    <td>1990-11-25</td>
                    <td>Female</td>
                    <td>AB+</td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>