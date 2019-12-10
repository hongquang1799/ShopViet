<%@page import="entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="bll.ProductBLL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Home</title>
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
                <div class="shoes-grid">
                    
                    <jsp:include page = "reusejsp/note.jsp"></jsp:include>
                        <%
                            ProductBLL productBLL=new ProductBLL();
                            List<Product> plist=productBLL.laySanPhamMoi(6);
                        %>
                        <div class="wrap-in">
                            <div class="wmuSlider example1 slide-grid">		 
                                <div class="wmuSliderWrapper">		  
                                    <article style="position: absolute; width: 100%; opacity: 0;">					
                                        <div class="banner-matter">
                                            <div class="col-md-5 banner-bag">
                                                <img class="img-responsive " src="${initParam.imgProductPath}<%=plist.get(0).getAnh()%>" alt=" " />
                                            </div>
                                            <div class="col-md-7 banner-off">							
                                                <h2><%=plist.get(0).getGia()%>VNĐ</h2>
                                                <label><%=plist.get(0).getTenSanPham()%></label>
                                                <p><%=plist.get(0).getMoTa()%></p>					
                                                <a href="ProductViewServlet?MSSP=<%=plist.get(0).getMSSP()%>"><span class="on-get">Chi tiết</span></a>
                                            </div>

                                            <div class="clearfix"> </div>
                                        </div>

                                    </article>
                                    <article style="position: absolute; width: 100%; opacity: 0;">					
                                        <div class="banner-matter">
                                            <div class="col-md-5 banner-bag">
                                                <img class="img-responsive " src="${initParam.imgProductPath}<%=plist.get(1).getAnh()%>" alt=" " />
                                            </div>
                                            <div class="col-md-7 banner-off">							
                                                <h2><%=plist.get(1).getGia()%>VNĐ</h2>
                                                <label><%=plist.get(1).getTenSanPham()%></label>
                                                <p><%=plist.get(1).getMoTa()%></p>					
                                                <a href="ProductViewServlet?MSSP=<%=plist.get(1).getMSSP()%>"><span class="on-get">Chi tiết</span></a>
                                            </div>

                                            <div class="clearfix"> </div>
                                        </div>

                                    </article>
                                    <article style="position: absolute; width: 100%; opacity: 0;">					
                                        <div class="banner-matter">
                                            <div class="col-md-5 banner-bag">
                                                <img class="img-responsive " src="${initParam.imgProductPath}<%=plist.get(2).getAnh()%>" alt=" " />
                                            </div>
                                            <div class="col-md-7 banner-off">							
                                                <h2><%=plist.get(2).getGia()%>VNĐ</h2>
                                                <label><%=plist.get(2).getTenSanPham()%></label>
                                                <p><%=plist.get(2).getMoTa()%></p>					
                                                <a href="ProductViewServlet?MSSP=<%=plist.get(2).getMSSP()%>"><span class="on-get">Chi tiết</span></a>
                                            </div>

                                            <div class="clearfix"> </div>
                                        </div>

                                    </article>

                                </div>
                                </a>
                                <ul class="wmuSliderPagination">
                                    <li><a href="#" class="">0</a></li>
                                    <li><a href="#" class="">1</a></li>
                                    <li><a href="#" class="">2</a></li>
                                </ul>
                                <script src="js/jquery.wmuSlider.js"></script> 
                                <script>
                                    $('.example1').wmuSlider();
                                </script> 
                            </div>
                        </div>
                    <!---->
                    
                    
                    <div class="products">
                        <h5 class="latest-product">Sản phẩm mới nhất</h5>	
                        <a class="view-all" href="product.html">Xem tất cả<span> </span></a> 		     
                    </div>
                    <div class="product-left">
                        <div class="col-md-4 chain-grid">
                            <a href="ProductViewServlet?MSSP=<%=plist.get(3).getMSSP()%>"><img class="img-responsive chain" src="${initParam.imgProductPath}<%=plist.get(3).getAnh()%>" alt=" " /></a>
                            <span class="star"> </span>
                            <div class="grid-chain-bottom">
                                <h6><a href="ProductViewServlet?MSSP=<%=plist.get(3).getMSSP()%>"><%=plist.get(3).getTenSanPham()%></a></h6>
                                <div class="star-price">
                                    <div class="dolor-grid"> 
                                        <span class="actual"><%=plist.get(3).getGia()%>VNĐ</span>
                                    </div>
                                    <a class="now-get get-cart" href="ProductViewServlet?MSSP=<%=plist.get(3).getMSSP()%>">Chi tiết</a> 
                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 chain-grid">
                            <a href="ProductViewServlet?MSSP=<%=plist.get(4).getMSSP()%>"><img class="img-responsive chain" src="${initParam.imgProductPath}<%=plist.get(4).getAnh()%>" alt=" " /></a>
                            <span class="star"> </span>
                            <div class="grid-chain-bottom">
                                <h6><a href="ProductViewServlet?MSSP=<%=plist.get(4).getMSSP()%>"><%=plist.get(4).getTenSanPham()%></a></h6>
                                <div class="star-price">
                                    <div class="dolor-grid"> 
                                        <span class="actual"><%=plist.get(4).getGia()%>VNĐ</span>
                                    </div>
                                    <a class="now-get get-cart" href="ProductViewServlet?MSSP=<%=plist.get(4).getMSSP()%>">Chi tiết</a> 
                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 chain-grid grid-top-chain">
                            <a href="ProductViewServlet?MSSP=<%=plist.get(5).getMSSP()%>"><img class="img-responsive chain" src="${initParam.imgProductPath}<%=plist.get(5).getAnh()%>" alt=" " /></a>
                            <span class="star"> </span>
                            <div class="grid-chain-bottom">
                                <h6><a href="ProductViewServlet?MSSP=<%=plist.get(5).getMSSP()%>"><%=plist.get(5).getTenSanPham()%></a></h6>
                                <div class="star-price">
                                    <div class="dolor-grid"> 
                                        <span class="actual"><%=plist.get(5).getGia()%>VNĐ</span>
                                    </div>
                                    <a class="now-get get-cart" href="ProductViewServlet?MSSP=<%=plist.get(5).getMSSP()%>">Chi tiết</a> 
                                    <div class="clearfix"> </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                    <div class="clearfix"> </div>
                    </div>   
            <jsp:include page = "reusejsp/leftmenu.jsp"></jsp:include>        	         
            </div>
        <jsp:include page = "reusejsp/footer.jsp"></jsp:include>
    </body>
</html>