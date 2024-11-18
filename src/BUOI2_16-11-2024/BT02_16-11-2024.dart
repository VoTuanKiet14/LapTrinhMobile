import 'dart:io';
import 'dart:math';

void main() {
  double? a, b, c;

  // Nhập hệ số a và kiểm tra tính hợp lệ
  do {
    print('Nhập hệ số a:');
    String? input = stdin.readLineSync();
    a = double.tryParse(input!);
    if (a == null) {
      print('Hãy Nhập 1 Con số. Vui Lòng Nhập Lại');
    }
  } while (a == null);

  // Nhập hệ số b và kiểm tra tính hợp lệ
  do {
    print('Nhập hệ số b:');
    String? input = stdin.readLineSync();
    b = double.tryParse(input!);
    if (b == null) {
      print('Hãy Nhập 1 Con số. Vui Lòng Nhập Lại');
    }
  } while (b == null);

  // Nhập hệ số c và kiểm tra tính hợp lệ
  do {
    print('Nhập hệ số c:');
    String? input = stdin.readLineSync();
    c = double.tryParse(input!);
    if (c == null) {
      print('Hãy Nhập 1 Con số. Vui Lòng Nhập Lại');
    }
  } while (c == null);

  // Tính delta
  double delta = b * b - 4 * a * c;

  // Kiểm tra các trường hợp của delta
  if (delta < 0) {
    print('Phương trình vô nghiệm');
  } else if (delta == 0) {
    double x = -b / (2 * a);
    print('Phương trình có nghiệm kép: x = $x');
  } else {
    double x1 = (-b + sqrt(delta)) / (2 * a);
    double x2 = (-b - sqrt(delta)) / (2 * a);
    print('Phương trình có hai nghiệm phân biệt: x1 = $x1 và x2 = $x2');
  }
}
