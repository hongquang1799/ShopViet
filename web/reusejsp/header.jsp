<%@page import="bll.AccountBLL"%>
<%@page import="entity.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="header">
        <div class="top-header">
            <div class="container">
                <div class="top-header-left">
                    <ul class="support">
                        <li><a href="#"><label> </label></a></li>
                        <li><a href="#">Hỗ trợ 24/7</a></li>
                    </ul>
                    <ul class="support">
                        <li class="van"><a href="#"><label> </label></a></li>
                        <li><a href="#">Giao hàng tận nơi trên toàn quốc</a></li>
                    </ul>
                    <div class="clearfix"> </div>
                </div>
                <div class="top-header-right">
                    <div class="down-top">		
                        <select class="in-drop">
                            <option value="Vietnamese" class="in-of">Tiếng Việt</option>
                            <option value="English" class="in-of">English</option>
                        </select>
                    </div>
                    <div class="down-top top-down">
                        <select class="in-drop">
                            <option value="VND" class="in-of">VND</option>
                            <option value="Dollar" class="in-of">Dollar</option>
                        </select>
                    </div>
                    <!---->
                    <div class="clearfix"> </div>	
                </div>
                <div class="clearfix"> </div>		
            </div>
        </div>
        <div class="bottom-header">
            <div class="container">
                <div class="header-bottom-left">
                    <div class="logo">
                        <a href="index.jsp"><img src="images/logo.png" alt=" " /></a>
                    </div>
                    <div class="search">
                        <input type="text" value="" onfocus="this.value = '';" onblur="if (this.value == '') {
                                    this.value = '';
                                }" >
                        <input type="submit"  value="Tìm kiếm">

                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="header-bottom-right">	
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
                        if (tenTaiKhoan!=null && matKhau!=null && accountBLL.checkDangNhap(tenTaiKhoan, matKhau)==1 ) {
                            
                    %>
                    <% if(accountBLL.layThongTinTaiKhoan(tenTaiKhoan).get(0).getLoai().equals("Quản trị viên")) { %>
                    <div class="account"> <a href="admin.jsp"><span> </span>Admin</a><a href="individual.jsp">&nbsp;&nbsp;<%=tenTaiKhoan %></a>
                            
                            </div>
                    <% } else { %>
                    <div class="account"><a href="individual.jsp"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= tenTaiKhoan %> 
                            
                            </span></a></div>
                            <% } %>
                    
                    <ul class="login">
                        <li><a href="LogoutServlet"><span> </span>Đăng xuất</a></li> 
                    </ul>
                    <div class="cart"><a href="#"><span> </span><a href="cartview.jsp">Giỏ hàng</a></div>
                    
                    <div class="clearfix"> </div>
                    <%}else{%>
                    <ul class="login">
                        <li><a href="login.jsp"><span> </span>Đăng nhập</a></li> |
                        <li><a href="register.jsp">Đăng ký</a></li>
                    </ul>
                    <div class="clearfix"> </div>
                    <%}%>
                </div>
                <div class="clearfix"> </div>	
            </div>
        </div>
    </div>
</html>