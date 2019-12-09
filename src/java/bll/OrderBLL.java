/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bll;

import entity.Account;
import entity.Order;
import java.util.List;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.Cookie;

public class OrderBLL {

    public void muaHang(Order order) {
        try {
            Context initContext = new InitialContext();
            Context envContext=(Context)initContext.lookup("java:comp/env");
            DataSource ds=(DataSource) envContext.lookup("jdbc/WEBBANHANG");
            Connection conn = ds.getConnection();
            Statement sttm = conn.createStatement();
            String sql = "INSERT INTO MUAHANG VALUES (N'"+
                    order.getTkKhachHang()+"',"+
                    order.getMSSP()+","+
                    order.getTkNVGH()+", getdate(), "+
                    order.getSoLuong()+",N'"+
                    order.getDiaChiGiaoHang()+"',"+
                    order.getThoiDiemGiaoHang()+","+
                    order.getThoiHanBaoHanh()+",N'"+
                    order.getTrangThai()+"');";
            ResultSet rs = sttm.executeQuery(sql);
        } 
        catch (SQLException | NamingException ex) {
            System.err.println(ex);
        }
        try {
            Context initContext = new InitialContext();
            Context envContext=(Context)initContext.lookup("java:comp/env");
            DataSource ds=(DataSource) envContext.lookup("jdbc/WEBBANHANG");
            Connection conn = ds.getConnection();
            Statement sttm = conn.createStatement();
            String sql = "UPDATE SANPHAM SET SOLUONG=SOLUONG-"+Integer.toString(order.getSoLuong())+" WHERE MSSP="+order.getMSSP()+";";
            ResultSet rs = sttm.executeQuery(sql);
        } 
        catch (SQLException | NamingException ex) {
            System.err.println(ex);
        }
        
    }
    
    public List<Order> layLichSuMuaHang(String tkKhachHang) {
        try {
            Context initContext = new InitialContext();
            Context envContext=(Context)initContext.lookup("java:comp/env");
            DataSource ds=(DataSource) envContext.lookup("jdbc/WEBBANHANG");
            Connection conn = ds.getConnection();
            Statement sttm = conn.createStatement();
            String sql = "SELECT * FROM MUAHANG WHERE TKKHACHHANG=N'"+tkKhachHang+"' ORDER BY THOIDIEMMUA DESC";
            
            ResultSet rs = sttm.executeQuery(sql);
            ArrayList<Order> prods = new ArrayList<>();
            while (rs.next()) {
                Order order = new Order();
                order.setTkKhachHang(rs.getString("TKKHACHHANG"));
                order.setMSSP(rs.getInt("MSSP"));
                order.setTkNVGH(rs.getString("TKNVGH"));
                order.setThoiDiemMua(rs.getString("THOIDIEMMUA"));
                order.setSoLuong(rs.getInt("SOLUONG"));
                order.setDiaChiGiaoHang(rs.getString("DIACHIGIAOHANG"));
                order.setThoiDiemGiaoHang(rs.getString("THOIDIEMGIAOHANG"));
                order.setThoiHanBaoHanh(rs.getString("THOIHANBAOHANH"));
                order.setTrangThai(rs.getString("TRANGTHAI"));                
                if (order.getTkNVGH()==null)
                    order.setTkNVGH("Không rõ");
                if (order.getThoiDiemGiaoHang()==null)
                    order.setThoiDiemGiaoHang("Không rõ");
                if (order.getThoiHanBaoHanh()==null)
                    order.setThoiHanBaoHanh("Không rõ");
                prods.add(order);
            }
            return prods;
        } catch (SQLException | NamingException ex) {
            System.err.println(ex);
        }
        return null;
    }
}
