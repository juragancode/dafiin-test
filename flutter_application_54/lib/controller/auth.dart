import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthC extends GetxController {
  var isAuth = false.obs;

  Map<String, String> _dataUser = {
    'email': 'admin@gmail.com',
    'password': 'admin',
  };

  void dialogError(String msg) {
    Get.defaultDialog(title: "Terjadi Kesalahan", middleText: msg);
  }

  Future<void> autologin() async {
    final box = GetStorage();
    if (box.read("dataUser") != null) {
      final data = box.read("dataUser") as Map<String, dynamic>;
      login(data["email"], data["password"], data["rememberme"]);
    }
  }

  void login(String email, String pass, bool rememberme) async {
    if (email != '' && pass != '') {
      if (GetUtils.isEmail(email)) {
        if (email == _dataUser['email'] && pass == _dataUser['password']) {
          if (rememberme) {
            final box = GetStorage();
            box.write(
              'dataUser',
              {
                "email": email,
                "password": pass,
                "rememberme": rememberme,
              },
            );
          } else {
            final box = GetStorage();
            if (box.read('dataUser') != null) {
              box.erase();
            }
          }
          isAuth.value = true;
        } else {
          dialogError("Email atau Password salah");
        }
      } else {
        dialogError("Email yang anda masukan tidak valid");
      }
    } else {
      dialogError("Email dan Password harus diisi dengan benar");
    }
  }

  void logout(bool rememberme) {
    if (rememberme == false) {
      final box = GetStorage();
      if (box.read('dataUser') != null) {
        box.erase();
      }
    }
    isAuth.value = false;
  }
}
