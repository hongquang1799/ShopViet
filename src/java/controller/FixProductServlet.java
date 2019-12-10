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
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user1
 */
public class FixProductServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        ProductBLL productBLL = new ProductBLL();
        Product p = new Product();
        p.setMSSP(Integer.parseInt(request.getParameter("MSSP")));
        p.setTenSanPham(request.getParameter("tenSanPham"));
        p.setLoai(request.getParameter("loai"));
        p.setGia(Integer.parseInt(request.getParameter("gia")));
        p.setSoLuong(Integer.parseInt(request.getParameter("soLuong")));
        p.setNgaySX(request.getParameter("ngaySX"));
        p.setHang(request.getParameter("hang"));
        p.setQuocGia(request.getParameter("quocGia"));
        p.setMoTa(request.getParameter("moTa"));
        productBLL.suaThongTinSanPham(p);
        request.setAttribute("thongBao", "Đã sửa sản phẩm");
        
        RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doPost(req, resp);
    }
}
