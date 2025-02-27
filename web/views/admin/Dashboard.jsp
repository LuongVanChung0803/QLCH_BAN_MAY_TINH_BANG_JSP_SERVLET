<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <!-- Chart.js CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.css" rel="stylesheet">
    <link href="./assets/css/admin.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto align-items-center">
                <li class="nav-item">
                    <a class="nav-link" href="#">
                        <i class="fas fa-bell"></i>
                        <span class="badge badge-danger">3</span>
                        Notifications
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">
                        <i class="fas fa-envelope"></i>
                        <span class="badge badge-primary">5</span>
                        Messages
                    </a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <img src="./assets/img/imageadmin.jpg" alt="" class="rounded-circle" width="30" height="30">
                        <c:if test="${not empty sessionScope.user}">
                            Hello, ${sessionScope.user.ten_dangnhap}!
                            <p hidden>You are logged in as: ${sessionScope.user.email}</p>
                        </c:if>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">Profile</a>
                        <a class="dropdown-item" href="#">Settings</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="logout">Logout</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>

    <div class="d-flex">
        <div class="sidebar bg-light p-3">
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link" href="loaddashboard"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="loaduser"><i class="fas fa-users"></i>Quản Lý Tài Khoản</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="loadproduct"><i class="fas fa-boxes"></i> Quản Lý Sản Phẩm</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="loadoder"><i class="fas fa-shopping-cart"></i> Quản Lý Đơn Hàng</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="loadcustommer"><i class="fas fa-user"></i> Quản Lý Khách Hàng</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="loadstatistics"><i class="fas fa-chart-bar"></i>Thống Kê</a>
                </li>
<!--                <li class="nav-item">
                    <a class="nav-link" href="loadsetting"><i class="fas fa-cogs"></i> Cài đặt</a>
                </li>-->
            </ul>
        </div>

        <div class="content p-4" >
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h1>Dashboard</h1>
            </div>
            <div class="row mb-4">
                <div class="col-md-6">
                    <div class="card text-white bg-primary mb-3">
                        <div class="card-body">
                            <h5 class="card-title">Khách Hàng Tiềm Năng</h5>
                            <p class="card-text">Customer ID: ${customerWithMostOrders.id_khachhang}</p>
                            <p class="card-text">Number of Orders: ${customerWithMostOrders.so_don_hang}</p>
                            <p class="card-text">Total Amount: ${customerWithMostOrders.tong_tien}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card text-white bg-success mb-3">
                        <div class="card-body">
                            <h5 class="card-title">Sản Phẩm Bán Chạy Nhất</h5>
                            <p class="card-text">Product ID: ${bestSellingProduct.id_sanpham}</p>
                            <p class="card-text">Total Quantity Sold: ${bestSellingProduct.total_quantity}</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card mb-4">
                <div class="card-header">
                    Recent Orders
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>User</th>
                                    <th>Date</th>
                                    <th>Status</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="order" items="${recentOrders}">
                                    <tr>
                                        <td>${order.id_donhang}</td>
                                        <td>${order.id_khachhang}</td>
                                        <td>${order.ngay_dat}</td>
                                        <td>${order.trang_thai}</td>
                                        <td>${order.tong_tien}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <script>
        // JavaScript to get the message from the URL and display it (if any)
        window.onload = function() {
            var urlParams = new URLSearchParams(window.location.search);
            var message = urlParams.get('message');

            if (message) {
                alert(decodeURIComponent(message));
            }
        };
    </script>
</body>
</html>
