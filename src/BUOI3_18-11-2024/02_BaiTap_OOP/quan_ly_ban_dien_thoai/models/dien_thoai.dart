class DienThoai {
  // Thuộc tính private
  String _maDienThoai;
  String _tenDienThoai;
  String _hangSanXuat;
  double _giaNhap;
  double _giaBan;
  int _soLuongTonKho;
  bool _trangThai;

  // Constructor đầy đủ tham số
  DienThoai(this._maDienThoai, this._tenDienThoai, this._hangSanXuat, this._giaNhap, this._giaBan, this._soLuongTonKho, this._trangThai,);

  // Getters  Setters validation 
  String get maDienThoai => _maDienThoai;
  set maDienThoai(String maDienThoai) => _maDienThoai = 
    (maDienThoai.isNotEmpty && RegExp(r'^DT-\d{3}$').hasMatch(maDienThoai))
      ? maDienThoai
      : throw ArgumentError("Mã điện thoại phải có định dạng 'DT-XXX'.");

  String get tenDienThoai => _tenDienThoai;
  set tenDienThoai(String tenDienThoai) => _tenDienThoai =
    tenDienThoai.isNotEmpty
      ? tenDienThoai
      : throw ArgumentError("Tên điện thoại không được rỗng.");

  String get hangSanXuat => _hangSanXuat;
  set hangSanXuat(String hangSanXuat) => _hangSanXuat =
    hangSanXuat.isNotEmpty
      ? hangSanXuat
      : throw ArgumentError("Hãng sản xuất không được rỗng.");

  double get giaNhap => _giaNhap;
  set giaNhap(double giaNhap) => _giaNhap =
    giaNhap > 0
      ? giaNhap
      : throw ArgumentError("Giá nhập phải lớn hơn 0.");

  double get giaBan => _giaBan;
  set giaBan(double giaBan) => _giaBan =
    giaBan > _giaNhap
      ? giaBan
      : throw ArgumentError("Giá bán phải lớn hơn giá nhập.");

  int get soLuongTonKho => _soLuongTonKho;
  set soLuongTonKho(int soLuongTonKho) => _soLuongTonKho =
    soLuongTonKho >= 0
      ? soLuongTonKho
      : throw ArgumentError("Số lượng tồn kho phải lớn hơn hoặc bằng 0.");

  bool get trangThai => _trangThai;
  set trangThai(bool trangThai) => _trangThai = trangThai;

  // Phương thức tính lợi nhuận dự kiến
  double tinhLoiNhuanDuKien() {
    return _giaBan - _giaNhap;
  }

  // hiển thị thông tin
  void hienThiThongTin() {
    print("Mã điện thoại: $_maDienThoai");
    print("Tên điện thoại: $_tenDienThoai");
    print("Hãng sản xuất: $_hangSanXuat");
    print("Giá nhập: $_giaNhap");
    print("Giá bán: $_giaBan");
    print("Số lượng tồn kho: $_soLuongTonKho");
    print("Trạng thái: ${_trangThai ? 'Còn kinh doanh' : 'Ngừng kinh doanh'}");
  }

  // Phương thức kiểm tra có thể bán không 
  bool coTheBan() {
    return _soLuongTonKho > 0 && _trangThai;
  }
}
