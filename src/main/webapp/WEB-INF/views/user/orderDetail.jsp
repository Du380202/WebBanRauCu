<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>VegFoods - User</title>
    <base href="${pageContext.servletContext.contextPath }/">
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
		td, th {
			text-align: center;
		}
    </style>

</head>

<body>
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->


    <!-- Navbar Start -->
    <div class="container-fluid fixed-top px-0 wow fadeIn" data-wow-delay="0.1s">
         <div class="top-bar row gx-0 align-items-center d-none d-lg-flex">
            <div class="col-lg-6 px-5 text-start">
            	<small><i class="fa fa-map-marker-alt me-2"></i>97 Man Thiện, Quận 9, Việt Nam</small>
                <small class="ms-4"><i class="fa fa-envelope me-2"></i>ptithcm@gmail.com</small>
            </div>
            <div class="col-lg-6 px-5 text-end">
                <small>Follow us:</small>
                <a class="text-body ms-3" href=""><i class="fab fa-facebook-f"></i></a>
                <a class="text-body ms-3" href=""><i class="fab fa-twitter"></i></a>
                <a class="text-body ms-3" href=""><i class="fab fa-linkedin-in"></i></a>
                <a class="text-body ms-3" href=""><i class="fab fa-instagram"></i></a>
                
            </div>
        </div>

        <nav class="navbar navbar-expand-lg navbar-light py-lg-0 px-lg-5 wow fadeIn" data-wow-delay="0.1s">
            <a href="Home" class="navbar-brand ms-4 ms-lg-0">
                <h1 class="fw-bold text-primary m-0">VegF<span class="text-secondary">oo</span>ds</h1>
            </a>
            <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto p-4 p-lg-0">
                    <a href="Home" class="nav-item nav-link">Home</a>
                    <a href="Product" class="nav-item nav-link">Products</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown">Pages</a>
                        <div class="dropdown-menu m-0">
                            <a href="Home" class="dropdown-item">Our Features</a>
                            <a href="Cart" class="dropdown-item">Shopping Cart</a>
                        </div>
                    </div>
                    <a href="Contact" class="nav-item nav-link">Contact Us</a>
                </div>
                <div class="d-none d-lg-flex ms-2">
                	<form action="search" method="POST">
	                	<div class="input-group">
	                		<div class="form-outline">
						    	<input name="keyword" class="form-control"  placeholder="Search"/>
							  </div>
							  <div>
								  <button  id="search-button" type="submit" class="btn btn-primary">
								    <i class="fas fa-search"></i>
								  </button>
							  </div>
						</div>
                	</form>
                   
                    <a class="btn-sm-square bg-white rounded-circle ms-3" href="Cart">
                        <small class="fa fa-shopping-bag text-body"></small>
                    </a>
                    
                    <c:if test="${empty loggedInUser}">
            			<a href="DangNhap" class="nav-link">Log in</a> 
            		</c:if>
            	
            		<c:if test="${not empty loggedInUser}">
                       <div class="nav-item dropdown">
	                        <a href="" class="btn-sm-square bg-white rounded-circle ms-3" data-bs-toggle="dropdown"><small class="fa fa-user text-body"></small></a>
	                        <div class="dropdown-menu m-0">
	                            <a href="EditUser/${loggedInUser.getUserName()}" class="dropdown-item">Edit</a>
	                            <a href="ViewOrder/${loggedInUser.getUserName()}" class="dropdown-item">Orders</a>
	                            <a href="<c:url value="/logout"/>"><button class="	dropdown-item ">Log out</button></a>
	                              
	                        </div>
                    	</div>
    				
            		</c:if>
                </div>
            </div>
        </nav>
    </div>
    <!-- Navbar End -->


    <!-- Page Header Start -->
    <div class="container-fluid page-header mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container">
            <h1 class="display-3 mb-3 animated slideInDown">User</h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a class="text-body" href="#">Your Orders</a></li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->

    <div class="container-fluid bg-light bg-icon py-6">
        <div class="container">
            <div class="section-header text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                <h1 class="display-5 mb-3">Your Orders</h1>
                
            </div>
            <table>
                <thead>
                  <tr>
                  
                      <th class="bg-primary text-white">User Name</th>
                      <th class="bg-primary text-white">Order Date</th>
                      <th class="bg-primary text-white">Address</th>
                      <th class="bg-primary text-white">Total Price</th>
                      <th class="bg-primary text-white">Phone Number</th>
                      <th class="bg-primary text-white">Delivered</th>
                 </tr>
               </thead>
                      
                    <tbody>
                    	 <c:forEach var="item" items="${order}">
						    <tr>
						         
		                        <td>${item.getUserName()}</td>
		                        <td>${item.getOrderDate()}</td>
		                        <td>${item.getAddress()}</td>
		                        <c:set var="intValueTotal" value="${item.getTotalMoney().intValue()}"/>
		                        <td>${intValueTotal}</td>
		                        <td>${item.getPhoneNumber()}</td>
						        <td>
						           	<c:if test="${item.getDelivered() == 0}">
						            
						                <button type="" class="btn btn-link">
						                    <i class="fas fa-shipping-fast" style="font-size:20px"></i>
						                </button>
						           
						            </c:if>
						            <c:if test="${item.getDelivered() == 1}">
						            	<i class="fas fa-check-circle btn btn-link" style="font-size:20px"></i>
						            </c:if>
						        </td>
						    </tr>
						</c:forEach>
                    </tbody>
                    </table>
        </div>
    </div>


    <!-- Footer Start -->
    <div class="container-fluid bg-dark footer pt-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container py-5">
            <div class="row g-5">
                <div class="col-lg-3 col-md-6">
                   <h1 class="fw-bold text-primary m-0">VegF<span class="text-secondary">oo</span>ds</h1>
                    <p></p>
                    <div class="d-flex pt-2">
                        <a class="btn btn-square btn-outline-light rounded-circle me-1" href=""><i class="fab fa-twitter"></i></a>
                        <a class="btn btn-square btn-outline-light rounded-circle me-1" href=""><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-square btn-outline-light rounded-circle me-1" href=""><i class="fab fa-youtube"></i></a>
                        <a class="btn btn-square btn-outline-light rounded-circle me-0" href=""><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-light mb-4">Address</h4>
                    <p><i class="fa fa-map-marker-alt me-3"></i>97 Man Thiện, Quận 9, Việt Nam</p>
                    <p><i class="fa fa-phone-alt me-3"></i>+84 337 873 884</p>
                    <p><i class="fa fa-envelope me-3"></i>ptithcm@gmail.com</p>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-light mb-4">Quick Links</h4>
                    <a class="btn btn-link" href="">Home</a>
                    <a class="btn btn-link" href="">Contact Us</a>
                    <a class="btn btn-link" href="">Products</a>
                    <a class="btn btn-link" href="">Terms & Condition</a>
                    <a class="btn btn-link" href="">Support</a>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-light mb-4">Newsletter</h4>
                    <div class="position-relative mx-auto" style="max-width: 400px;">
                        <input class="form-control bg-transparent w-100 py-3 ps-4 pe-5" type="text" placeholder="Your email">
                        <button type="button" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="<c:url value="/assets/user/lib/wow/wow.min.js"/>"></script>

    <!-- Template Javascript -->
    <script src="<c:url value="/assets/user/js/main.js"/>"></script>
</body>
</html>