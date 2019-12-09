<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Đăng nhập</title>
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
                        <h3>ĐĂNG NHẬP</h3>
                        <p>Nếu đã có tài khoản, hãy đăng nhập</p>
                        <form action="LoginServlet" method="post">
                            <div>
                                <span>Tên đăng nhập<label>*</label></span>
                                <input type="text" name="tenTaiKhoan"> 
                            </div>
                            <div>
                                <span>Mật khẩu<label>*</label></span>
                                <input type="password" name="matKhau"> 
                            </div>
                            <div><a class="forgot" href="#">Quên mật khẩu?</a></div>
                            <input type="submit" value="Đăng nhập">
                        </form>
                    </div>	
                    <div class=" login-left">
                        <h3>CHƯA CÓ TÀI KHOẢN?</h3>
                        <p>Tạo tài khoản của bạn để có thể mua hàng trực tuyến</p>
                        <a class="acount-btn" href="register.html">Tạo tài khoản</a>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <jsp:include page = "reusejsp/leftmenu.jsp"></jsp:include>    
            </div>
            <!---->

        <jsp:include page = "reusejsp/footer.jsp"></jsp:include>
    </body>
</html>