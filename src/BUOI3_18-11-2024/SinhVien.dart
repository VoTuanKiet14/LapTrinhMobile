
//Lop Sinh Vien
class SinhVien {  
  String _hoTen;
  int _tuoi;
  String _maSV;
  double _diemTB;

  // Constructor
  SinhVien(this._hoTen, this._tuoi, this._maSV, this._diemTB);

  // Getters
  String get hoTen => _hoTen;

  // Setters
  set hoTen(String hoTen){
    if(hoTen.isNotEmpty){
      _hoTen = hoTen;
    }
  }

  // tuoi
  int get tuoi => tuoi;
  set tuoi(int tuoi){
    if(tuoi>=0){
      _tuoi = tuoi;
    }
  }
  // maSV
  String get maSV => maSV;
  set maSV(String maSV){
    if(maSV.isNotEmpty){
      _maSV = maSV;
    }
  }
  // diemTB
  double get diemTB => diemTB;
  set diemTB(double diemTB){
    if(diemTB >= 0 && diemTB <=10 ){
      _diemTB = diemTB;
    }
  }

  void hienThiThongTin(){
    print('Ho Ten: $_hoTen');
    print('Ho Ten: $_tuoi');
    print('Ho Ten: $_maSV');
    print('Ho Ten: $_diemTB');
  }

  String xepLoai(){
    if(_diemTB >= 8.5) return 'Gioi';
    if(_diemTB >= 6.5) return 'Kha';
    if(_diemTB >= 5.0) return 'Trung Binh';
    return 'Yeu';
  }
}

//Lop Hoc
class LopHoc{
  String _tenLop;
  List<SinhVien> _danhSachSV = [];
  LopHoc(this._tenLop);

  //Getters
  String get tenlop => _tenLop;
  List<SinhVien> get danhSachSV => _danhSachSV;

  //Setters
  set tenlop(String tenlop){
    if(tenlop.isNotEmpty){
      _tenLop = tenlop;
    }
  }
  // Them sinh vien
  void themSV(SinhVien sv) => _danhSachSV.add(sv);
  // Hien Thi Danh Sach Sinh vien
  void hienThiDSSV(){
    print('\n-------------------------------------');
    print('Danh sach sinh vien lop: $_tenLop');
    for(var sv in _danhSachSV){
      print('\n-------------------------------------');
      print('\n-------------------------------------');
      sv.hienThiThongTin();
      print('Xep loai: ${sv.xepLoai()}');
    }
  }
}
  //Test
  void main(){
    var sv = SinhVien('Nguyen Van A', 20, 'SV001', 8.5);
    print('Test getters: ${sv.hoTen}');
    sv.hoTen = 'Nguyen Van B';
    print('Sau khi setters: ${sv.hoTen}');
    print('Xep loai: ${sv.xepLoai()}');

    var lopHoc = LopHoc('21DTHD5');
    lopHoc.themSV(SinhVien('Nguyen Van A', 20, 'SV001', 8.5));
    lopHoc.themSV(SinhVien('Nguyen Van C', 21, 'SV002', 5.5));
    lopHoc.themSV(SinhVien('Nguyen Van D', 22, 'SV003', 7.5));
    lopHoc.themSV(SinhVien('Nguyen Van E', 23, 'SV004', 4.0));

    lopHoc.hienThiDSSV();
  }