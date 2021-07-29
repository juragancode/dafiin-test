import 'package:get/get.dart';
import 'package:flutter_application_38/models/orang.dart';

class OrangController extends GetxController {
  var orang = Orang(nama: "bajri", umur: 24).obs;

  void changeUpperCase() {
    orang.update((val) {
      orang.value.nama = orang.value.nama.toString().toUpperCase();
    });
  }

  void changeLowerCase() {
    orang.update((val) {
      orang.value.nama = orang.value.nama.toString().toLowerCase();
    });
  }
}
