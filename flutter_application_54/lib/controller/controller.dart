import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginC extends GetxController {
  var hidden = true.obs;
  var remeberme = false.obs;
  late TextEditingController emailC;
  late TextEditingController passC;

  void checkData() async {
    final box = GetStorage();
    if (box.read("dataUser") != null) {
      final data = box.read("dataUser") as Map<String, dynamic>;
      emailC.text = data["email"];
      passC.text = data["password"];
      remeberme.value = data["rememberme"];
    }
  }

  @override
  void onInit() async {
    super.onInit();
    emailC = TextEditingController();
    passC = TextEditingController();
    checkData();
  }

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    super.onClose();
  }
}
