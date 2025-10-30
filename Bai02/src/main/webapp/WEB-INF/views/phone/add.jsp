<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        * {
            margin: 0;
            box-sizing: border-box;
        }

        body {
            width: 1140px;
            margin: 0 auto;
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            padding-top: 50px;
        }

        .container {
            background-color: white;
            padding: 25px 30px;
            margin: 0 auto;
            width: 50%;
        }

        form {
            margin-top: 20px;
        }

        form div {
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin-bottom: 10px;
        }

        label {
            font-weight: bold;
            font-size: 15px;
        }

        input, select {
            padding: 10px;
            border: 1px solid black;
            border-radius: 6px;
            outline: none;
        }

        input[type="file"] {
            border: none;
        }

        button {
            margin-top: 10px;
            width: 100%;
            padding: 12px;
            border: none;
            background: #007bff;
            color: white;
            border-radius: 6px;
            font-size: 15px;
            cursor: pointer;
        }

    </style>
</head>
<body>
<div class="container">
    <h1 style="text-align: center; font-size: 30px">Thêm điện thoại</h1>

    <form:form action="/phones/add" method="post" enctype="multipart/form-data" modelAttribute="newDienThoai">

        <div>
            <label>Tên điện thoại</label>
            <form:input path="tenDienThoai" placeholder="Nhập tên điện thoại"/>
            <form:errors path="tenDienThoai" cssStyle="color:red"/>
        </div>

        <div>
            <label>Năm sản xuất</label>
            <form:input path="namSanXuat" placeholder="Nhập năm sản xuất" value="${newDienThoai.namSanXuat == 0 ? '' : newDienThoai.namSanXuat}" />
            <form:errors path="namSanXuat" cssStyle="color:red"/>
        </div>

        <div>
            <label>Cấu hình</label>
            <form:input path="cauHinh" placeholder="Nhập cấu hình"/>
            <form:errors path="cauHinh" cssStyle="color:red"/>
        </div>

        <div>
            <label>Hình ảnh</label>
            <input type="file" name="file"/>
            <form:errors path="hinhAnh" cssStyle="color:red"/>
        </div>

        <div>
            <label>Nhà cung cấp</label>
            <form:select path="nhaCungCap.maNhaCungCap">
                <form:options items="${nhaCungCaps}" itemValue="maNhaCungCap" itemLabel="tenNhaCungCap"/>
            </form:select>
        </div>

        <button type="submit">Thêm</button>

    </form:form>
</div>

</body>
</html>
