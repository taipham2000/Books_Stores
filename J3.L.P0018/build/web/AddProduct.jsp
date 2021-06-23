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
        <style>
            .footer-top-area{
                margin-top:  200px;
            }
            </style>
    </head>
    <body>
        <h1>Add Product</h1>
        <form action="ProductServlet" method="post" >
            <table>
                <tr>
                    <td>Product ID:</td>
                    <td><input type="text" name="productID" value="${requestScope.product.productID}"></td>
                    <td><font color="red">${requestScope.INVALID.productIDError}</font></td>
                </tr>
                <tr>
                    <td>Product Name:</td>
                    <td><input type="text" name="productName" value="${requestScope.product.productName}"></td>
                    <td><font color="red">${requestScope.INVALID.productNameError}</font></td>
                </tr>
                <tr>
                    <td>Price:</td>
                    <td><input type="text" name="price" value="${requestScope.product.price}"></td>
                   
                </tr>
                <tr>
                    <td>Quantity:</td>
                    <td><input type="text" name="quantity" value="${requestScope.product.quantity}"></td>
                    
                </tr>
                <tr>
                    <td>Short Description:</td>
                    <td><textarea type="text" name="shortDescription" value="${requestScope.product.shortDescription}" required=""></textarea></td>
                    
                </tr>
                <tr>
                    <td>Product Description:</td>
                    <td><textarea type="textarea" name="productDescription" value="${requestScope.product.productDescription}" required=""></textarea></td>
                    
                </tr>
                <tr>
                    <td>ImageUrl:</td>
                    <td><input type="file" name="photo" accept="img/*" multiple="multiple" value="${requestScope.product.imageUrl}"/></td>
                </tr>
                <tr>
                    <td>Image:</td>
                    <td><input type="text" name="txtimage"  multiple="multiple" value="${requestScope.product.imageUrl}" required=""/></td>
                </tr>
                <tr>
                    <td>Category name:</td>
                    <td>
                                    <select name="categoryID">
                                    <option value="0">- Select Category Name -</option>
                                    <c:forEach items="${requestScope.listCategory}" var="category">
                                        <c:if test="${category.categoryID eq requestScope.product.categoryID}">
                                            <option value="${category.categoryID}" selected>${category.categoryName}</option>
                                        </c:if>
                                        <c:if test="${category.categoryID ne requestScope.product.categoryID}">
                                            <option value="${category.categoryID}">${category.categoryName}</option>
                                        </c:if>
                                    </c:forEach>
                                    </select>
                                    <i id="categoryIDError" style="color:red;"></i>
                                </td>

                </tr>
                <tr>
                    <td>
                        <input type="submit" name="action" value="Create"/>
                        <input type="reset" value="Reset"/>
                    </td>
                </tr>
            </table>
        </form>

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
