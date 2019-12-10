<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="entity.Product"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Sửa sản phẩm</title>
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
    </head>
    <body>
        <jsp:include page = "reusejsp/header.jsp"></jsp:include>

            <div class="container">

                <div class="account_grid">
                    <jsp:include page = "reusejsp/note.jsp"></jsp:include>
                    <div class=" login-right">
                        <h3>NHẬP THÔNG TIN SẢN PHẨM</h3>
                        <form action="GetDataFixProductServlet" method="get">
                            <div>
                                <span>Nhập MSSP<label>*</label></span>
                                <input type="text" name="MSSP" value="${p.getMSSP()}">
                            </div>                            
                            <input type="submit" value="Lấy thông tin sản phẩm">
                        </form>
                        <form action="FixProductServlet" method="post">
                            <div>
                                <span>MSSP<label>*</label></span>
                                <input type="text" name="MSSP"  value="${p.getMSSP()}" readonly> 
                            </div>
                            <div>
                                <span>Tên sản phẩm<label>*</label></span>
                                <input type="text" name="tenSanPham"  value="${p.getTenSanPham()}"> 
                            </div>
                            <div>
                                <span>Loại<label>*</label></span>
                                <input type="text" name="loai"  value="${p.getLoai()}"> 
                            </div>
                            <div>
                                <span>Giá<label>*</label></span>
                                <input type="text" name="gia"  value="${p.getGia()}"> 
                            </div>
                            <div>
                                <span>Số lượng<label>*</label></span>
                                <input type="text" name="soLuong"  value="${p.getSoLuong()}">                               
                            </div>
                            <div>
                                <span>Ngày sản xuất<label>*</label></span>
                                <input type="date" name="ngaySX"  value="${p.getNgaySX()}"> 
                            </div>
                            <div>
                                <span>Hãng<label>*</label></span>
                                <input type="text" name="hang"  value="${p.getHang()}"> 
                            </div>
                            <div>
                                <span>Quốc gia<label>*</label></span>
                                <input type="text" name="quocGia"  value="${p.getQuocGia()}"> 
                            </div>
                            <div>
                                <span>Mô tả</span>
                                <input type="text" name="moTa"  value="${p.getMoTa()}"> 
                            </div>
                            <input type="submit" value="Thay đổi">
                        </form>
                    </div>	
                    
                    <div class="clearfix"> </div>
                </div>
                <jsp:include page = "reusejsp/leftmenu.jsp"></jsp:include>    
            </div>
            <!---->

        <jsp:include page = "reusejsp/footer.jsp"></jsp:include>
    </body>
</html>