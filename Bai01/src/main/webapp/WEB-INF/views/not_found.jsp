<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Lỗi | Không tìm thấy</title>
    <style>
        /* Thiết lập chung */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f7f9fc;
            color: #333;
            margin: 0;
            padding: 50px;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }

        /* Khung thông báo lỗi */
        .error-container {
            background-color: #ffe0e0; /* Nền đỏ nhạt */
            border: 1px solid #e74c3c; /* Viền đỏ */
            border-radius: 8px;
            padding: 30px 40px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 450px;
            width: 90%;
            margin-bottom: 20px;
        }

        /* Thông báo chính */
        .error-message {
            color: #c0392b; /* Màu chữ đỏ đậm */
            font-size: 1.2em;
            font-weight: bold;
            margin: 0 0 20px 0;
            line-height: 1.5;
        }

        /* Hiển thị ID bị lỗi */
        .error-id {
            color: #34495e;
            background-color: #ecf0f1;
            padding: 2px 8px;
            border-radius: 4px;
            font-family: monospace;
            font-size: 1.1em;
        }

        /* Nút quay lại */
        .back-link {
            text-decoration: none;
            background-color: #3498db;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        .back-link:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
<div class="error-container">
    <p class="error-message">
        ❌ LỖI: Không tìm thấy employee có ID:
        <span class="error-id"><c:out value="${id}"/></span>
    </p>
    <p>
        Vui lòng kiểm tra lại ID hoặc quay lại trang danh sách.
    </p>
</div>

<a href="${pageContext.request.contextPath}/" class="back-link">
    🏠 Quay lại Trang Chủ
</a>
</body>
</html>