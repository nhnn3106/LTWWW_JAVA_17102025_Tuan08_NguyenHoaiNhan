<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách nhân viên | Quản lý</title>
    <style>
        /* CSS CƠ BẢN VÀ THIẾT LẬP LẠI */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f7f9fc;
            color: #333;
            margin: 0;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }
        hr {
            border: 0;
            height: 1px;
            background-color: #ddd;
            margin-bottom: 30px;
        }

        /* KHU VỰC ĐIỀU KHIỂN (SEARCH VÀ ADD) */
        .control-panel {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 80%;
            margin: 0px auto 20px auto;
        }
        .control-panel form {
            display: flex;
            gap: 10px;
        }
        .control-panel input[type="text"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 300px;
        }

        /* NÚT (BUTTONS VÀ LINKS) */
        .control-panel button, .control-panel a.add-link, table a {
            padding: 8px 15px;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            transition: background-color 0.3s, color 0.3s;
        }

        /* Nút Search */
        .control-panel button {
            background-color: #3498db;
            color: white;
            border: none;
            cursor: pointer;
        }
        .control-panel button:hover {
            background-color: #2980b9;
        }

        /* Nút Add Employee */
        .control-panel a.add-link {
            background-color: #2ecc71;
            color: white;
        }
        .control-panel a.add-link:hover {
            background-color: #27ae60;
        }

        /* BẢNG */
        table {
            border-collapse: separate; /* Thay đổi thành separate để dùng border-radius */
            border-spacing: 0;
            width: 80%;
            margin: 20px auto;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: white;
            border-radius: 8px; /* Bo góc bảng */
            overflow: hidden; /* Cần thiết để bo góc hoạt động */
        }
        th, td {
            border: none;
            padding: 12px 15px;
            text-align: left;
        }
        thead th {
            background-color: #34495e;
            color: white;
            text-transform: uppercase;
            font-size: 0.9em;
        }
        tbody tr:nth-child(even) {
            background-color: #ecf0f1; /* Xen kẽ màu dòng */
        }
        tbody tr:hover {
            background-color: #e0e6e9; /* Hiệu ứng hover */
        }

        /* CỘT ACTION */
        td:last-child {
            white-space: nowrap; /* Giữ Update và Delete trên cùng một dòng */
        }
        td a {
            padding: 5px 10px;
            margin-right: 5px;
        }
        td a:first-child { /* Update link */
            background-color: #f39c12;
            color: white;
        }
        td a:last-child { /* Delete link */
            background-color: #e74c3c;
            color: white;
        }
        td a:first-child:hover {
            background-color: #d35400;
        }
        td a:last-child:hover {
            background-color: #c0392b;
        }

        /* THÔNG BÁO KHÔNG CÓ DỮ LIỆU */
        .no-data-message {
            text-align: center;
            font-size: 1.1em;
            padding: 20px;
            background-color: #fcecec;
            border: 1px solid #e74c3c;
            width: 80%;
            margin: 20px auto;
            border-radius: 5px;
            color: #e74c3c;
        }
    </style>
</head>
<body>
<h1>Employee List 📋</h1>
<hr>

<div class="control-panel">
    <form action="${pageContext.request.contextPath}/search" method="get">
        <input type="text" name="firstName" placeholder="Tìm kiếm theo Tên..." required/>
        <button type="submit">Search 🔍</button>
    </form>
    <a href="${pageContext.request.contextPath}/add" class="add-link">➕ Add New Employee</a>
</div>

<%-- Kiểm tra nếu danh sách employees không rỗng --%>
<c:choose>
    <c:when test="${employees != null && employees.size() > 0}">
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
                    <td>${emp.firstName}</td> <%-- Sử dụng cú pháp EL đơn giản hơn --%>
                    <td>${emp.lastName}</td>
                    <td>${emp.gender}</td>
                    <td>${emp.dateOfBirth}</td>
                    <td>${emp.email}</td>
                    <td>${emp.phone}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/update?id=${emp.id}">Update</a>
                        <a href="${pageContext.request.contextPath}/delete?id=${emp.id}" onclick="return confirm('Bạn có chắc chắn muốn xóa nhân viên ${emp.firstName} ${emp.lastName} không?');">Delete</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:when>
    <c:otherwise>
        <p class="no-data-message">Không tìm thấy nhân viên nào trong cơ sở dữ liệu. Vui lòng thêm nhân viên mới.</p>
    </c:otherwise>
</c:choose>
</body>
</html>