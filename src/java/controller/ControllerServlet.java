/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bll.ProductBLL;
import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user1
 */
@WebServlet(name="ControllerServlet",loadOnStartup=1,urlPatterns={"/ControllerServlet"})
public class ControllerServlet extends HttpServlet {
    @Override
    public void init(ServletConfig servletConfig) throws ServletException {
        super.init(servletConfig);
        ProductBLL productBLL=new ProductBLL();
        getServletContext().setAttribute("newProducts",productBLL.laySanPhamMoi(5));
    }
    
    @Override
    protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        
    }
}
