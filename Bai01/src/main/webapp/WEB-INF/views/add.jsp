<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Employee Form</title>
    <style>
        /* Thiết lập chung */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7f6;
            color: #333;
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        /* Tiêu đề */
        h1 {
            color: #2c3e50;
            margin-bottom: 30px;
            font-size: 2em;
        }

        /* Form Container */
        .form-container {
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px; /* Giới hạn chiều rộng form */
        }

        /* Các nhóm Input */
        .form-container > div {
            margin-bottom: 20px;
        }

        /* Label */
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #555;
        }

        /* Input Fields */
        .form-container input[type="text"],
        .form-container input[type="email"],
        .form-container input[type="date"],
        .form-container input[type="tel"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box; /* Quan trọng: đảm bảo padding không làm tăng chiều rộng */
            transition: border-color 0.3s;
        }

        .form-container input:focus {
            border-color: #3498db;
            outline: none;
        }

        /* Hiển thị lỗi */
        .error-message {
            display: block;
            font-size: 0.9em;
            margin-top: 5px;
            color: #e74c3c; /* Đảm bảo màu đỏ nổi bật */
            font-weight: 500;
        }

        /* Radio Buttons (Gender) */
        .radio-group {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-top: 5px;
        }

        .radio-group label {
            display: inline;
            font-weight: normal;
        }

        /* Submit Button */
        .form-container button[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #2ecc71;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1.1em;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: 10px;
        }

        .form-container button[type="submit"]:hover {
            background-color: #27ae60;
        }
    </style>
</head>
<body>
<div class="form-container">
    <c:choose>
        <c:when test="${employee.id == 0}">
            <h1>Thêm Nhân Viên Mới ➕</h1>
        </c:when>
        <c:otherwise>
            <h1>Cập Nhật Nhân Viên 📝</h1>
        </c:otherwise>
    </c:choose>

    <%--@elvariable id="employee" type="fit.iuh.se.entities.Employee"--%>
    <form:form action="${pageContext.request.contextPath}/save" method="post" modelAttribute="employee">
        <form:input path="id" type="hidden"/>

        <div>
            <label for="firstName">First name: </label>
            <form:input id="firstName" path="firstName" placeholder="Nhập First Name"/>
                <%-- Sửa: Dùng cssClass thay vì cssStyle inline để đồng nhất với CSS trên Head --%>
            <form:errors path="firstName" cssClass="error-message"/>
        </div>

        <div>
            <label for="lastName">Last name: </label>
            <form:input id="lastName" path="lastName" placeholder="Nhập Last Name"/>
            <form:errors path="lastName" cssClass="error-message"/>
        </div>

        <div>
            <label for="email">Email: </label>
            <form:input id="email" path="email" placeholder="Nhập Email"/>
            <form:errors path="email" cssClass="error-message"/>
        </div>

        <div>
            <label for="dateOfBirth">Date of Birth: </label>
            <form:input type="date" id="dateOfBirth" path="dateOfBirth" value="2004-08-21"/>
            <form:errors path="dateOfBirth" cssClass="error-message"/>
        </div>

        <div>
            <label>Gender: </label>
            <div class="radio-group">
                <form:radiobutton path="gender" value="Male" id="genderMale"/>
                <label for="genderMale">Male</label>

                <form:radiobutton path="gender" value="Female" id="genderFemale"/>
                <label for="genderFemale">Female</label>
            </div>
            <form:errors path="gender" cssClass="error-message"/>
        </div>


        <div>
            <label for="phone">Phone number: </label>
            <form:input type="tel" id="phone" path="phone" placeholder="Nhập Phone number"/>
            <form:errors path="phone" cssClass="error-message"/>
        </div>

        <div>
            <form:button type="submit">
                <c:choose>
                    <c:when test="${employee.id == 0}">
                        Thêm dữ liệu
                    </c:when>
                    <c:otherwise>
                        Sửa dữ liệu
                    </c:otherwise>
                </c:choose>
            </form:button>
        </div>
    </form:form>
</div>
</body>
</html>