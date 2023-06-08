<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <title>Vegetable</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Lora:wght@600;700&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="<c:url value="/assets/user/lib/animate/animate.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/assets/user/lib/owlcarousel/assets/owl.carousel.min.css"/>" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="<c:url value="/assets/user/css/bootstrap.min.css"/>" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="<c:url value="/assets/user/css/style.css"/>" rel="stylesheet"> 
    <style>
        .shopping-cart {
            text-align: center;
        }
  
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        
        table th, table td {
            border: 1px solid #ccc;
            padding: 10px;
        }
        
        table th {
            background-color: #f0f0f0;
        }
    
        button {
            display: block;
            margin: 0 auto;
        }
        .remove-btn {
            background-color: #ff0000;
            color: #fff;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            border-radius: 20px;
        }

        .remove-btn:hover {
            opacity: 0.7;
        }
		.purchase-info{
		    margin: 1.5rem 0;
		    text-align: center;
		}
		.purchase-info input,
		.purchase-info .btn{
		    border: 1.5px solid #ddd;
		    border-radius: 25px;
		    text-align: center;
		    outline: 0;
		}
		.purchase-info input{
		    width: 60px;
		}
		.purchase-info .btn{
		    width: 300px;
		    height: 50px;
		    text-align: center;
		    cursor: pointer;
		    color: #fff;
		}
		.purchase-info .btn:first-of-type{
		    background: #256eff;
		}
		.purchase-info .btn:last-of-type{
		    background: #3CB815;
		}
		.purchase-info .btn:hover{
		    opacity: 0.7;
		}
		a:hover {
			color:red;
		}	
		
		.sidebar {
            background-color: #f8f9fa;
            padding: 20px;
        }

        .menu-link {
            display: block;
            padding: 10px;
            color: #333;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        .menu-link:hover {
            background-color: #eee;
        }

		body {
		    margin: 0;
		    padding: 0;
		}
		
		.container-fluid {
		    width: 100%;
		    min-height: 100vh;
		}
		
		.row {
		    margin: 0;
		}
		
		.sidebar {
		    width: 20%;
		    min-height: 100vh;
		}
		
		.main-content {
		    width: 75%;
		    min-height: 100vh;
		    padding: 20px;
		}
		
		h4 {
		    margin-bottom: 20px;
		}
		
		.nav {
		    padding-left: 0;
		    list-style: none;
		}
		
		.menu-link {
		    display: block;
		    padding: 10px;
		    color: #333;
		    text-decoration: none;
		    transition: background-color 0.3s;
		}
		
		.menu-link:active,
		.menu-link:focus {
		    background-color: darkgray;
		}
		.icon-flex {
			display: flex;
			justify-content: space-around;
		}
		.form-select {
			margin-top: 10px !important;
		}

    </style>
</head>
<body>
	  <div class="container-fluid">
        <div class="row">
            <div class="col-md-3 sidebar">
                <h4>Admin Dashboard</h4>
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link menu-link active" href="Home">Log out</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link menu-link" href="AdminProduct">Products</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link menu-link" href="AdminUser">Users</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link menu-link" href="AdminOrder">Orders</a>
                    </li>
                  
                </ul>
            </div>
            <div class="col-md-9 main-content">
               <div class="shopping-cart mb-4">
	                <div class="text-center mx-auto mb-5"  >
	                    <h1 class="">Add New Product</h1>
	                </div>
            	</div>
            	<form:form action="AddProduct" modelAttribute="product">
            	<p>${messageAddP}</p>
                    <div class="row g-3">
                    	<div class="col-md-6">
                            <div class="form-floating">
                                <form:input type="text" class="form-control" id="name" placeholder="Product ID" path="ProductID" value="${productID}"/>
                                <label for="name">Product ID</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-floating">
                                <form:input type="text" class="form-control" id="name" placeholder="Product Name" path="ProductName"/>
                                <label for="name">Product Name</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-floating">
                                <form:input type="text" class="form-control" id="subject" placeholder="Price" path="Price"/>
                                <label for="email">Price</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                        	<div class="form-floating">
		                        <form:select  class="form-control"  path="Category">
								   <form:option class="form-select" value="">--Click choose--</form:option>
								   <c:forEach var="item" items="${categories}">
								      <form:option value="${item.getCategoryName()}">${item.getCategoryName()}
								      				<i class="fas fa-caret-down"></i>
								      </form:option>
								      
								   </c:forEach>
								</form:select>
								<label for="category">Category</label>
							</div>				
                        </div>
                        <div class="col-12">
                            <div class="form-floating">
                                <form:input type="text" class="form-control" id="subject" placeholder="Image Link" path="Img"/>
                                <label for="address">Image Link</label>
                            </div>
                        </div>
                        
                        
                        <div class="col-12">
                            <div class="form-floating">
                                 <div class="form-floating">
                                <form:textarea type="message" class="form-control" style="height:200px" placeholder="Leave a message here" id="message" path="Description"/>
                                <label for="message">Description</label>
                            </div>
                            </div>
                        </div>
                        
                    </div>
                    <div class = "purchase-info">
	                    <button type = "submit" class = "btn">Add New</button>
                	</div>
                </form:form>
            	
            	
            </div>
        </div>
    </div>
</body>
</html>