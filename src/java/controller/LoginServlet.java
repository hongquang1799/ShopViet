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
        AccountBLL accountBLL=new AccountBLL();
        String tenTaiKhoan=request.getParameter("tenTaiKhoan");
        String matKhau=request.getParameter("matKhau");
        request.setAttribute("thongBao", "Failure");
        
        if (accountBLL.checkDangNhap(tenTaiKhoan,matKhau)==0) {
            request.setAttribute("thongBao", "Tên tài khoản hoặc mật khẩu không đúng");
            RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
            rd.forward(request,response);
        }
        else {
            Cookie ck = new Cookie("tenTaiKhoan", tenTaiKhoan);
            response.addCookie(ck);
            ck = new Cookie("matKhau", matKhau);
            response.addCookie(ck);
            request.setAttribute("thongBao", "Đăng nhập thành công");
            RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
            rd.forward(request,response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doPost(req, resp);
    }
}
