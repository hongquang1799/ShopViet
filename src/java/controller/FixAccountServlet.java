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
public class FixAccountServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        AccountBLL accountBLL = new AccountBLL();
        Account acc = new Account();
        acc.setTenTaiKhoan(request.getParameter("tenTaiKhoan"));
        acc.setMatKhau(request.getParameter("matKhau"));
        acc.setHoTen(request.getParameter("hoTen"));
        acc.setNgaySinh(request.getParameter("ngaySinh"));
        acc.setDiaChi(request.getParameter("diaChi"));
        acc.setSDT(request.getParameter("SDT"));
        acc.setEmail(request.getParameter("email"));
        acc.setCMND(request.getParameter("CMND"));
        acc.setLoai(request.getParameter("loai"));
        accountBLL.suaThongTinTaiKhoan(acc);
        String sql = "update NGUOIDUNG set TENTAIKHOAN=N'"
                    + acc.getTenTaiKhoan();
            if (!"".equals(acc.getMatKhau()))
                sql=sql+"',MATKHAU=N'"+ acc.getMatKhau();
            sql=sql+"',HOTEN=N'"
                    + acc.getHoTen()+"',NGAYSINH='"
                    + acc.getNgaySinh()+"',DIACHI=N'"
                    + acc.getDiaChi()+"',SDT='"
                    + acc.getSDT()+"',EMAIL=N'"
                    + acc.getEmail()+"',CMND='"
                    + acc.getCMND()+"',LOAI=N'"
                    + acc.getLoai()+"' where TENTAIKHOAN=N'"
                    + acc.getTenTaiKhoan();           
        request.setAttribute("thongBao", sql);
        
        RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doPost(req, resp);
    }
}
