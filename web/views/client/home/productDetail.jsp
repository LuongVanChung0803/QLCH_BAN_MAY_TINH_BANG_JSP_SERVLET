<%-- 
    Document   : productDetail
    Created on : Jun 13, 2024, 10:46:49 PM
    Author     : hc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${product.ten_sanpham} - Product Details</title>
        <link rel="stylesheet" href="./assets/css/style.css">
       
        <link rel="stylesheet" href="./assets/bootstrap-5.0.2-dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="./assets/fontawesome-free-6.5.2-web/css/all.min.css">
        
        <link href="https://fonts.googleapis.com/css2?family=Merriweather&display=swap" rel="stylesheet">
        <link href="./assets/css/index_product.css" rel="stylesheet">
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

        <div class="container product-details">
            <div class="row">
                <div class="col-md-6">
                    <img src="./assets/img/${product.link_anh}" alt="${product.ten_sanpham}" class="product-image">
                </div>
                <div class="col-md-6">
                    <h1>${product.ten_sanpham}</h1>
                    <p>${product.mo_ta}</p>
                    <h2 class="product-price">${product.gia} $</h2>


                    <form action="DetaiToAddToCartServlet" method="post">
                        <input type="hidden" name="id_sanpham" value="${product.id_sanpham}">

                        <input type="hidden" name="gia" value="${product.gia}">
                        <input type="hidden" name="soLuong" value="1">
                        <input type="hidden" name="idNguoiDung" value="${sessionScope.user.id_nguoidung}">
                        <input type="hidden" name="linkAnh" value="${product.link_anh}">

                        <button type="submit" class="btn btn-primary">Add to Cart</button>
                    </form>
                    <!-- Custom Alert -->
                   
                    
                    <div class="product-guarantee">
                        <div class="guarantee-item">
                            <div class="guarantee-icon">&#128736;</div>
                            <div class="guarantee-text">
                                Hư gì đổi nấy <strong>12 tháng</strong> tại Store toàn quốc (miễn phí tháng đầu)
                            </div>
                        </div>
                        <div class="guarantee-item">
                            <div class="guarantee-icon">&#128737;</div>
                            <div class="guarantee-text">
                                Bảo hành <strong>chính hãng máy tính 1 năm</strong> tại các trung tâm bảo hành hãng
                            </div>
                        </div>
                                        <div class="guarantee-item">
                                            <div class="guarantee-icon">&#128736;</div>
                                            <div class="guarantee-text">
                                                <ul>Phụ Kiện Đi Kèm
                                                    <li>first: Túi chống sốc laptop</li>
                                                    <li>second: Bàn phím máy tính</li>
                                                    <li>third:Bộ vệ sinh laptop</li>
                                                </ul>

                                            </div>
                                        </div>
                    </div>
                </div>
                      
            </div>

            <div class="row mt-5">
                <div class="col-md-12">

                    <ul>

                        <div class="container" id="product-cards">
                            <h2 class="text-center">Sản Phẩm Mới</h2>
                            <div class="row" >
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
                                                <div  class="d-flex justify-content-between">
                                                    <form action="DetaiToAddToCartServlet" method="POST">
                                                        <input type="hidden"  id = "id_sanpham" name="id_sanpham" value="${x.id_sanpham}">
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



                    </ul>
                </div>
            </div>
        </div>

        <!-- footer -->
        <footer id="footer">
            <div class="footer-top">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3 col-md-6 footer-contact">
                            <h3>Computer Shop</h3>
                            <p>
                                Karachi <br>
                                Sindh <br>
                                Pakistan <br>
                            </p>
                            <strong>Phone:</strong> +84867127278 <br>
                            <strong>Email:</strong> computershop@.com <br>
                        </div>
                        <div class="col-lg-3 col-md-6 footer-links">
                            <h4>Useful Links</h4>
                            <ul>
                                <li><a href="#">Home</a></li>
                                <li><a href="#">About Us</a></li>
                                <li><a href="#">Services</a></li>
                                <li><a href="#">Terms of service</a></li>
                                <li><a href="#">Privacy policy</a></li>
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
                            <div class="social-links mt-3">
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
                    &copy; Copyright <strong><span>Computer Shop</span></strong>. All Rights Reserved
                </div>
                <div class="credits">
                    Designed by <a href="#">SA coding</a>
                </div>
            </div>
        </footer>
        <!-- footer -->

        <a href="#" class="arrow"><i><img src="./images/arrow.png" alt=""></i></a>

        <script src="./assets/bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

            </body>
    </html>
