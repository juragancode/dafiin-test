import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  late AnimationController aniC;

  late Animation<double> animation = CurvedAnimation(
    parent: aniC,
    curve: Curves.easeIn,
  );

  @override
  void onInit() {
    aniC = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    super.onInit();
  }

  @override
  void onClose() {
    aniC.dispose();
    super.onClose();
  }
}
