/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bll;

import entity.Product;
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

public class ProductBLL {

    public List<Product> laySanPhamMoi(int number) {
        try {
            Context initContext = new InitialContext();
            Context envContext=(Context)initContext.lookup("java:comp/env");
            DataSource ds=(DataSource) envContext.lookup("jdbc/WEBBANHANG");
            Connection conn = ds.getConnection();
            Statement sttm = conn.createStatement();
            String sql = "Select * from SANPHAM";
            ResultSet rs = sttm.executeQuery(sql);
            ArrayList<Product> prods = new ArrayList<>();
            while (rs.next() && number-->0) {
                Product p = new Product();
                p.setMSSP(rs.getInt("MSSP"));
                p.setTenSanPham(rs.getString("TENSANPHAM"));
                p.setLoai(rs.getString("LOAI"));
                p.setGia(rs.getInt("GIA"));
                p.setSoLuong(rs.getInt("SOLUONG"));
                p.setNgaySX(rs.getString("NGAYSX"));
                p.setHang(rs.getString("HANG"));
                p.setQuocGia(rs.getString("QUOCGIA"));
                p.setMoTa(rs.getString("MOTA"));
                prods.add(p);
            }
            return prods;
        } catch (SQLException | NamingException ex) {
            System.err.println(ex);
        }
        return null;
    }
    
    public List<Product> timKiemSanPham(String loaiSanPham) {
        try {
            Context initContext = new InitialContext();
            Context envContext=(Context)initContext.lookup("java:comp/env");
            DataSource ds=(DataSource) envContext.lookup("jdbc/WEBBANHANG");
            Connection conn = ds.getConnection();
            Statement sttm = conn.createStatement();
            String sql = "Select * from SANPHAM where LOAI=N'"+loaiSanPham+"'";
            if ("All".equals(loaiSanPham))
                sql = "Select * from SANPHAM";
            else if ("Quần áo".equals(loaiSanPham))
                sql = "Select * from SANPHAM where LOAI in (N'Áo cộc',N'Áo vest',N'Quần dài',N'Quần cộc',N'Quần áo thể thao',N'Quần áo mùa đông',N'Quần áo lót')";
            else if ("Giày dép".equals(loaiSanPham))
                sql = "Select * from SANPHAM where LOAI in (N'Dép',N'Giày nam',N'Giày nữ')";
            else if ("Mũ nón".equals(loaiSanPham))
                sql = "Select * from SANPHAM where LOAI in (N'Mũ lưỡi trai',N'Mũ rộng vành',N'Nón lá')";
            else if ("Đồ mùa đông".equals(loaiSanPham))
                sql = "Select * from SANPHAM where LOAI in (N'Quần áo mùa đông',N'Tất',N'Khăn')";
            
            ResultSet rs = sttm.executeQuery(sql);
            ArrayList<Product> prods = new ArrayList<>();
            while (rs.next()) {
                Product p = new Product();
                p.setMSSP(rs.getInt("MSSP"));
                p.setTenSanPham(rs.getString("TENSANPHAM"));
                p.setLoai(rs.getString("LOAI"));
                p.setGia(rs.getInt("GIA"));
                p.setSoLuong(rs.getInt("SOLUONG"));
                p.setNgaySX(rs.getString("NGAYSX"));
                p.setHang(rs.getString("HANG"));
                p.setQuocGia(rs.getString("QUOCGIA"));
                p.setMoTa(rs.getString("MOTA"));
                if (rs.getString("ANH")!=null)
                    p.setAnh(rs.getString("ANH"));
                prods.add(p);
            }
            return prods;
        } catch (SQLException | NamingException ex) {
            System.err.println(ex);
        }
        return null;
    }
}
