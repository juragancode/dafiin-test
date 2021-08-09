import 'dart:io';

import 'package:dart_contoh_1/persegi-panjang.dart';

void main(List<String> arguments) {
  PersegiPanjang kotak1, kotak2;
  double luasKotak1;

  kotak1 = PersegiPanjang();
  kotak1.setPanjang(5);
  kotak1.lebar = -3;

  kotak2 = PersegiPanjang();
  kotak2.setPanjang(double.tryParse(stdin.readLineSync()));
  kotak2.lebar = double.tryParse(stdin.readLineSync());

  luasKotak1 = kotak1.luas;

  print(luasKotak1 + kotak2.luas);
  print(kotak1.getPanjang());
  print(kotak1.lebar);
}
