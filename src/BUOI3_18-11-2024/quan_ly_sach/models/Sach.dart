
class Sach {
  String _maSach;
  String _tenSach;
  String _tacGia;
  bool _trangThaiMuon;

  Sach(this._maSach, this._tenSach, this._tacGia, {bool? trangThaiMuon}): _trangThaiMuon = trangThaiMuon ?? false {}

  // Getter và Setter 
  String get maSach => _maSach;
  set maSach(String maSach) {
    if (maSach.isNotEmpty) {
      _maSach = maSach;
    }
  }

  String get tenSach => _tenSach;
  set tenSach(String tenSach) {
    if (tenSach.isNotEmpty) {
      _tenSach = tenSach;
    }
  }

  String get tacGia => _tacGia;
  set tacGia(String tacGia) {
    if (tacGia.isNotEmpty) {
      _tacGia = tacGia;
    }
  }

  bool get trangThaiMuon => _trangThaiMuon;
  set trangThaiMuon(bool trangThaiMuon) {
    _trangThaiMuon = trangThaiMuon;
  }

  // Phương thức hiển thị thông tin sách
  void hienThiThongTin() {
    print('Mã sách: $_maSach');
    print('Tên sách: $_tenSach');
    print('Tác giả: $_tacGia');
    print('Trạng thái mượn: ${_trangThaiMuon ? "Đã mượn" : "Chưa mượn"}');
  }
}

