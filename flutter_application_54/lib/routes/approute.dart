import 'package:flutter_application_54/pages/home.dart';
import 'package:flutter_application_54/pages/login.dart';
import 'package:flutter_application_54/routes/routename.dart';
import 'package:get/get.dart';

class AppPage {
  static final pages = [
    GetPage(
      name: RouteName.home,
      page: () => HomePage(),
    ),
    GetPage(
      name: RouteName.login,
      page: () => LoginPage(),
    ),
  ];
}
