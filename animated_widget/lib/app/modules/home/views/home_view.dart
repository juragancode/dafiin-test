import 'package:animated_widget/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BoxSpinning(controller.aniC),
          ],
        ),
      ),
    );
  }
}

class BoxSpinning extends AnimatedWidget {
  final animation;
  
  BoxSpinning(this.animation) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      child: Transform.scale(
        scale: animation.value * 1,
        child: Center(
          child: GestureDetector(
            onTap: ()=> Get.toNamed(Routes.DETAIL),
            child: Container(height: 10, color: Colors.red,)),
        ),
      ),
      height: 300,
      width: 300,
      decoration: BoxDecoration(color: Colors.cyan),
    );
  }
}
