<%@page import="bll.AccountBLL"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Danh sách sản phẩm</title>
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
                <c:forEach var="product" items="${productList}">
                    <img src="${initParam.imgProductPath}${product.getAnh()}" width="40%" align="left" class="img-responsive watch-right" alt=""/>

                    <div align="left" style="width:100%; ">
                        <h4>MSSP: ${product.getMSSP()}</h4>
                        <br>
                        <h4>TÊN SẢN PHẨM: ${product.getTenSanPham()}</h4>
                        <br>
                        <h4>LOẠI: ${product.getLoai()}</h4>
                        <br>
                        <h3>GIÁ: <b>${product.getGia()}VNĐ</b></h3>
                        <br>
                        <h4>SỐ LƯỢNG CÒN: ${product.getSoLuong()}</h4>
                        <br>
                        <h4>NGÀY SẢN XUẤT: ${product.getNgaySX()}</h4>
                        <br>
                        <h4>HÃNG: ${product.getHang()}</h4>
                        <br>
                        <h4>QUỐC GIA: ${product.getQuocGia()}</h4>
                        <br>
                        <h4>MÔ TẢ: ${product.getMoTa()}</h4>
                        <br>
                    </div>
                    <div class="clearfix"> </div>
                    <%
                        String tenTaiKhoan=null,matKhau=null;
                        Cookie ck[]=request.getCookies();
                        if (ck!=null)
                            for (Cookie c:ck)
                                if ("tenTaiKhoan".equals(c.getName()))
                                    tenTaiKhoan=c.getValue();
                                else if ("matKhau".equals(c.getName()))
                                    matKhau=c.getValue();
                        AccountBLL accountBLL=new AccountBLL();
                        if (tenTaiKhoan!=null && matKhau!=null && accountBLL.checkDangNhap(tenTaiKhoan, matKhau)==1) {
                            
                    %>
                    <div>
                        <form action="AddToCartServlet?MSSP=${product.getMSSP()}&soLuongCon=${product.getSoLuong()}" method="post">
                            <h4>Nhập số lượng
                                <input type="text" name="soLuong"> 
                                <input type="submit" value="Thêm vào giỏ hàng">
                                <div class="clearfix"> </div>
                            </h4>
                        </form>
                    </div>
                    <% } else { %>
                    <h4><font color="red">Vui lòng <a href="login.jsp"><font color="blue">đăng nhập</font></a> để mua hàng</font></h4>
                    <% } %>
                </c:forEach>
                    <div class="clearfix"> </div>
            </div>
        
        <jsp:include page = "reusejsp/leftmenu.jsp"></jsp:include> 
        </div>
        <!---->

    <jsp:include page = "reusejsp/footer.jsp"></jsp:include>
</body>
</html>