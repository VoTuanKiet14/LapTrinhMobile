
import 'Sach.dart';

class DocGia {
  String _maDG;
  String _hoTen;
  List<Sach> danhSachSachMuon = [];

  DocGia(this._maDG, this._hoTen);

  // Getter và Setter
  String get maDG => _maDG;
  set maDG(String maDG) {
    if (maDG.isNotEmpty) {
      _maDG = maDG;
    }
  }

  String get hoTen => _hoTen;
  set hoTen(String hoTen) {
    if (hoTen.isNotEmpty) {
      _hoTen = hoTen;
    }
  }

  // Phương thức mượn sách
  void muonSach(Sach sach) {
    if (sach.trangThaiMuon) {
      print('Sách ${sach.tenSach} đã có người mượn');
      return;
    }
    danhSachSachMuon.add(sach);
    sach.trangThaiMuon = true;
    print('Đã mượn sách: ${sach.tenSach}');
  }

  // Phương thức trả sách
  void traSach(Sach sach) {
    if (danhSachSachMuon.contains(sach)) {
      danhSachSachMuon.remove(sach);
      sach.trangThaiMuon = false;
      print('Đã trả sách: ${sach.tenSach}');
    } else {
      print('Sách ${sach.tenSach} không có trong danh sách mượn');
    }
  }
}
