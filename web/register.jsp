<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Register</title>
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
                <div class="register">
                    <jsp:include page = "reusejsp/note.jsp"></jsp:include>
                    <form action="RegisterServlet" method="post">
                        <div class="  register-top-grid">
                            <h3>THÔNG TIN CÁ NHÂN</h3>
                            <div class="mation">
                                <span>Họ và tên<label>*</label></span>
                                <input type="text" name="hoTen"> 
                                <span>Ngày sinh<label>*</label></span>
                                <input type="date" name="ngaySinh"> 
                                <p></p>
                                <span>Địa chỉ</span>
                                <input type="text" name="diaChi"> 
                                <span>Số điện thoại<label>*</label></span>
                                <input type="text" name="SDT"> 
                                <span>Email<label>*</label></span>
                                <input type="text" name="email"> 
                                <span>Số CMND<label>*</label></span>
                                <input type="text" name="CMND"> 
                            </div>
                            <div class="clearfix"> </div>                    
                        </div>
                        <div class="  register-bottom-grid">
                            <h3>THÔNG TIN ĐĂNG NHẬP</h3>
                            <div class="mation">
                                <span>Tên tài khoản<label>*</label></span>
                                <input type="text" name="tenTaiKhoan">                                
                                <span>Mật khẩu<label>*</label></span>
                                <input type="password" name="matKhau1">
                                <p></p>
                                <span>Nhập lại mật khẩu<label>*</label></span>
                                <input type="password" name="matKhau2">
                            </div>
                        </div>
                        <div class="register-but">
                            <input type="submit" value="Đăng ký">
                            <div class="clearfix"> </div>
                        </div>
                    </form>
                    <div class="clearfix"> </div>
                </div>
            <jsp:include page="reusejsp/leftmenu.jsp"></jsp:include>
            </div>
        <jsp:include page = "reusejsp/footer.jsp"></jsp:include>
    </body>
</html>