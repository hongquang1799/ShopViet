/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bll.AccountBLL;
import entity.Account;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user1
 */
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        AccountBLL accountBLL = new AccountBLL();
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
        if (tenTaiKhoan != null && matKhau != null && accountBLL.checkDangNhap(tenTaiKhoan, matKhau) == 1) {
            request.setAttribute("thongBao", "Bạn đã có tài khoản");
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
        Account acc = new Account();
        acc.setHoTen(request.getParameter("hoTen"));
        acc.setNgaySinh(request.getParameter("ngaySinh"));
        acc.setDiaChi(request.getParameter("diaChi"));
        acc.setSDT(request.getParameter("SDT"));
        acc.setEmail(request.getParameter("email"));
        acc.setCMND(request.getParameter("CMND"));
        acc.setTenTaiKhoan(request.getParameter("tenTaiKhoan"));
        acc.setMatKhau(request.getParameter("matKhau1"));
        acc.setLoai("Khách hàng");
        request.setAttribute("account", acc);
        request.setAttribute("thongBao", "Failure");
        
        if (!acc.getMatKhau().equals( request.getParameter("matKhau2"))) {
            request.setAttribute("thongBao", "Mật khẩu xác nhận không đúng");
            RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
            rd.forward(request, response);
        }
        else if (accountBLL.checkTenTaiKhoan(acc.getTenTaiKhoan())==1) {
            request.setAttribute("thongBao", "Tài khoản đã tồn tại");
            RequestDispatcher rd=request.getRequestDispatcher("register.jsp");
            rd.forward(request,response);
        }
        else {
            accountBLL.taoTaiKhoan(acc);
            request.setAttribute("thongBao", "Đã thêm tài khoản thành công. Hãy đăng nhập");
            RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
            rd.forward(request,response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doPost(req, resp);
    }
}
