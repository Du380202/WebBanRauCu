<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
  <title>Đăng ký</title>
  <base href="${pageContext.servletContext.contextPath }/">
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
      margin: 0;
      padding: 0;
      background-image: url("https://wallpaperaccess.com/full/1306573.jpg");
    }

    .container {
      max-width: 400px;
      margin: 100px auto;
      background-color: #fff;
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    h1 {
      text-align: center;
    }

    .form-group {
      margin-bottom: 20px;
    }

    .form-group label {
      display: block;
      font-weight: bold;
    }

    .form-group input {
      width: 100%;
      padding: 10px;
      font-size: 16px;
      border-radius: 3px;
      border: 1px solid #ccc;
      box-sizing: border-box;
      
    }

    .form-group button {
      width: 100%;
      padding: 10px;
      font-size: 16px;
      background-color: #4caf50;
      color: #fff;
      border: none;
      border-radius: 3px;
      cursor: pointer;
    }
    
    p {
    	color: red;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>Đăng ký</h1>
    <form:form action="DangKy" modelAttribute="user">  
    	<p>${message}</p>
    	<p style="color: green">${messageT}</p>
      <div class="form-group">
        <label for="username">Tên người dùng:</label>
        <form:input type="text" placeholder="User Name" path="UserName" />  
        <p><form:errors path="UserName"/></p>
      </div>
      <div class="form-group">
        <label for="password">Mật khẩu:</label>
        <form:input type="password" placeholder="Password" path="password" />  
        <p><form:errors path="password"/></p>
      </div>
      <div class="form-group">
        <label for="address">Địa chỉ:</label>
     	<form:input type="text" placeholder="Address" path="address" />  
      </div>	
      <div class="form-group">
        <label for="email">Email:</label>
        <form:input type="email" placeholder="Email" path="email" />  
         <p><form:errors path="email"/></p>
      </div>

      <div class="form-group">
        <button type="submit">Đăng ký</button>
      </div>
      <p style="text-align: center; color: black">Bạn đã có tài khoản? <a href="DangNhap">Đăng Nhập</a></p>
    </form:form>
  </div>
</body>
</html>