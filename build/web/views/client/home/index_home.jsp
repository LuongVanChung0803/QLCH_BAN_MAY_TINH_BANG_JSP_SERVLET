<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- Add this at the beginning of your JSP page --%>


<%-- Display success message --%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Shop</title>
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="./assets/bootstrap-5.0.2-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="./assets/fontawesome-free-6.5.2-web/css/all.min.css">
        
        <link href="https://fonts.googleapis.com/css2?family=Merriweather&display=swap" rel="stylesheet">
         
         <link href="./assets/css/index_home.css" rel="stylesheet">
    
    </head>
    <body>
        <!-- top navbar -->
       <!-- top navbar -->
        <div class="top-navbar d-flex justify-content-between align-items-center">
            <p>WELCOME TO COMPUTER SHOP</p>
            <div class="icons d-flex align-items-center">
                <a href="CartServlet?sid=${sessionScope.user.id_nguoidung}" class="me-3"><img src="./assets/img/OIP.jpg" alt="User Avatar" width="30" height="30" style="border-radius: 50%;"> </i> Cart</a>
                <div class="dropdown">
                    <a class="dropdown-toggle" href="#" role="button" id="accountDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="./assets/img/th.jpg" alt="User Avatar" width="30" height="30" style="border-radius: 50%;">
                        <c:if test="${not empty sessionScope.user}">
                            ${sessionScope.user.ten_dangnhap}!
                            <p hidden>You are logged in as: ${sessionScope.user.email}</p>
                        </c:if>
                    </a>
                    <ul class="dropdown-menu ab" aria-labelledby="accountDropdown">
                        <li><a class="dropdown-item" href="loadlogin">Login</a></li>
                        <li><a class="dropdown-item" href="dangkyServlet">Register</a></li>
                        <li><a class="dropdown-item" href="customerInformationServlet?sid=${sessionScope.user.id_nguoidung}">Profile</a></li>
                        <li><a class="dropdown-item" href="OderServlet?sid=${sessionScope.user.id_nguoidung}">Orders</a></li>
                        <li><a class="dropdown-item" href="logout">Logout</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- top navbar -->

        <!-- navbar -->
        <nav class="navbar navbar-expand-lg" id="navbar">
            <div class="container-fluid">
             <a class="navbar-brand" href="loadhome" id="logo"><span id="span1">C</span>omputer <span>Shop</span></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span><img src="./assets/img/OIG2.jpg" alt="" width="30px"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="loadhome">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Product</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Category
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown" style="background-color: rgb(67 0 86);">
                                <li><a class="dropdown-item" href="#">LapTop Dell</a></li>
                                <li><a class="dropdown-item" href="#">Mac</a></li>
                                <li><a class="dropdown-item" href="#">HP </a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="about.html">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="contact.html">Contact</a>
                        </li>
                    </ul>
                    <form class="d-flex" id="search">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </nav>
        <!-- navbar -->








        <!-- home content -->
        <section class="home">
            <div class="content">
                <h1> <span>Computer Products</span>
                    <br>
                    Up To <span id="span2">50%</span> Off
                </h1>
                <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta, saepe.
                    <br>Lorem ipsum dolor sit amet consectetur.
                </p>
                <div class="btn"><button>Shop Now</button></div>

            </div>
            <div class="img">
                <img src="./images/intel-1200-300-1200x300.png" alt="">
            </div>
        </section>
        <!-- home content -->




        <div class="container" id="product-cards">
            <h1 class="text-center">PRODUCTS NEW</h1>
            <div class="row" style="margin-top: 30px;">
                <c:forEach items="${spss}" var="x">
                    <div class="col-md-3 py-3 py-md-0" style="padding-bottom: 10px;">
                        <div class="card" style="height: 450px; padding: 25px;">
                            <br>
                            <img class="card-img-top" src="./assets/img/${x.link_anh}" alt="${x.ten_sanpham}">
                            <div class="card-body">
                                <h3 class="text-center">${x.ten_sanpham}</h3>
                                <p class="text-center">${x.mo_ta}.</p>
                                <p hidden class="text-center">${x.id_sanpham}.</p>
                                <div class="star text-center">
                                    <i class="fa-solid fa-star checked"></i>
                                    <i class="fa-solid fa-star checked"></i>
                                    <i class="fa-solid fa-star checked"></i>
                                    <i class="fa-solid fa-star checked"></i>
                                    <i class="fa-solid fa-star checked"></i>
                                </div>
                                <h2>${x.gia} $ <a style="margin-left: 20px" href="productDetailServlet?id=${x.id_sanpham}">
                                        <button>Detail</button>
                                    </a></h2>
                                <div class="d-flex justify-content-between">
                                    <form action="AddToCartServlet" method="POST">
                                        <input type="hidden" name="id_sanpham" value="${x.id_sanpham}">
                                        <input type="hidden" name="gia" value="${x.gia}">
                                        <input type="hidden" name="soLuong" value="1">
                                        <input type="hidden" name="idNguoiDung" value="${sessionScope.user.id_nguoidung}">
                                        <input type="hidden" name="linkAnh" value="${x.link_anh}">

                                        <button type="submit" class="text-decoration-none add-to-cart-btn">
                                            <span>Add to Cart</span>
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>











        <!-- other cards -->
        <div class="container" id="other-cards">
            <div class="row">
                <div class="col-md-6 py-3 py-md-0">
                    <div class="card">
                        <img src="./images/c1.png" alt="">
                        <div class="card-img-overlay">
                            <h3>Best Laptop</h3>
                            <h5>Latest Collection</h5>
                            <p>Up To 50% Off</p>
                            <button id="shopnow">Shop Now</button>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 py-3 py-md-0">
                    <div class="card">
                        <img src="./images/c2.png" alt="">
                        <div class="card-img-overlay">
                            <h3>Best Headphone</h3>
                            <h5>Latest Collection</h5>
                            <p>Up To 50% Off</p>
                            <button id="shopnow">Shop Now</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- other cards -->







        <!-- banner -->
        <section class="banner">
            <div class="content">
                <h1> <span>Electronic Gadget</span>
                    <br>
                    Up To <span id="span2">50%</span> Off
                </h1>
                <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dicta, saepe.
                    <br>Lorem ipsum dolor sit amet consectetur.
                </p>
                <div class="btn"><button>Shop Now</button></div>

            </div>
            <div class="img">
                <img src="" alt=""  >
            </div>
        </section>
        <!-- banner -->








        <!-- product cards -->
        <div class="container" id="product-cards">
            <h1 class="text-center">EXPENSIVE PRODUCTS </h1>
            <div class="row" style="margin-top: 30px;">
                <c:forEach items="${spexpensive}" var="x">
                    <div class="col-md-3 py-3 py-md-0" style="padding-bottom: 10px;">
                        <div class="card" style="height: 450px; padding: 25px;">
                            <br>
                            <img class="card-img-top" src="./assets/img/${x.link_anh}" alt="${x.ten_sanpham}">
                            <div class="card-body">
                                <h3 class="text-center">${x.ten_sanpham}</h3>
                                <p class="text-center">${x.mo_ta}.</p>
                                <p hidden class="text-center">${x.id_sanpham}.</p>
                                <div class="star text-center">
                                    <i class="fa-solid fa-star checked"></i>
                                    <i class="fa-solid fa-star checked"></i>
                                    <i class="fa-solid fa-star checked"></i>
                                    <i class="fa-solid fa-star checked"></i>
                                    <i class="fa-solid fa-star checked"></i>
                                </div>
                                <h2>${x.gia} $ <a style="margin-left: 20px" href="productDetailServlet?id=${x.id_sanpham}">
                                        <button>Detail</button>
                                    </a></h2>
                                <div class="d-flex justify-content-between">
                                    <form action="AddToCartServlet" method="POST">
                                        <input type="hidden" name="id_sanpham" value="${x.id_sanpham}">
                                        <input type="hidden" name="gia" value="${x.gia}">
                                        <input type="hidden" name="soLuong" value="1">
                                        <input type="hidden" name="idNguoiDung" value="${sessionScope.user.id_nguoidung}">
                                        <input type="hidden" name="linkAnh" value="${x.link_anh}">

                                        <button type="submit" class="text-decoration-none add-to-cart-btn">
                                            <span>Add to Cart</span>
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>





        <!-- offer -->
        <div class="container" id="offer">
            <div class="row">
                <div class="col-md-3 py-3 py-md-0">
                    <i class="fa-solid fa-cart-shopping"></i>
                    <h3>Free Shipping</h3>
                    <p>On order over $1000</p>
                </div>
                <div class="col-md-3 py-3 py-md-0">
                    <i class="fa-solid fa-rotate-left"></i>
                    <h3>Free Returns</h3>
                    <p>Within 30 days</p>
                </div>
                <div class="col-md-3 py-3 py-md-0">
                    <i class="fa-solid fa-truck"></i>
                    <h3>Fast Delivery</h3>
                    <p>World Wide</p>
                </div>
                <div class="col-md-3 py-3 py-md-0">
                    <i class="fa-solid fa-thumbs-up"></i>
                    <h3>Big choice</h3>
                    <p>Of products</p>
                </div>
            </div>
        </div>
        <!-- offer -->






        <!-- newslater -->
        <div class="container" id="newslater">
            <h3 class="text-center">Subscribe To The  Shop For Latest upload.</h3>
            <div class="input text-center">
                <input type="text" placeholder="Enter Your Email..">
                <button id="subscribe">SUBSCRIBE</button>
            </div>
        </div>
        <!-- newslater -->






        <!-- footer -->
        <footer id="footer">
            <div class="footer-top">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-3 col-md-6 footer-contact">
                            <h3> Shop</h3>
                            <p>
                                Karachi <br>
                                Sindh <br>
                                Pakistan <br>
                            </p>
                            <strong>Phone:</strong> +000000000000000 <br>
                            <strong>Email:</strong> shop@.com <br>
                        </div>

                        <div class="col-lg-3 col-md-6 footer-links">
                            <h4>Usefull Links</h4>
                            <ul>
                                <li><a href="#">Home</a></li>
                                <li><a href="#">About Us</a></li>
                                <li><a href="#">Services</a></li>
                                <li><a href="#">Terms of service</a></li>
                                <li><a href="#">Privacy policey</a></li>
                            </ul>
                        </div>





                        <div class="col-lg-3 col-md-6 footer-links">
                            <h4>Our Services</h4>

                            <ul>
                                <li><a href="#">PS 5</a></li>
                                <li><a href="#">Computer</a></li>
                                <li><a href="#">Gaming Laptop</a></li>
                                <li><a href="#">Mobile Phone</a></li>
                                <li><a href="#">Gaming Gadget</a></li>
                            </ul>
                        </div>

                        <div class="col-lg-3 col-md-6 footer-links">
                            <h4>Our Social Networks</h4>
                            <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Quia, quibusdam.</p>

                            <div class="socail-links mt-3">
                                <a href="#"><i class="fa-brands fa-twitter"></i></a>
                                <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                                <a href="#"><i class="fa-brands fa-instagram"></i></a>
                                <a href="#"><i class="fa-brands fa-skype"></i></a>
                                <a href="#"><i class="fa-brands fa-linkedin"></i></a>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
            <hr>
            <div class="container py-4">
                <div class="copyright">
                    &copy; Copyright <strong><span>Electronic Shop</span></strong>. All Rights Reserved
                </div>
                <div class="credits">
                    Designed by <a href="#">SA coding</a>
                </div>
            </div>
        </footer>
        <!-- footer -->


        <a href="#" class="arrow"><i><img src="./images/arrow.png" alt=""></i></a>
          <script src="./assets/bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>
       <script>
            // JavaScript to display alerts based on message attributes
            window.onload = function () {
                var successMessage = '<%= request.getAttribute("successMessage") %>';
                var errorMessage = '<%= request.getAttribute("errorMessage") %>';
                if (successMessage !== "null") {
                    alert(successMessage);
                } else if (errorMessage !== "null") {
                    alert(errorMessage);
                }
            }
        </script>

    </body>
</html>