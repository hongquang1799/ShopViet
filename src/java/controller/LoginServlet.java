/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bll.AccountBLL;
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
public class LoginServlet extends HttpServlet {

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
            request.setAttribute("thongBao", "Đăng nhập thành công, vui lòng tải lại trang web");
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
        tenTaiKhoan = request.getParameter("tenTaiKhoan");
        matKhau = request.getParameter("matKhau");
        request.setAttribute("thongBao", "Failure");

        if (accountBLL.checkDangNhap(tenTaiKhoan, matKhau) == 0) {
            request.setAttribute("thongBao", "Tên tài khoản hoặc mật khẩu không đúng");
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        } else {
            Cookie ttk = new Cookie("tenTaiKhoan", tenTaiKhoan);
            response.addCookie(ttk);
            Cookie mk = new Cookie("matKhau", matKhau);
            response.addCookie(mk);
            request.setAttribute("thongBao", "Đăng nhập thành công, vui lòng tải lại trang web");
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doPost(req, resp);
    }
}
