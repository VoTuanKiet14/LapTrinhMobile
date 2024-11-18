import 'dart:io';
void main(){
  //khai bao bien co ban 
  var ten = 'kiet';
  int tuoi = 25;// khai bao ro rang 

  // Su dung null safety
  String? tenNullable;
  tenNullable = null;

  // Su dung bien late 
  late String moTa;
  moTa = 'Lap Trinh Dart';

  // Su dung final va connst
  final String quocGia = 'VietNam';
  const int nam = 2024;

  // In gia tri bien
  print('Ten: $ten');
  print('Ten: $tuoi');
  print('Ten: $moTa');
  print('Ten: $quocGia');
  print('Ten: $nam');
  print('---------------------------------');

  // Kiem tra bien nullable
  int? soLuong;
  assert(soLuong==null);


  int a = 5;
  print(a++);
  print(++a);
  print(a--);
  print(--a);

  
}