import 'package:get/get.dart';

import 'package:fade_transition/app/modules/home/bindings/home_binding.dart';
import 'package:fade_transition/app/modules/home/views/home_view.dart';
import 'package:fade_transition/app/modules/widget/bindings/widget_binding.dart';
import 'package:fade_transition/app/modules/widget/views/widget_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.WIDGET,
      page: () => WidgetView(),
      binding: WidgetBinding(),
    ),
  ];
}
