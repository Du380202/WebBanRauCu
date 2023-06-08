<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>VegFoods - Home</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
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
                    <a href="Home" class="nav-item nav-link active">Home</a>
                    <a href="Product" class="nav-item nav-link">Products</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
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

    <!-- Carousel Start -->
    <div class="container-fluid p-0 mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div id="header-carousel" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="w-100" src="<c:url value="/assets/user/img/carousel-1.jpg"/>" alt="Image">
                    <div class="carousel-caption">
                        <div class="container">
                            <div class="row justify-content-start">
                                <div class="col-lg-7">
                                    <h1 class="display-2 mb-5 animated slideInDown">Thực Phẩm Hữu Cơ Tốt Cho Sức Khỏe</h1>
                                    <!-- <a href="" class="btn btn-primary rounded-pill py-sm-3 px-sm-5">Products</a>
                                    <a href="" class="btn btn-secondary rounded-pill py-sm-3 px-sm-5 ms-3">Services</a> -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="w-100" src="<c:url value="/assets/user/img/carousel-2.jpg"/>" alt="Image">
                    <div class="carousel-caption">
                        <div class="container">
                            <div class="row justify-content-start">
                                <div class="col-lg-7">
                                    <h1 class="display-2 mb-5 animated slideInDown">Thực phẩm tự nhiên luôn tốt cho sức khỏe</h1>
                                   <!--  <a href="" class="btn btn-primary rounded-pill py-sm-3 px-sm-5">Products</a>
                                    <a href="" class="btn btn-secondary rounded-pill py-sm-3 px-sm-5 ms-3">Services</a> -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#header-carousel"
                data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#header-carousel"
                data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
    <!-- Carousel End -->


    <!-- Feature Start -->
    <div class="container-fluid bg-light bg-icon my-5 py-6">
        <div class="container">
            <div class="section-header text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                <h1 class="display-5 mb-3">Our Features</h1>
                <p></p>
            </div>
            <div class="row g-4">
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="bg-white text-center h-100 p-4 p-xl-5">
                        <img class="img-fluid mb-4" src="<c:url value="/assets/user/img/icon-1.png"/>" alt="">
                        <h4 class="mb-3">Quy Trình Tự Nhiên</h4>
                        <p class="mb-4">Từ việc gieo hạt cho đến việc chăm sóc và thu hoạch, quá trình trồng rau củ là sự kết hợp giữa sức lao động con người và quy luật của tự nhiên</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="bg-white text-center h-100 p-4 p-xl-5">
                        <img class="img-fluid mb-4" src="<c:url value="/assets/user/img/icon-2.png"/>" alt="">
                        <h4 class="mb-3">Sản Phẩm Hữu Cơ</h4>
                        <p class="mb-4">Hãy chọn sản phẩm hữu cơ để bạn và gia đình được thưởng thức những thực phẩm tươi ngon, tự nhiên và không chứa hóa chất độc hại</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="bg-white text-center h-100 p-4 p-xl-5">
                        <img class="img-fluid mb-4" src="<c:url value="/assets/user/img/icon-3.png"/>" alt="">
                        <h4 class="mb-3">An Toàn Sinh Học</h4>
                        <p class="mb-4">Rau củ an toàn sinh học không chỉ là thực phẩm, mà còn là một thông điệp về sự chăm sóc và sự tôn trọng đối với sức khỏe và môi trường</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Feature End -->


    <!-- Product Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="row g-0 gx-5 align-items-end">
                <div class="section-header text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                     <h1 class="display-5 mb-3">New Produscts</h1>
                     <p>Hãy lựa chọn rau củ tươi ngon và tự nhiên để nuôi dưỡng cơ thể và tạo nên một cuộc sống lành mạnh.</p>
                </div>
            </div>
            <div class="tab-content">
                <div id="tab-1" class="tab-pane fade show p-0 active">
                    <div class="row g-4">
                    <c:forEach var = "item" items = "${productNew}">
                        <div class="col-xl-3 col-lg-4 col-md-6 wow fadeInUp">
                            <div class="product-item">
                                <div class="position-relative bg-light overflow-hidden">
                                    <img class="img-fluid w-100" src="<c:url value="${item.getImg()}"/>" alt="">
                                    <div class="bg-secondary rounded text-white position-absolute start-0 top-0 m-4 py-1 px-3">New</div>
                                </div>
                                <div class="text-center p-4">
                                    <a class="d-block h5 mb-2" href="">${item.getProductName()}</a>
                                     <c:set var="intValue" value="${item.price.intValue()}"/>
                                    <span class="text-primary me-1">${ intValue}</span>
                                </div>
                                <div class="d-flex border-top">
                                    <small class="w-50 text-center border-end py-2">
                                        <a class="text-body" href="ProductDetail?id=${item.getProductID()}"><i class="fa fa-eye text-primary me-2"></i>View detail</a>
                                    </small>
                                    <small class="w-50 text-center py-2">
                                        <a class="text-body" href="<c:url value="/AddCart/${item.getProductID()}"/>"><i class="fa fa-shopping-bag text-primary me-2"></i>Add to cart</a>
                                    </small>
                                </div>
                            </div>
                        </div>
         				</c:forEach>
                        
                        <div class="col-12 text-center wow fadeInUp" data-wow-delay="0.1s">
                            <a class="btn btn-primary rounded-pill py-3 px-5" href="Product">Browse More Products</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Product End -->


    <!-- Firm Visit Start -->
    <div class="container-fluid bg-primary bg-icon mt-5 py-6">
        <div class="container">
            <div class="row g-5 align-items-center">
                <div class="col-md-7 wow fadeIn" data-wow-delay="0.1s">
                    <h1 class="display-5 text-white mb-3">Visit Our Firm</h1>
                    <p class="text-white mb-0">Hãy ghé thăm cửa hàng của chúng tôi để khám phá sự khác biệt của rau củ tự nhiên.
                     Chúng tôi cam kết mang đến cho bạn sự lựa chọn tốt nhất để tạo nên những món ăn ngon miệng và bữa ăn lành mạnh.</p>
                </div>
                <div class="col-md-5 text-md-end wow fadeIn" data-wow-delay="0.5s">
                    <a class="btn btn-lg btn-secondary rounded-pill py-3 px-5" href="">Visit Now</a>
                </div>
            </div>
        </div>
    </div>
    <!-- Firm Visit End -->


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
