<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Đăng Nhập</title>
  	<base href="${pageContext.servletContext.contextPath }/">

	<style> 
		body {
	      font-family: Arial, sans-serif;
	      background-color: #f2f2f2;
	      margin: 0;
	      padding: 0;
	      background-image: url("https://tophinhanhdep.com/wp-content/uploads/2021/11/Vegetable-Wallpapers.jpg");
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
	</style>
</head>
<body>
	<div class="container">
    <h1>Đăng nhập</h1>
    <form:form action="DangNhap" modelAttribute="user">  
      <div class="form-group">
        <label for="username">Tên người dùng:</label>
       <form:input type="text" placeholder="User Name" path="UserName"/>  
   		<p style="color: red">${messageAccount}</p>
      
      </div>
      <div class="form-group">
        <label for="password">Mật khẩu:</label>
        <form:input type="password" placeholder="Password" path="password" />  
      </div>
      <p style="color: red">${messagePass}</p>
      <p style="color: red">${messageLogin}</p>
      <div class="form-group">
        <button type="submit">Đăng nhập</button>
      </div>
     <p style="text-align: center">Bạn chưa có tài khoản? <a href="DangKy">Đăng Ký</a></p>
    </form:form>
  </div>
</body>
</html>