// Thư Viện

import '../../../BUOI3_18-11-2024/quan_ly_sach/models/DocGia.dart';
import '../../../BUOI3_18-11-2024/quan_ly_sach/models/Sach.dart';

class ThuVien {

  List<Sach> _danhSachSach = [];
  List<DocGia> _danhSachDocGia = [];

  //getters
  List<Sach> get danhSachSach => _danhSachSach;
  List<DocGia> get danhSachDocGia => _danhSachDocGia;

  // Phương thức thêm sách 
  void themSach(Sach sach) { 
    _danhSachSach.add(sach); 
    print('Đã thêm sách: ${sach.tenSach}'); 
  } 
  // Phương thức thêm độc giả 
  void themDocGia(DocGia docGia) { 
    _danhSachDocGia.add(docGia); 
    print('Đã thêm độc giả: ${docGia.hoTen}'); 
  } 
  // Phương thức hiển thị danh sách sách 
  void hienThiDanhSachSach() { 
    print('Danh sách sách trong thư viện:'); 
    for (var sach in _danhSachSach) { 
      print('Mã sách: ${sach.maSach}, Tên sách: ${sach.tenSach}, Tác giả: ${sach.tacGia}, Trạng thái mượn: ${sach.trangThaiMuon ? "Đã mượn" : "Chưa mượn"}'); 
    }
  }
}

