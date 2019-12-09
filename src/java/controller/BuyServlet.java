/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bll.AccountBLL;
import bll.OrderBLL;
import bll.ProductBLL;
import entity.Account;
import entity.Order;
import entity.Product;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
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
public class BuyServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        OrderBLL orderBLL = new OrderBLL();
        ProductBLL productBLL = new ProductBLL();
        String tenTaiKhoan = null, matKhau = null;
        Cookie ck[] = request.getCookies();
        List<Integer> dsMSSP = new ArrayList<Integer>();
        List<Integer> dsSoLuong = new ArrayList<Integer>();
        if (ck != null) {
            for (Cookie c : ck) {
                int test = 1;
                String s = c.getName();
                for (int i = 0; i < s.length(); i++) {
                    if (!Character.isDigit(s.charAt(i))) {
                        test = 0;
                        break;
                    }
                }
                if (test == 1) {
                    dsMSSP.add(Integer.parseInt(c.getName()));
                    dsSoLuong.add(Integer.parseInt(c.getValue()));
                }
                if ("tenTaiKhoan".equals(c.getName())) {
                    tenTaiKhoan = c.getValue();
                } else if ("matKhau".equals(c.getName())) {
                    matKhau = c.getValue();
                }
            }
        }
        for (int i = 0; i < dsMSSP.size(); i++) {
            Order order = new Order();
            order.setTkKhachHang(tenTaiKhoan);
            order.setMSSP(productBLL.layThongTinSanPham(dsMSSP.get(i)).get(0).getMSSP());
            order.setTkNVGH(null);
            order.setThoiDiemMua(null);
            order.setSoLuong(dsSoLuong.get(i));
            order.setDiaChiGiaoHang(request.getParameter("diaChiGiaoHang"));
            order.setThoiDiemGiaoHang(null);
            order.setThoiHanBaoHanh(null);
            order.setTrangThai("Chưa giao hàng");
            orderBLL.muaHang(order);
            Cookie ttk = new Cookie(Integer.toString(dsMSSP.get(i)), "");
            ttk.setMaxAge(0);
            response.addCookie(ttk);
        }
        request.setAttribute("thongBao", "Đã mua hàng thành công");
        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doPost(req, resp);
    }
}
