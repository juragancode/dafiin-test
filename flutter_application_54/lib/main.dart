import 'package:flutter/material.dart';
import 'package:flutter_application_54/controller/auth.dart';
import 'package:flutter_application_54/controller/controller.dart';
import 'package:flutter_application_54/pages/home.dart';
import 'package:flutter_application_54/pages/login.dart';
import 'package:flutter_application_54/routes/approute.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final loginC = Get.put(LoginC());
  final authC = Get.put(AuthC());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: authC.isAuth.isTrue ? HomePage() : LoginPage(),
        getPages: AppPage.pages,
      ),
    );
  }
}
