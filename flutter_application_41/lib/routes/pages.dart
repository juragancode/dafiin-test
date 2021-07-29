import 'package:flutter_application_41/routes/routename.dart';
import 'package:get/get.dart';
import 'package:flutter_application_41/pages/pagedua.dart';
import 'package:flutter_application_41/pages/pageempat.dart';
import 'package:flutter_application_41/pages/pagelima.dart';
import 'package:flutter_application_41/pages/pagesatu.dart';
import 'package:flutter_application_41/pages/pagetiga.dart';

class AppPage {
  static final pages = [
    GetPage(
      name: RouteName.page_1,
      page: () => PageSatu(),
    ),
    GetPage(
      name: RouteName.page_2,
      page: () => PageDua(),
    ),
    GetPage(
      name: RouteName.page_3,
      page: () => PageTiga(),
    ),
    GetPage(
      name: RouteName.page_4,
      page: () => PageEmpat(),
    ),
    GetPage(
      name: RouteName.page_5,
      page: () => PageLima(),
    ),
  ];
}
