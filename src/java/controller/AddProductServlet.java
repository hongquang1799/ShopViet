/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bll.AccountBLL;
import bll.ProductBLL;
import entity.Account;
import entity.Product;
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
public class AddProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        AccountBLL accountBLL = new AccountBLL();
        ProductBLL productBLL = new ProductBLL();
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
        if (tenTaiKhoan == null || matKhau == null) {
            request.setAttribute("thongBao", "Bạn chưa đăng nhập");
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
        else if (accountBLL.checkDangNhap(tenTaiKhoan, matKhau) == 0) {
            request.setAttribute("thongBao", "Tài khoản đăng nhập hoặc mật khẩu không đúng");
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
        else if (!accountBLL.layThongTinTaiKhoan(tenTaiKhoan).get(0).getLoai().equals("Quản trị viên")) {
            request.setAttribute("thongBao", "Bạn không phải quản trị viên");
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
        else {
            Product p=new Product();
            p.setTenSanPham(request.getParameter("tenSanPham"));
            p.setLoai(request.getParameter("loai"));            
            p.setGia(Integer.parseInt(request.getParameter("gia")));
            p.setSoLuong(Integer.parseInt(request.getParameter("soLuong")));            
            p.setNgaySX(request.getParameter("ngaySX"));
            p.setHang(request.getParameter("hang"));    
            p.setQuocGia(request.getParameter("quocGia"));
            p.setMoTa(request.getParameter("moTa"));

            
            productBLL.themSanPham(p);
            request.setAttribute("thongBao", "Đã thêm sản phẩm thành công");
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
