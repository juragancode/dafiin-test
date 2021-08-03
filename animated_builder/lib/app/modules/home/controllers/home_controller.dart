import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  late AnimationController animationC;

  @override
  void onInit() {
    animationC = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
    super.onInit();
  }

  @override
  void onClose() {
    animationC.dispose();
    super.onClose();
  }
}
