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
        <title>Thông tin cá nhân</title>
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
                <%
                    String tenTaiKhoan = null, matKhau = null;
                    Cookie ck[] = request.getCookies();
                    if (ck != null) {
                        for (Cookie c : ck) {
                            if ("tenTaiKhoan".equals(c.getName())) {
                                tenTaiKhoan = c.getValue();
                            } else if ("matKhau".equals(c.getName())) {
                                matKhau = c.getValue();
                            }
                        }
                    }
                    AccountBLL accountBLL = new AccountBLL();
                    ProductBLL productBLL = new ProductBLL();
                    Account account = new Account();
                    if (tenTaiKhoan != null && matKhau != null && accountBLL.checkDangNhap(tenTaiKhoan, matKhau) == 1) {
                        account = accountBLL.layThongTinTaiKhoan(tenTaiKhoan).get(0);

                %>
                <br>
                <h4><b><font color="green">THÔNG TIN CÁ NHÂN</font></b></h4>
                <h4>Tên tài khoản: <%=account.getTenTaiKhoan()%></h4>
                <h4>Họ tên: <%=account.getHoTen()%></h4>
                <h4>Ngày sinh: <%=account.getNgaySinh()%></h4>
                <h4>Địa chỉ: <%=account.getDiaChi()%></h4>
                <h4>SĐT: <%=account.getSDT()%></h4>
                <h4>Email: <%=account.getEmail()%></h4>
                <h4>CMND: <%=account.getCMND()%></h4>
                <h4>Ngày tạo: <%=account.getNgayTao()%></h4>
                <h4>Loại tài khoản: <%=account.getLoai()%></h4>
                <br>
                <%
                    OrderBLL orderBLL = new OrderBLL();
                    List<Order> dsMuaHang = orderBLL.layLichSuMuaHang(account.getTenTaiKhoan());
                    if (dsMuaHang.size() == 0) {
                %>
                <h4>Tài khoản này chưa thực hiện giao dịch nào</h4>
                <%
                } else {

                %>
                <h4><b><font color="green">LỊCH SỬ MUA HÀNG</font></b></h4>
                <table>

                    <tr>
                        <th>MSSP</th>                        
                        <th>Tên sản phẩm</th>
                        <th>Tài khoản nhân viên giao hàng</th>
                        <th>Thời điểm mua</th>
                        <th>Số lượng</th>
                        <th>Địa chỉ giao hàng</th>
                        <th>Thời điểm giao hàng</th>
                        <th>Thời hạn bảo hành</th>
                        <th>Trạng thái</th>
                    </tr>
                    <% for (int i = 0; i < dsMuaHang.size(); i++) {
                            Order order = dsMuaHang.get(i);
                    %>
                    <tr>
                        <td><a href="ProductViewServlet?MSSP=<%=order.getMSSP()%>"><%=order.getMSSP()%></a></td>
                        <td><%=productBLL.layThongTinSanPham(order.getMSSP()).get(0).getTenSanPham()%></td>
                        <td><%=order.getTkNVGH()%></td>
                        <td><%=order.getThoiDiemMua()%></td>                        
                        <td><%=order.getSoLuong()%></td>
                        <td><%=order.getDiaChiGiaoHang()%></td>
                        <td><%=order.getThoiDiemGiaoHang()%></td>
                        <td><%=order.getThoiHanBaoHanh()%></td>
                        <td><%=order.getTrangThai()%></td>
                    </tr>
                    <% }%>
                </table>

                <% }}%>

            </div>

            <jsp:include page = "reusejsp/leftmenu.jsp"></jsp:include> 
            </div>
            <!---->

        <jsp:include page = "reusejsp/footer.jsp"></jsp:include>
    </body>
</html>