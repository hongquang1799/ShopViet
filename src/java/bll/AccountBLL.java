/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bll;

import entity.Account;
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

public class AccountBLL {

    public void taoTaiKhoan(Account acc) {
        try {
            Context initContext = new InitialContext();
            Context envContext=(Context)initContext.lookup("java:comp/env");
            DataSource ds=(DataSource) envContext.lookup("jdbc/WEBBANHANG");
            Connection conn = ds.getConnection();
            Statement sttm = conn.createStatement();
            String sql = "insert into NGUOIDUNG values (N'"
                    + acc.getTenTaiKhoan()+"',N'"
                    + acc.getMatKhau()+"',N'"
                    + acc.getHoTen()+"','"
                    + acc.getNgaySinh()+"',N'"
                    + acc.getDiaChi()+"','"
                    + acc.getSDT()+"',N'"
                    + acc.getEmail()+"','"
                    + acc.getCMND()+"',CAST(GETDATE() AS DATE),N'"
                    + acc.getLoai()+"');";
            ResultSet rs = sttm.executeQuery(sql);
        } 
        catch (SQLException | NamingException ex) {
            System.err.println(ex);
        }
    }
    
    public int checkTenTaiKhoan(String name) {
        try {
            Context initContext = new InitialContext();
            Context envContext=(Context)initContext.lookup("java:comp/env");
            DataSource ds=(DataSource) envContext.lookup("jdbc/WEBBANHANG");
            Connection conn = ds.getConnection();
            Statement sttm = conn.createStatement();
            String sql = "select * from NGUOIDUNG where TENTAIKHOAN=N'"+name+"'";
            ResultSet rs = sttm.executeQuery(sql);
            if (rs.next()) {
                return 1;
            }
            else return 0;
        } 
        catch (SQLException | NamingException ex) {
            System.err.println(ex);
        }
        return 0;
    }
    
    public int checkDangNhap(String tenTaiKhoan,String matKhau) {
        try {
            Context initContext = new InitialContext();
            Context envContext=(Context)initContext.lookup("java:comp/env");
            DataSource ds=(DataSource) envContext.lookup("jdbc/WEBBANHANG");
            Connection conn = ds.getConnection();
            Statement sttm = conn.createStatement();
            String sql = "select * from NGUOIDUNG where TENTAIKHOAN=N'"
                    +tenTaiKhoan+"' and MATKHAU=N'"
                    +matKhau+"'";
            ResultSet rs = sttm.executeQuery(sql);
            if (rs.next()) {
                return 1;
            }
            else return 0;
        } 
        catch (SQLException | NamingException ex) {
            System.err.println(ex);
        }
        return 0;
    }
}
