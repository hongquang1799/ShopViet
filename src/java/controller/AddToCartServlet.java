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
public class AddToCartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String MSSP=request.getParameter("MSSP");
        try {
            int soLuongCon=Integer.parseInt(request.getParameter("soLuongCon"));
            int soLuong=Integer.parseInt(request.getParameter("soLuong"));
            if (soLuong>soLuongCon) {
                request.setAttribute("thongBao", "Số lượng sản phẩm nhập vào lớn hơn lượng sản phẩm hiện có");
                RequestDispatcher rd = request.getRequestDispatcher("ProductViewServlet?MSSP="+MSSP);
                rd.forward(request, response);
            }
            else {
                Cookie cookie = new Cookie(MSSP, Integer.toString(soLuong));
                response.addCookie(cookie);
                request.setAttribute("thongBao", "Đã thêm sản phẩm vào giỏ hàng");
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            }
        }
        catch (NumberFormatException ex) {
            
            request.setAttribute("thongBao", "Số lượng sản phẩm nhập vào không hợp lệ");
            RequestDispatcher rd = request.getRequestDispatcher("ProductViewServlet?MSSP="+MSSP);
        }
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doPost(req, resp);
    }
}
