<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Products</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <!--theme-style-->
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
        <!--//theme-style-->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!--fonts-->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
        <!--//fonts-->
        <script src="js/jquery.min.js"></script>
        <!--script-->
    </head>
    <body>

        <jsp:include page = "reusejsp/header.jsp"></jsp:include>

            <div class="container">	
                <div class="women-product">
                    <div class=" w_content">
                        <div class="women">
                            <span>Số kết quả tìm kiếm :</span> </h4></a>

                            <div class="clearfix"> </div>	
                        </div>
                    </div>
                    <!-- grids_of_4 -->
                    <div class="grid-product">
                        <jsp:include page = "reusejsp/note.jsp"></jsp:include>
                        <c:forEach var="product" items="${productList}">
                            <div class="  product-grid">
                                <div class="content_box"><a href="single.html">
                                        <div class="left-grid-view grid-view-left">
                                            <img src="${initParam.imgProductPath}${product.getAnh()}" width="179" height="250" class="img-responsive watch-right" alt=""/>
                                            <div class="mask">
                                                <div class="info">Quick View</div>
                                            </div>
                                    </a>
                                </div>
                                <h4><b><a href="#">TÊN SẢN PHẨM: ${product.getTenSanPham()}</a></b></h4>
                                <h4><b><font color="blue">GIÁ: ${product.getGia()}đ</font></b></h4>
                                <h4><b>SỐ LƯỢNG CÒN: ${product.getSoLuong()}</b></h4>
                            </div>
                            </div>
                        </c:forEach>
                        <div class="clearfix"> </div>
                    </div>
                </div>
            <jsp:include page = "reusejsp/leftmenu.jsp"></jsp:include> 
            </div>
            <!---->

        <jsp:include page = "reusejsp/footer.jsp"></jsp:include>
    </body>
</html>