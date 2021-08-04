import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with SingleGetTickerProviderMixin {
  late AnimationController aniC;

  late Animation<double> animation = CurvedAnimation(
    parent: aniC,
    curve: Curves.easeIn,
  );
  late final Animation<Offset> offsetAnimation = Tween<Offset>(
    begin: Offset(0, -40),
    end: Offset(0, 40),
  ).animate(CurvedAnimation(
    parent: aniC,
    curve: Curves.fastOutSlowIn,
  ));

  @override
  void onInit() {
    aniC = AnimationController(
      duration: const Duration(seconds: 2),
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
