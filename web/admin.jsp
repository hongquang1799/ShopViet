<%@page import="entity.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="bll.OrderBLL"%>
<%@page import="bll.ProductBLL"%>
<%@page import="entity.Account"%>
<%@page import="bll.AccountBLL"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Admin</title>
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
        <style type="text/css">
            table, th, td{
                border:1px solid #868585;
            }
            table{
                border-collapse:collapse;
                width:100%;
            }
            th, td{
                text-align:left;
                padding:10px;
            }
            table tr:nth-child(odd){
                background-color:#eee;
            }
            table tr:nth-child(even){
                background-color:white;
            }
            table tr:nth-child(1){
                background-color:skyblue;
            }
        </style>
    </head>
    <body>

        <jsp:include page = "reusejsp/header.jsp"></jsp:include>
            <div class="container">	
                <div class="shoes-grid">
                <jsp:include page = "reusejsp/note.jsp"></jsp:include>
                <h3><b><font color="#F97E76">CHỌN CHỨC NĂNG</font></b></h3>
                <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="addproduct.jsp">Thêm sản phẩm</a></h4>        
                <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Chỉnh sửa sản phẩm</h4>                    
                <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Xem thông tin khách hàng</h4>   
                <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sửa mật khẩu tài khoản khách hàng</h4>   
                <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Xóa tài khoản khách hàng</h4>   
                </div>

            <jsp:include page = "reusejsp/leftmenu.jsp"></jsp:include> 
            </div>
        <jsp:include page = "reusejsp/footer.jsp"></jsp:include>
    </body>
</html>