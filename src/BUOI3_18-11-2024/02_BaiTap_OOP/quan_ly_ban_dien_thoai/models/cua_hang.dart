import 'dien_thoai.dart';
import 'hoa_don.dart';

class CuaHang {
  String _tenCuaHang;
  String _diaChi;
  List<DienThoai> _danhSachDienThoai = [];
  List<HoaDon> _danhSachHoaDon = [];

  // Constructor
  CuaHang(this._tenCuaHang, this._diaChi);

  // Getter và Setter
  String get tenCuaHang => _tenCuaHang;
  set tenCuaHang(String tenCuaHang) => _tenCuaHang = tenCuaHang;

  String get diaChi => _diaChi;
  set diaChi(String diaChi) => _diaChi = diaChi;

  List<DienThoai> get danhSachDienThoai => _danhSachDienThoai;
  List<HoaDon> get danhSachHoaDon => _danhSachHoaDon;

  // Phương thức quản lý điện thoại
  void themDienThoai(DienThoai dienThoai) {
    if(dienThoai.coTheBan()){
      _danhSachDienThoai.add(dienThoai);
    }else{
      throw Exception('Không thể thêm điện thoại ${dienThoai.tenDienThoai}: Không hợp lệ hoặc không thể bán');
    }
  }

  void capNhatDienThoai(String maDienThoai, DienThoai dienThoaiCapNhat) {
    for (var i = 0; i < _danhSachDienThoai.length; i++) {
      if (_danhSachDienThoai[i].maDienThoai == maDienThoai) {
        _danhSachDienThoai[i] = dienThoaiCapNhat;
        return;
      }
    }
    throw ArgumentError("Không tìm thấy điện thoại với mã: $maDienThoai");
  }

  void ngungKinhDoanhDienThoai(String maDienThoai) {
    for (var i = 0; i < _danhSachDienThoai.length; i++) {
      if (_danhSachDienThoai[i].maDienThoai == maDienThoai) {
        _danhSachDienThoai[i].trangThai = false;
        return;
      }
    }
    throw ArgumentError("Không tìm thấy điện thoại với mã: $maDienThoai");
  }

  List<DienThoai> timKiemDienThoaiTheoMa(String maDienThoai) {
    return _danhSachDienThoai
        .where((dienThoai) => dienThoai.maDienThoai == maDienThoai)
        .toList();
  }

  List<DienThoai> timKiemDienThoaiTheoTen(String tenDienThoai) {
    return _danhSachDienThoai
        .where((dienThoai) => dienThoai.tenDienThoai == tenDienThoai)
        .toList();
  }

  List<DienThoai> timKiemDienThoaiTheoHang(String hangSanXuat) {
    return _danhSachDienThoai
        .where((dienThoai) => dienThoai.hangSanXuat == hangSanXuat)
        .toList();
  }

  void hienThiDanhSachDienThoai() {
    for (var dienThoai in _danhSachDienThoai) {
      print(
          "Mã điện thoại: ${dienThoai.maDienThoai}, Tên: ${dienThoai.tenDienThoai}, Hãng: ${dienThoai.hangSanXuat}, Giá nhập: ${dienThoai.giaNhap}, Giá bán: ${dienThoai.giaBan}, Số lượng tồn kho: ${dienThoai.soLuongTonKho}, Trạng thái: ${dienThoai.trangThai ? 'Còn kinh doanh' : 'Ngừng kinh doanh'}");
    }
  }

  // Phương thức quản lý hóa đơn
  void taoHoaDon(HoaDon hoaDon) {
    _danhSachHoaDon.add(hoaDon);
    for (var i = 0; i < _danhSachDienThoai.length; i++) {
      if (_danhSachDienThoai[i].maDienThoai == hoaDon.dienThoai.maDienThoai) {
        _danhSachDienThoai[i].soLuongTonKho -= hoaDon.soLuongMua;
        return;
      }
    }
    throw ArgumentError(
        "Không tìm thấy điện thoại với mã: ${hoaDon.dienThoai.maDienThoai}");
  }

  List<HoaDon> timKiemHoaDonTheoMa(String maHoaDon) {
    return _danhSachHoaDon
        .where((hoaDon) => hoaDon.maHoaDon == maHoaDon)
        .toList();
  }

  List<HoaDon> timKiemHoaDonTheoNgay(DateTime ngay) {
    return _danhSachHoaDon.where((hoaDon) => hoaDon.ngayBan == ngay).toList();
  }

  List<HoaDon> timKiemHoaDonTheoKhachHang(String tenKhachHang) {
    return _danhSachHoaDon
        .where((hoaDon) => hoaDon.tenKhachHang == tenKhachHang)
        .toList();
  }

  void hienThiDanhSachHoaDon() {
    for (var hoaDon in _danhSachHoaDon) {
      hoaDon.hienThiThongTin();
    }
  }

  // Phương thức thống kê
  double tinhTongDoanhThu(DateTime tuNgay, DateTime denNgay) {
    return _danhSachHoaDon
        .where((hoaDon) =>
            hoaDon.ngayBan.isAfter(tuNgay) && hoaDon.ngayBan.isBefore(denNgay))
        .fold(0, (tong, hoaDon) => tong + hoaDon.tinhTongTien());
  }

  double tinhTongLoiNhuan(DateTime tuNgay, DateTime denNgay) {
    return _danhSachHoaDon
        .where((hoaDon) =>
            hoaDon.ngayBan.isAfter(tuNgay) && hoaDon.ngayBan.isBefore(denNgay))
        .fold(0, (tong, hoaDon) => tong + hoaDon.tinhLoiNhuanThucTe());
  }

  void thongKeTonKho() {
    for (var dienThoai in _danhSachDienThoai) {
      print(
          "Mã điện thoại: ${dienThoai.maDienThoai}, Tồn kho: ${dienThoai.soLuongTonKho}");
    }
  }

  // Phương thức thống kê top bán chạy
  Map<String, int> thongKeBanChay() {
    Map<String, int> thongKe = {};
    for (var hd in _danhSachHoaDon) {
      String maDienThoai = hd.dienThoai.maDienThoai;
      thongKe[maDienThoai] = (thongKe[maDienThoai] ?? 0) + hd.soLuongMua;
    }
    var topBanChay = thongKe.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return Map.fromEntries(topBanChay);
  }
}
