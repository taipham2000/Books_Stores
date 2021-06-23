<%-- 
    Document   : showcart
    Created on : May 15, 2021, 4:58:14 PM
    Author     : phamv
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
        ustora by freshdesignweb.com
        Twitter: https://twitter.com/freshdesignweb
        URL: https://www.freshdesignweb.com/ustora/
-->
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Cart Page - Ustora Demo</title>

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
    </head>
    <body>

        <div class="mainmenu-area">
            <div class="container">
                <div class="row">
                    <div class="navbar-header">
                      
                    </div> 
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li><a href="ProductServlet">Home</a></li>
                            <c:if test="${sessionScope.user!=null}">
                                <li><a href="ProductServlet?action=ViewOrderOfCustomer&userID=${user.userID}"> Your Order</a></li>
                                </c:if>
                                <c:if test="${sessionScope.user==null}">
                                <li><a href="ProductServlet?action=Login"> Login</a></li>
                                </c:if>
                                <c:if test="${sessionScope.user!=null}">
                                <li><a href="ProductServlet?action=logout"> Logout</a></li>
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
                            <h2>Shopping Cart</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- End Page title area -->


        <div class="single-product-area">
            <div class="zigzag-bottom"></div>
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="single-sidebar">
                            <h2 class="sidebar-title">Search Products</h2>
                            <form action="ProductServlet" method="post">
                                <input type="text" name="search" placeholder="Search products...">
                                <input type="submit" name="action" value="search">
                            </form>
                        </div>


                    </div>
                    <session>
                        <div class="col-md-8">
                            <div class="product-content-right">
                                <div class="woocommerce">
                                    <table cellspacing="0" class="shop_table cart">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>Image</th>
                                                <th class="product-name">Product</th>
                                                <th class="product-price">Price</th>
                                                <th class="product-quantity">Quantity</th>
                                                <th class="product-subtotal">Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            
                                            <c:set var = "total2" scope = "session" value = "${0}"/>
                                            <c:forEach items="${cart}" var="cart">
                                                <tr>
                                                    <td class="product-remove">
                                                        <a title="Remove this item" class="remove" href="CartServlet?action=remove&productID=${cart.sanpham.productID}"  onclick="return confirm('Are you sure product?')">×</a> 
                                                    </td>

                                                    <td><img src="img/${cart.sanpham.imageUrl}" height="30px"/></td>
                                                    <td>${cart.sanpham.productName}</td>
                                                    <td>${cart.sanpham.price} VNĐ</td>
                                                    <td>${cart.quantities}</td>
                                                    <td>${cart.sanpham.price*cart.quantities} VNĐ</td>
                                                </tr>
                                                <c:set var="totalUnitPrice" value="${cart.sanpham.price*cart.quantities}"/>

                                                <c:set var="totalPrice" value="${totalPrice + totalUnitPrice}"/>
                                        </c:forEach>
                                        <tr>
                                            <td colspan="5" align="right"> <b>Original Total :<b/></td>
                                            <td colspan="1" >${totalPrice} VNĐ</td>

                                        </tr>
                                        <tr>
                                        <c:if test ="${empty(cart)}">
                                            <td style="color:red" colspan="6"><b>Your cart is empty!</b></td>
                                        </c:if>
                                        </tr>
                                        <c:if test="${!empty(ListAmount)}">
                                            
                                        </c:if>
                                        
                                        <form action="ApplyDiscountServlet" method="POST">
                                            <td><input type="text" name="txtdiscountID" placeholder="Code Discount"> </td>
                                        <%--    <select name="txtdiscountID">
                                                <option >- Customer Name -</option>
                                                <c:forEach var="d" items="${requestScope.ListDiscount}">
                                                    <option value="${d.discountID}" selected>${d.discountDescription}</option>
                                                </c:forEach>
                                            </select>  --%>
                                            <td><input type="submit" value="DiscountApply" class="btn btn-info" name="action" style="float: left"/></td>
                                        </form> 
                                         <c:if test="${empty requestScope.discountID}">                                                
                                             <td colspan="2"><li><strong >Total Payment:</strong>                                                
                                                ${totalPrice}
                                            </li></td>
                                         <td colspan="2"><button /><a href="OrderServlet?action=checkout&totalPrice=${totalPrice}">CheckOut</a></button></td>
                                        </c:if>
                                        <c:if test="${not empty requestScope.discountID}">
                                            <c:set var="tdiscountID" value="${requestScope.tdiscountID}"/>
                                            <c:set var="totalPrice" value="${totalPrice * ((100-requestScope.Percent)/100)} "/>
                                <td colspan="2"><li><strong class="text-muted">Discount amount:</strong> ${requestScope.Description}</li>
                                            <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Total Payment:</strong>                                                
                                                ${totalPrice}
                                            </li></td>
                                            <td colspan="2">  <a class="checkout-button button alt wc-forward" href="OrderServlet?action=checkout&totalPrice=${totalPrice}" >Checkout</a></td>
                                        </c:if>
                                            
                                      <%--  <tr>
                                            <td class="actions" colspan="6">

                                                <a class="checkout-button button alt wc-forward" href="OrderServlet?action=checkout&totalPrice=${totalPrice}" >Checkout</a>
                                            </td>
                                        </tr>--%>
                                        </tbody>
                                    </table>
                       
                            </div>                    
                        </div>
                    </session>
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
                            <div class="footer-social">
                                <a href="#" target="_blank"><i class="fa fa-facebook"></i></a>
                                <a href="#" target="_blank"><i class="fa fa-twitter"></i></a>
                                <a href="#" target="_blank"><i class="fa fa-youtube"></i></a>
                                <a href="#" target="_blank"><i class="fa fa-linkedin"></i></a>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-6">
                        <div class="footer-menu">
                            <h2 class="footer-wid-title">User Navigation </h2>
                            <ul>
                                <li><a href="#">My account</a></li>
                                <li><a href="#">Order history</a></li>
                                <li><a href="#">Wishlist</a></li>
                                <li><a href="#">Vendor contact</a></li>
                                <li><a href="#">Front page</a></li>
                            </ul>                        
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-6">
                        <div class="footer-menu">
                            <h2 class="footer-wid-title">Categories</h2>
                            <ul>
                                <li><a href="#">Mobile Phone</a></li>
                                <li><a href="#">Home accesseries</a></li>
                                <li><a href="#">LED TV</a></li>
                                <li><a href="#">Computer</a></li>
                                <li><a href="#">Gadets</a></li>
                            </ul>                        
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-6">
                        <div class="footer-newsletter">
                            <h2 class="footer-wid-title">Newsletter</h2>
                            <p>Sign up to our newsletter and get exclusive deals you wont find anywhere else straight to your inbox!</p>
                            <div class="newsletter-form">
                                <form action="#">
                                    <input type="email" placeholder="Type your email">
                                    <input type="submit" value="Subscribe">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- End footer top area -->

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
        </div> <!-- End footer bottom area -->

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