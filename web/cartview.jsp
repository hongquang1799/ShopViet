<%@page import="entity.Product"%>
<%@page import="bll.ProductBLL"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
                <div class="women-product">
                    <div class=" w_content">
                        <div class="women">
                            <span></span> </h4></a>

                            <div class="clearfix"> </div>	
                        </div>
                    </div>
                    <!-- grids_of_4 -->
                    <div class="grid-product">
                    <%
                        Cookie ck[] = request.getCookies();
                        List<Integer> dsMSSP = new ArrayList<Integer>();
                        List<Integer> dsSoLuong = new ArrayList<Integer>();
                        if (ck != null) {
                            for (Cookie c : ck) {
                                int test = 1;
                                String s = c.getName();
                                for (int i = 0; i < s.length(); i++) {
                                    if (!Character.isDigit(s.charAt(i))) {
                                        test = 0;
                                        break;
                                    }
                                }
                                if (test == 1) {
                                    dsMSSP.add(Integer.parseInt(c.getName()));
                                    dsSoLuong.add(Integer.parseInt(c.getValue()));
                                }
                            }
                        }
                        ProductBLL productBLL = new ProductBLL();
                        int tongTien=0;
                    %>
                    <table>
                        <tr>
                            <th>MSSP</th>
                            <th>Tên sản phẩm</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                            <th>Xóa khỏi giỏ hàng</th>
                        </tr>
                        <% for (int i=0;i<dsMSSP.size();i++) { %>
                        <tr>
                            <td><%=dsMSSP.get(i)%></td>
                            <% Product p=productBLL.layThongTinSanPham(dsMSSP.get(i)).get(0); 
                                tongTien=tongTien+p.getGia()*dsSoLuong.get(i);
                            %>
                            <td><%=p.getTenSanPham()%></td>
                            <td><%=p.getGia()%></td>
                            <td><%=dsSoLuong.get(i)%></td>
                            <td><a href="DeleteFromCartServlet?MSSP=<%=dsMSSP.get(i)%>">Xóa</a></td>
                        </tr>
                        <% } %>
                    </table>
                    <h3>Tổng số tiền: <%= tongTien%></h3>
                    <br>
                    <form action="BuyServlet" method="post">
                        <h4>Địa chỉ giao hàng</h4>
                        <input type="text" name="diaChiGiaoHang">
                        <input type="submit" value="Mua hàng">
                    </form>
                </div>
            </div>
            <jsp:include page = "reusejsp/leftmenu.jsp"></jsp:include> 
            </div>
            <!---->

        <jsp:include page = "reusejsp/footer.jsp"></jsp:include>
    </body>
</html>