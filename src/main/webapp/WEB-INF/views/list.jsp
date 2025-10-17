<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách nhân viên</title>
    <style>
        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<h1>Danh sách nhân viên (Employees)</h1>

<%-- Kiểm tra nếu danh sách employees không rỗng --%>
<c:choose>
    <c:when test="${employees != null || employees.size() > 0}">
        <table>
            <thead>
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Gender</th>
                <th>Date of birth</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
                <%-- Lặp qua danh sách employees được truyền từ Controller --%>
            <c:forEach items="${employees}" var="emp">
                <tr>
                    <td>${emp.getFirstName()}</td>
                    <td>${emp.getLastName()}</td>
                    <td>${emp.getGender()}</td>
                    <td>${emp.getDateOfBirth()}</td>
                    <td>${emp.getEmail()}</td>
                    <td>${emp.getPhone()}</td>
                    <td><a>Update</a><a>Delete</a></td>


                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:when>
    <c:otherwise>
        <p style="color: red;">Không tìm thấy nhân viên nào trong cơ sở dữ liệu.</p>
    </c:otherwise>
</c:choose>
</body>
</html>