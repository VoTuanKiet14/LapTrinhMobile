
import '../models/Sach.dart';
import '../models/DocGia.dart';
import '../models/ThuVien.dart';
void main() {
  Sach sach1 = Sach('001', 'Lập trình Dart', 'Nguyễn Văn A');
  Sach sach2 = Sach('002', 'Lập trình Flutter', 'Nguyễn Văn B');

  DocGia docGia = DocGia('001', 'Nguyễn Văn A');

  ThuVien thuVien = ThuVien();

  thuVien.themSach(sach1);
  thuVien.themSach(sach2);

  thuVien.themDocGia(docGia);

  thuVien.hienThiDanhSachSach();

  docGia.muonSach(sach1);

  thuVien.hienThiDanhSachSach();

  docGia.traSach(sach1);

  thuVien.hienThiDanhSachSach();
}
