<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="entity.Product"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Sửa tài khoản (Admin)</title>
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
                        <h3>NHẬP THÔNG TIN TÀI KHOẢN</h3>
                        <form action="GetDataFixAccountServlet" method="get">
                            <div>
                                <span>Nhập tên tài khoản<label></label></span>
                                <input type="text" name="tenTaiKhoan" value="${acc.getTenTaiKhoan()}">
                            </div>                            
                            <input type="submit" value="Lấy thông tài khoản">
                        </form>
                        <form action="FixAccountServlet" method="post">
                            <div>
                                <span>Tên tài khoản<label></label></span>
                                <input type="text" name="tenTaiKhoan"  value="${acc.getTenTaiKhoan()}" readonly> 
                            </div>
                            <div>
                                <span>Mật khẩu<label></label></span>
                                <input type="text" name="matKhau"  value="${acc.getMatKhau()}"> 
                            </div>
                            <div>
                                <span>Họ tên<label></label></span>
                                <input type="text" name="hoTen"  value="${acc.getHoTen()}"> 
                            </div>
                            <div>
                                <span>Ngày sinh<label></label></span>
                                <input type="date" name="ngaySinh"  value="${acc.getNgaySinh()}"> 
                            </div>
                            <div>
                                <span>Địa chỉ<label></label></span>
                                <input type="text" name="diaChi"  value="${acc.getDiaChi()}"> 
                            </div>
                            <div>
                                <span>SĐT<label></label></span>
                                <input type="text" name="SDT"  value="${acc.getSDT()}"> 
                            </div>
                            <div>
                                <span>Email<label></label></span>
                                <input type="text" name="email"  value="${acc.getEmail()}"> 
                            </div>
                            <div>
                                <span>CMND<label></label></span>
                                <input type="text" name="CMND"  value="${acc.getCMND()}"> 
                            </div>
                            <div>
                                <span>Ngày tạo<label></label></span>
                                <input type="date" name="ngayTao"  value="${acc.getNgayTao()}" readonly> 
                            </div>
                            <div>
                                <span>Loại tài khoản<label></label></span>
                                <input type="text" name="loai"  value="${acc.getLoai()}"> 
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