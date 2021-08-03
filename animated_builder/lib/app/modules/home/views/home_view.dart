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
        child: AnimatedBuilder(
          animation: controller.animationC,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.blue]),
              border: Border.all(color: Colors.purple, width: 3),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Icon(
                Icons.ac_unit,
                color: Colors.cyan,
                size: 100,
              ),
            ),
          ),
          builder: (_, ch) {
            return Transform.scale(
              scale: controller.animationC.value * 2.0,
              child: ch,
            );
          },
        ),
      ),
    );
  }
}
