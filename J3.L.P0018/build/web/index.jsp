<%-- 
    Document   : index
    Created on : May 12, 2021, 11:24:03 AM
    Author     : phamv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Shop Page- Ustora Demo</title>

        <!-- Google Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,300,700,600' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700,300' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Raleway:400,100' rel='stylesheet' type='text/css'>

        <!-- Bootstrap -->
        <link rel="stylesheet" href="css/bootstrap.min.css">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="css/responsive.css">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <style>
            .are{
                margin-left: 180px;
                width:180px;
            }
        </style>
    </head>
    <body>

 <!-- End header area -->

        <div class="site-branding-area">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="logo">
                            <h1><img src="img/sach.png" width="150" height="150"></a></h1>
                        </div>
                    </div>



                </div>
            </div>
        </div> <!-- End site branding area -->

        <div class="mainmenu-area">
            <div class="container">
                <div class="row">
                    
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">

                            <li class="active"><a href="ProductServlet">Home</a></li>
                                <c:choose>
                                    <c:when test="${ sessionScope.user.roleID eq 1}">
                                    <li>
                                        <a href="ProductServlet?action=view">View Order</a>
                                    </li>
                                    <li>
                                        <a href="CreateDiscount.jsp">Create Discount</a>
                                    </li>
                                </c:when>                            
                                <c:otherwise>
                                    <li>
                                        <a  href="showcart.jsp">Cart</a>
                                    </li>
                                   
                                </c:otherwise>
                            </c:choose>
                            
                                <c:if test="${sessionScope.user==null }">
                                <li><a href="ProductServlet?action=Login"><i class="fa fa-user"></i> Login</a></li>
                                </c:if>
                                <c:if test="${sessionScope.user!=null }">
                                <li><a href="ProductServlet?action=logout"><i class="fa fa-user"></i> Logout</a></li>
                                </c:if>
                        </ul>
                    </div>  
                </div>
            </div>
        </div> <!-- End mainmenu area -->

        <div class="product-big-title-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="product-bit-title text-center">
                            <c:if test="${sessionScope.user!=null}">
                                <h2>Welcome ${sessionScope.user.username} </h2>
                            </c:if>
                            <c:if test="${sessionScope.user==null}">
                                <h2>TaiPham BookStore</h2>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="single-product-area">
            <div class="zigzag-bottom"></div>
            <div class="are">
            <c:if test="${sessionScope.user.roleID eq 1}">
                <div class="product-option-shop">
                    <a class="add_to_cart_button" href="ProductServlet?action=addproduct">Add new Book</a>
                </div>
            </c:if>
                </div>
            <div class="container">

                <div class="row">
                    <div class="single-sidebar">
                        <h2 class="sidebar-title">Search Products</h2>
                        <form action="ProductServlet" method="post">
                            <input type="text" name="search" placeholder="Search products...">
                            <input type="submit" name="action" value="search">
                        </form>
                        

                    </div>
                    <h2 class="sidebar-title">Search By Price</h2>
                        <form action="SearchByPriceServlet" method="post">
                            <input type="text" name="price1" placeholder="price1">
                            <input type="text" name="price2" placeholder="price2">
                            <input type="submit" name="action" value="find">
                        </form></br></br>
                    <c:forEach items="${requestScope.listBook}" var="book">
                        <div class="col-md-3 col-sm-6">

                            <div class="col-md-12">
                                <div class="single-shop-product">

                                    <div class="product-upper">
                                        <img src="img/${book.imageUrl}" >

                                    </div>
                                    <h2><a href=""><td>${book.productName}</td></a></h2>
                                    <small>${book.shortDescription}</small>
                                    <div class="product-carousel-price">
                                        <ins>${book.price} VND</ins>
                                    </div>  
                                    <c:choose>
                                        <c:when test="${sessionScope.user.roleID eq 1}">
                                            <div class="product-option-shop">
                                                <a class="add_to_cart_button" data-quantity="1" data-product_sku=""  href="ProductServlet?action=update&productID=${book.productID}">Update</a>
                                            </div> 
                                            <div class="product-option-shop">
                                                <a class="add_to_cart_button" data-quantity="1" data-product_sku=""  href="ProductServlet?action=delete&productID=${book.productID}"  onclick="return confirm('Are you sure delete:${book.productName}?')">Delete</a>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="product-option-shop">
                                                <a class="add_to_cart_button" href="CartServlet?action=buy&productID=${book.productID}">Add to cart</a>
                                            </div> 
                                        </c:otherwise>
                                    </c:choose>
                                </div>

                            </div>
                        </div>
                    </c:forEach>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="product-pagination text-center">
                            <nav>
                                <ul class="pagination">
                                    <li>
                                        <a href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    <li><a href="#">1</a></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">4</a></li>
                                    <li><a href="#">5</a></li>
                                    <li>
                                        <a href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>                        
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="footer-top-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-6">
                        <div class="footer-about-us">
                            <h2>u<span>Stora</span></h2>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perferendis sunt id doloribus vero quam laborum quas alias dolores blanditiis iusto consequatur, modi aliquid eveniet eligendi iure eaque ipsam iste, pariatur omnis sint! Suscipit, debitis, quisquam. Laborum commodi veritatis magni at?</p>
                            
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-6">
                        <div class="footer-menu">
                            <h2 class="footer-wid-title">TaiPham Company </h2>
                            <h3>Chủ Shop Đẹp Trai Thân Thiện Chưa Có Người Yêu</h3>
                            <h1>SDT:0898121579</h1>                 
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-6">
                        <div class="footer-menu">
                            <h2 class="footer-wid-title">Categories</h2>
                            <ul>
                                <li><a href="">Book</a></li>
                                
                            </ul>                        
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-6">
                        <div class="footer-newsletter">
                            <h2 class="footer-wid-title">Newsletter</h2>
                            <p>Sign up to our newsletter and get exclusive deals you wont find anywhere else straight to your inbox!</p>
                            <div class="newsletter-form">
                                <input type="email" placeholder="Type your email">
                                <input type="submit" value="Subscribe">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-bottom-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <div class="copyright">
                            <p>&copy; 2015 uCommerce. All Rights Reserved. <a href="http://www.freshdesignweb.com" target="_blank">freshDesignweb.com</a></p>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="footer-card-icon">
                            <i class="fa fa-cc-discover"></i>
                            <i class="fa fa-cc-mastercard"></i>
                            <i class="fa fa-cc-paypal"></i>
                            <i class="fa fa-cc-visa"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Latest jQuery form server -->
        <script src="https://code.jquery.com/jquery.min.js"></script>

        <!-- Bootstrap JS form CDN -->
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

        <!-- jQuery sticky menu -->
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.sticky.js"></script>

        <!-- jQuery easing -->
        <script src="js/jquery.easing.1.3.min.js"></script>

        <!-- Main Script -->
        <script src="js/main.js"></script>
    </body>
</html>