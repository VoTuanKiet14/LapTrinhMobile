import '../models/dien_thoai.dart';
import '../models/cua_hang.dart';
import '../models/hoa_don.dart';

class Test {
  // Thuộc tính lưu trữ cửa hàng
  final CuaHang cuaHang = CuaHang("Cửa hàng bán điện thoại", "TP.HCM");

  //test quan ly dien thoai
  void testQuanLyDienThoai() {
    print("\n------------------------- Test Quản lý Điện Thoại ----------------------------------------------");

    // Thêm điện thoại mới
    try {
      var dt1 = DienThoai("DT-001", "Redmi note 14", "Xiaomi", 10000000, 15000000, 20, true);
      var dt2 = DienThoai("DT-002", "Iphone 18", "Samsung", 37000000, 40000000, 10, true);
      var dt3 = DienThoai("DT-003", "Samsung", "Samsung", 10000000, 15000000, 7, true);
      cuaHang.themDienThoai(dt1);
      cuaHang.themDienThoai(dt2);
      cuaHang.themDienThoai(dt3);

      print("\n++Thêm điện thoại thành công! Thông tin các điện thoại vừa thêm:");
      cuaHang.hienThiDanhSachDienThoai();
    } catch (e) {
      print("Lỗi khi thêm điện thoại: $e");
    }

    // Cập nhật thông tin điện thoại
    try {
      var doiThongTinDienThoai = cuaHang.timKiemDienThoaiTheoMa("DT-001").first;
      doiThongTinDienThoai.tenDienThoai = "Redmi note 15";
      doiThongTinDienThoai.giaNhap = 22000000; // Giá nhập mới
      print("\n++Cập nhật thông tin thành công!Thông tin sau khi cập nhật: ");
      cuaHang.hienThiDanhSachDienThoai();
    } catch (e) {
      print("Lỗi khi cập nhật thông tin điện thoại: $e");
    }

    // Kiểm tra validation
    print('\nKiểm tra validation');
    try {
      var dt4 = DienThoai("", "", "", 500, 500, 10, false);
      cuaHang.themDienThoai(dt4);
      cuaHang.hienThiDanhSachDienThoai();
    } catch (e) {
      print("Validation: $e");
    }
  }

  //Test quản lý hóa đơn
  void testQuanLyHoaDon() {
    print("\n------------------------- Test Quản lý Hóa Đơn ----------------------------------------------");

    // Tạo hóa đơn hợp lệ
    try {
      var dt1 = cuaHang.timKiemDienThoaiTheoMa("DT-001").first;
      cuaHang.taoHoaDon(HoaDon("HD-001", DateTime(2024, 11, 25), dt1, 2, 25000000, "Nguyen Van A", "0123456789"));
      print("Hóa đơn hợp lệ được thêm thành công!");
      cuaHang.hienThiDanhSachHoaDon();
    } catch (e) {
      print("Lỗi khi thêm hóa đơn: $e");
    }

    // Tạo hóa đơn không hợp lệ (tồn kho không đủ)
    try {
      var dt2 = cuaHang.timKiemDienThoaiTheoMa("DT-002").first;
      cuaHang.taoHoaDon(HoaDon("HD-002", DateTime(2024, 11, 26), dt2, 10, 18000, "Nguyen Van B", "0987654321"));
    } catch (e) {
      print("Validation tồn kho hoạt động: $e");
    }

    // Tính toán tiền và lợi nhuận
    try {
      var tongTien = cuaHang.tinhTongDoanhThu(DateTime(2024, 11, 24), DateTime(2024, 11, 26));
      var loiNhuan = cuaHang.tinhTongLoiNhuan(DateTime(2024, 11, 24), DateTime(2024, 11, 26));
      print("Tổng doanh thu: $tongTien");
      print("Tổng lợi nhuận: $loiNhuan");
    } catch (e) {
      print("Lỗi khi tính toán: $e");
    }
  }
  
  //Test thông kê báo cáo
  void testThongKeBaoCao() {
    print("\n--- Test Thống Kê Báo Cáo ---");

    // Doanh thu theo thời gian
    var doanhThu = cuaHang.tinhTongDoanhThu(DateTime(2024, 11, 24), DateTime(2024, 11, 26));
    print("Doanh thu từ 24/11/2024 đến 26/11/2024: $doanhThu");

    // Lợi nhuận theo thời gian
    var loiNhuan = cuaHang.tinhTongLoiNhuan(DateTime(2024, 11, 24), DateTime(2024, 11, 26));
    print("Lợi nhuận từ 24/11/2024 đến 26/11/2024: $loiNhuan");

    // Thống kê top bán chạy
    var topBanChay = cuaHang.thongKeBanChay();
    print("Top điện thoại bán chạy:");
    topBanChay.forEach((ma, sl) {
      print("Mã điện thoại: $ma, Số lượng: $sl");
    });

    // Báo cáo tồn kho
    
    print("Báo cáo tồn kho:");
    cuaHang.thongKeTonKho();
  }
}

void main() {
  print("\n=== BẮT ĐẦU KIỂM THỬ ===");
  Test test = Test();

  test.testQuanLyDienThoai();
  test.testQuanLyHoaDon();
  test.testThongKeBaoCao();
  print("\n=== KẾT THÚC KIỂM THỬ ===");
}
