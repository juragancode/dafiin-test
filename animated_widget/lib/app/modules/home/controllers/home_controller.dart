import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  late AnimationController aniC;

  @override
  void onInit() {
    aniC = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat(
        reverse: true,
      );
    super.onInit();
  }

  @override
  void onClose() {
    aniC.dispose();
    super.onClose();
  }
}
