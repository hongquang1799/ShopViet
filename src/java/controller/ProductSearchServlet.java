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
public class ProductSearchServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        
        ProductBLL productBLL = new ProductBLL();
        String loaiSanPham=request.getParameter("loaiSanPham");
        List<Product> productList = productBLL.timKiemSanPham(loaiSanPham);
        request.setAttribute("productList",productList);
        if ("All".equals(loaiSanPham))
            request.setAttribute("thongBao", "Số sản phẩm hiện có: "+Integer.toString(productList.size()));
        else
            request.setAttribute("thongBao", "Số sản phẩm "+loaiSanPham+" tìm được: "+Integer.toString(productList.size()));
        RequestDispatcher rd = request.getRequestDispatcher("productview.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doPost(req, resp);
    }
}
