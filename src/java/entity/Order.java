/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author user1
 */
public class Order {
    private String tkKhachHang;
    private int MSSP;
    private String tkNVGH;
    private String thoiDiemMua;
    private int soLuong;
    private String diaChiGiaoHang;
    private String thoiDiemGiaoHang;
    private String thoiHanBaoHanh;
    private String trangThai="Chưa giao hàng";

    public String getTkKhachHang() {
        return tkKhachHang;
    }

    public void setTkKhachHang(String tkKhachHang) {
        this.tkKhachHang = tkKhachHang;
    }

    public int getMSSP() {
        return MSSP;
    }

    public void setMSSP(int MSSP) {
        this.MSSP = MSSP;
    }

    public String getTkNVGH() {
        return tkNVGH;
    }

    public void setTkNVGH(String tkNVGH) {
        this.tkNVGH = tkNVGH;
    }

    public String getThoiDiemMua() {
        return thoiDiemMua;
    }

    public void setThoiDiemMua(String thoiDiemMua) {
        this.thoiDiemMua = thoiDiemMua;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public String getDiaChiGiaoHang() {
        return diaChiGiaoHang;
    }

    public void setDiaChiGiaoHang(String diaChiGiaoHang) {
        this.diaChiGiaoHang = diaChiGiaoHang;
    }

    public String getThoiDiemGiaoHang() {
        return thoiDiemGiaoHang;
    }

    public void setThoiDiemGiaoHang(String thoiDiemGiaoHang) {
        this.thoiDiemGiaoHang = thoiDiemGiaoHang;
    }

    public String getThoiHanBaoHanh() {
        return thoiHanBaoHanh;
    }

    public void setThoiHanBaoHanh(String thoiHanBaoHanh) {
        this.thoiHanBaoHanh = thoiHanBaoHanh;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }
    
}
