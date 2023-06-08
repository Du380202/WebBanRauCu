<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

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
		
		button:hover {
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
			justify-content:center;
		}
		
		.add-product {
			display: flex;
			justify-content: flex-end;
			margin-bottom: 10px;
			margin-right: 0 !important; 
		}
		
		.btn-color {
			background-color: red;
			color: white;
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
                    <h1 class="">Product Manager</h1>
                    
                    
                </div>
                <div class="add-product">
               		<a class="btn btn-primary py-2 mt-2" href="AddProduct">Add Product</a>	
                </div>
                    <table>
                        <thead>
                                <tr>
                                <th class="bg-primary text-white">ID</th>
                                <th class="bg-primary text-white">Image</th>
                                <th class="bg-primary text-white">Product Name</th>
                                <th class="bg-primary text-white">Category</th>
                                <th class="bg-primary text-white">Price</th>
                                <th class="bg-primary text-white">Edit</th>
                                <th class="bg-primary text-white">Status</th>
                                </tr>
                       </thead>
                      
                    <tbody>
                	 	<c:forEach var="p" items="${products}">
	                    	 
	                    	 <tr>
		                        <td>${p.getProductID()}</td>
		                        <td><img
		                            src="<c:url value="${p.getImg()}"/>"
		                            class="img-fluid rounded-3" alt="Shopping item" style="width: 65px;"></td>
		                        <td>${p.getProductName()}</td>
		                        <td>${p.getCategory()}</td>
		                        <c:set var="intValueTotal" value="${p.getPrice().intValue()}"/>
		                        <td>${intValueTotal}</td>
		                        <td>
			                          <a href="EditProduct/${p.getProductID()}" ><i class="fas fa-pen-square" aria-hidden="true" style="font-size:20px"></i></a>                                           
		                        </td>
		                        
		                        <td>
			                        <div class="icon-flex">
			                        	 <c:if test="${p.getStatus() == 0}">
								            <form action="EnableProduct" method="post">
								                <input type="hidden" name="productID" value="${p.getProductID()}" /> 
								                <button type="submit" class="btn btn-primary">
								                    Bật
								                </button>
								          </form>
						           		 </c:if>
						           		 <c:if test="${p.getStatus() == 1}">
								            <form action="DisableProduct" method="post">
								                <input type="hidden" name="productID" value="${p.getProductID()}" /> 
								                <button type="submit" class="btn btn-color">
								                    Tắt
								                </button>
								          </form>
						           		 </c:if>
			                        </div>
	
		                        </td>
		                        
		                	</tr>
	                    	
		                </c:forEach>
                    </tbody>
                    </table>
                   
            </div>
            </div>
        </div>
    </div>
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>
</body>
</html>