<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>VegFoods - Product Detail</title>
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

	<style type="">
		
		.card-wrapper{
		    max-width: 1100px;
		    margin: 0 auto;
		}
		img{
		    width: 100%;
		    display: block;
		}
		.img-display{
		    overflow: hidden;
		}
		.img-showcase{
		    display: flex;
		    width: 100%;
		    transition: all 0.5s ease;
		}
		.img-showcase img{
		    min-width: 100%;
		}
		.img-select{
		    display: flex;
		}
		.img-item{
		    margin: 0.3rem;
		}
		.img-item:nth-child(1),
		.img-item:nth-child(2),
		.img-item:nth-child(3){
		    margin-right: 0;
		}
		.img-item:hover{
		    opacity: 0.8;
		}
		.product-content{
		    padding: 2rem 1rem;
		}
		.product-title{
		    font-size: 3rem;
		    text-transform: capitalize;
		    font-weight: 700;
		    position: relative;
		    color: #12263a;
		    margin: 1rem 0;
		}
		.product-title::after{
		    content: "";
		    position: absolute;
		    left: 0;
		    bottom: 0;
		    height: 4px;
		    width: 80px;
		    background: #12263a;
		}
		.product-link{
		    text-decoration: none;
		    text-transform: uppercase;
		    font-weight: 400;
		    font-size: 0.9rem;
		    display: inline-block;
		    margin-bottom: 0.5rem;
		    background: #3CB815;
		    color: #fff;
		    padding: 0 0.3rem;
		    transition: all 0.5s ease;
		}
		.product-link:hover{
		    opacity: 0.9;
		}
		.product-rating{
		    color: #ffc107;
		}
		.product-rating span{
		    font-weight: 600;
		    color: #252525;
		}
		.product-price{
		    margin: 1rem 0;
		    font-size: 1rem;
		    font-weight: 700;
		}
		.product-price span{
		    font-weight: 400;
		}
		.last-price span{
		    color: #f64749;
		    text-decoration: line-through;
		}
		.new-price span{
		    color: #256eff;
		}
		.product-detail h2{
		    text-transform: capitalize;
		    color: #12263a;
		    padding-bottom: 0.6rem;
		}
		.product-detail p{
		    font-size: 0.9rem;
		    padding: 0.3rem;
		    opacity: 0.8;
		}
		.product-detail ul{
		    margin: 1rem 0;
		    font-size: 0.9rem;
		}
		.product-detail ul li{
		    margin: 0;
		    list-style: none;
		    background: url("<c:url value="/assets/user/img/checked.jpg"/>") left center no-repeat;
		    background-size: 18px;
		    padding-left: 1.7rem;
		    margin: 0.4rem 0;
		    font-weight: 600;
		    opacity: 0.9;
		}
		.product-detail ul li span{
		    font-weight: 400;
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
		    opacity: 0.9;
		}
		.social-links{
		    display: flex;
			justify-content: center;
		}
		.social-links a{
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    width: 32px;
		    height: 32px;
		    color: #000;
		    border: 1px solid #000;
		    margin: 0 0.2rem;
		    border-radius: 50%;
		    text-decoration: none;
		    font-size: 0.8rem;
		    transition: all 0.5s ease;
		}
		.social-links a:hover{
		    background: #000;
		    border-color: transparent;
		    color: #fff;
		}
		
		@media screen and (min-width: 992px){
		    .card{
		        display: grid;
		        grid-template-columns: repeat(2, 1fr);
		        grid-gap: 1.5rem;
		    }
		    .card-wrapper{
		        height: 100vh;
		        display: flex;
		        justify-content: center;
		        align-items: center;
		    }
		    .product-imgs{
		        display: flex;
		        flex-direction: column;
		        justify-content: center;
		    }
		    .product-content{
		        padding-top: 0;
		    }
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
                    <a href="Product" class="nav-item nav-link active">Products</a>
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


    <!-- Page Header Start -->
    <div class="container-fluid page-header mb-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container">
            <h1 class="display-3 mb-3 animated slideInDown">Products</h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a class="text-body" href="#">Home</a></li>
                    <li class="breadcrumb-item"><a class="text-body" href="#">Products</a></li>
                    <li class="breadcrumb-item text-dark active" aria-current="page">Product Detail</li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- Product Start -->
    <div class="container-fluid bg-light bg-icon my-5 py-6">
        <div class="container">
        
        	<form action="<c:url value="/AddCart/${productDetail.getProductID()}"/>" method="get">
            <div class = "card-wrapper">
                <div class = "card">
                  <!-- card left -->
                  <div class = "product-imgs">
                    <div class = "img-display">
                      <div class = "img-showcase">
                        <img src = "<c:url value="${productDetail.getImg()}"/>">
                      </div>
                    </div>
                  </div>
                  <!-- card right -->
                  <div class = "product-content">
                    <h2 class = "product-title">${productDetail.getProductName()}</h2>
                    <a href = "#" class = "product-link">visit our store</a>
                    <div class = "product-rating">
                      <i class = "fas fa-star"></i>
                      <i class = "fas fa-star"></i>
                      <i class = "fas fa-star"></i>
                      <i class = "fas fa-star"></i>
                      <i class = "fas fa-star-half-alt"></i>
                      <span>4.7(21)</span>
                    </div>
          
                    <div class = "product-price">
                    	<c:set var="intValue" value="${productDetail.getPrice().intValue()}"/>
                      <p class = "new-price">Price: <span>${intValue}</span></p>
                    </div>
          
                    <div class = "product-detail">
                      <h2>Về sản phẩm này: </h2>
                      <p>${productDetail.getDescription()}</p>
                      <p></p>
                      <ul>
                        <li>Available: <span>in stock</span></li>
                        <li>Category: <span>${productDetail.getCategory()}</span></li>
                        <li>Shipping Area: <span>All over the world</span></li>
                        <li>Shipping Fee: <span>Free</span></li>
                      </ul>
                    </div>
          
                    <div class = "purchase-info">

                      <button type = "submit" class = "btn">
                        Add to Cart <i class = "fas fa-shopping-cart"></i>
                      </button>

                    </div>
          
                    <div class = "social-links">
                
                      <a href = "#">
                        <i class = "fab fa-facebook-f"></i>
                      </a>
                      <a href = "#">
                        <i class = "fab fa-twitter"></i>
                      </a>
                      <a href = "#">
                        <i class = "fab fa-instagram"></i>
                      </a>
                      <a href = "#">
                        <i class = "fab fa-whatsapp"></i>
                      </a>
                      <a href = "#">
                        <i class = "fab fa-pinterest"></i>
                      </a>
                    </div>
                  </div>
                </div>
              </div>
        	</form>
        </div>
        </div>
        
    </div>
    
    <!-- Product Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="row g-0 gx-5 align-items-end">
                <div class="section-header text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                     <h1 class="display-5 mb-3">Sản Phẩm Tương Tự</h1>
                     <p></p>
                </div>
            </div>
            <div class="tab-content">
                <div id="tab-1" class="tab-pane fade show p-0 active">
                    <div class="row g-4">
                    <c:forEach var = "item" items = "${fourProduct}">
                        <div class="col-xl-3 col-lg-4 col-md-6 wow fadeInUp">
                            <div class="product-item">
                                <div class="position-relative bg-light overflow-hidden">
                                    <img class="img-fluid w-100" src="<c:url value="${item.getImg()}"/>" alt="">
                                    
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
                    </div>
                </div>
            </div>
        </div>
    </div>
   
    <!-- Product End -->


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