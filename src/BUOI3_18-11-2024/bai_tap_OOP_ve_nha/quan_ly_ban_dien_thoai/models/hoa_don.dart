import 'dien_thoai.dart';

class HoaDon {
  // Thuộc tính private
  String _maHoaDon;
  DateTime _ngayBan;
  DienThoai _dienThoai;
  int _soLuongMua;
  double _giaBanThucTe;
  String _tenKhachHang;
  String _soDienThoaiKhach;

  // Constructor 
  HoaDon(this._maHoaDon, this._ngayBan, this._dienThoai, this._soLuongMua, this._giaBanThucTe, this._tenKhachHang, this._soDienThoaiKhach); 

  // Getters Setters validation
  String get maHoaDon => _maHoaDon;
  set maHoaDon(String maHoaDon) => _maHoaDon =
      (maHoaDon.isNotEmpty && RegExp(r'^HD-\d{3}$').hasMatch(maHoaDon))
          ? maHoaDon
          : throw ArgumentError("Mã hóa đơn phải có định dạng 'HD-XXX'.");

  DateTime get ngayBan => _ngayBan;
  set ngayBan(DateTime ngayBan) => _ngayBan =
      (ngayBan.isBefore(DateTime.now()))
          ? ngayBan
          : throw ArgumentError("Ngày bán không được sau ngày hiện tại.");

  DienThoai get dienThoai => _dienThoai;
  
  int get soLuongMua => _soLuongMua;
  set soLuongMua(int soLuongMua) => _soLuongMua =
      (soLuongMua > 0 && soLuongMua <= _dienThoai.giaNhap)
          ? soLuongMua
          : throw ArgumentError("Số lượng mua phải lớn hơn 0 và nhỏ hơn hoặc bằng tồn kho.");

  double get giaBanThucTe => _giaBanThucTe;
  set giaBanThucTe(double giaBanThucTe) => _giaBanThucTe =
      (giaBanThucTe > 0)
          ? giaBanThucTe
          : throw ArgumentError("Giá bán thực tế phải lớn hơn 0.");

  String get tenKhachHang => _tenKhachHang;
  set tenKhachHang(String tenKhachHang) => _tenKhachHang =
      tenKhachHang.isNotEmpty
          ? tenKhachHang
          : throw ArgumentError("Tên khách hàng không được rỗng.");

  String get soDienThoaiKhach => _soDienThoaiKhach;
  set soDienThoaiKhach(String soDienThoaiKhach) => _soDienThoaiKhach =
      (soDienThoaiKhach.isNotEmpty && RegExp(r'^\d{10}$').hasMatch(soDienThoaiKhach))
          ? soDienThoaiKhach
          : throw ArgumentError("Số điện thoại khách phải đúng định dạng.");

  // Phương thức tính tổng tiền
  double tinhTongTien() {
    return _soLuongMua * _giaBanThucTe;
  }

  // Phương thức tính lợi nhuận thực tế
  double tinhLoiNhuanThucTe() {
    return (_giaBanThucTe - _dienThoai.giaNhap) * _soLuongMua;
  }

  // Phương thức hiển thị thông tin hóa đơn
  void hienThiThongTin() {
    print("Mã hóa đơn: $_maHoaDon");
    print("Ngày bán: $_ngayBan");
    print("Tên điện thoại: ${_dienThoai.tenDienThoai}");
    print("Số lượng mua: $_soLuongMua");
    print("Giá bán thực tế: $_giaBanThucTe");
    print("Tên khách hàng: $_tenKhachHang");
    print("Số điện thoại khách: $_soDienThoaiKhach");
  }
}
