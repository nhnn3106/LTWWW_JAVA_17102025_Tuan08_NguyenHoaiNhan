<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            /*box-sizing: border-box;*/
        }

        body {
            margin: 0 auto;
            width: 1170px;
            height: 100vh;
        }

        select {
            padding: 5px;
            border: 2px solid black
        }

        table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 6px;
            border: 2px solid black;
        }

        th, td {
            padding: 10px;
            border: 2px solid black;
            text-align: center;
        }

    </style>
</head>
<body>
<h1 style="text-align: center; margin: 50px 0">Danh sách điện thoại</h1>
<div style="display: flex; justify-content: space-between">
    <div style="display: flex;  justify-content: center; gap: 20px; margin-bottom: 30px">
        <h2>Nhà cung cấp</h2>
        <form action="/phones" method="get">
            <select name="maNCC" onchange="this.form.submit()">
                <option value="-1" ${param.maNCC == "-1" ? "selected" : ""}>Tất
                    cả
                </option>
                <c:forEach var="nhaCungCap" items="${nhaCungCaps}">
                    <option value="${nhaCungCap.maNhaCungCap}" ${param.maNCC == nhaCungCap.maNhaCungCap ? "selected" : ""}>${nhaCungCap.tenNhaCungCap}</option>
                </c:forEach>
            </select>
        </form>
    </div>
    <div style="display: flex;  justify-content: center; gap: 20px;">
        <h2><a href="/suppliers">Danh sách nhà cung cấp</a></h2>
        <h2><a href="/">Trang chủ</a></h2>
    </div>
</div>
<table border="1">
    <c:if test="${empty dienThoais}">
        <h2 style="text-align: center">Nhà cung cấp này hiện chưa có sản phẩm
            nào</h2>
    </c:if>
    <c:if test="${not empty dienThoais}">
        <tr>
            <th>Mã điện thoại</th>
            <th>Hình ảnh</th>
            <th>Tên điện thoại</th>
            <th>Năm sản xuất</th>
            <th>Cấu hình</th>
            <th></th>
        </tr>
        <c:forEach var="dienThoai" items="${dienThoais}">
            <tr>
                <td>${dienThoai.maDienThoai}</td>
                <td>
                    <img src="${pageContext.request.contextPath}/images/${dienThoai.hinhAnh}"
                         alt="${dienThoai.tenDienThoai}"
                         width="50">
                </td>
                <td>${dienThoai.tenDienThoai}</td>
                <td>${dienThoai.namSanXuat}</td>
                <td>${dienThoai.cauHinh}</td>
                <td>
                    <form:form action="/phones/delete/${dienThoai.maDienThoai}" method="post">
                        <button type="submit" style="background-color: red; padding: 5px 20px; border: none; color: white; border-radius: 6px">Xóa</button>
                    </form:form>
                </td>
            </tr>
        </c:forEach>
    </c:if>
</table>
</body>
</html>
