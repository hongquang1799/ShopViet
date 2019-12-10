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
public class GetDataFixAccountServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        
        AccountBLL accountBLL = new AccountBLL();
        String tenTaiKhoan=request.getParameter("tenTaiKhoan");
        Account acc = accountBLL.layThongTinTaiKhoan(tenTaiKhoan).get(0);
        request.setAttribute("acc",acc);  
        if (acc==null)
            request.setAttribute("thongBao", "Không tìm thấy tài khoản "+tenTaiKhoan);
        RequestDispatcher rd = request.getRequestDispatcher("accountfix.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doPost(req, resp);
    }
}
