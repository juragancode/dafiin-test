import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  static const String _title = 'Animated Style';
  final ButtonStyle style = ElevatedButton.styleFrom(
      primary: Colors.green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      side: BorderSide(
        width: 2,
        color: Colors.pink,
      ),
      elevation: 10,
      minimumSize: Size(120, 60));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyWidget(controller: controller),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "SCAN",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.indigo,
                ),
              ),
              style: style,
            )
          ],
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      height: 400,
      width: 400,
      child: Center(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(50),
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Stack(
                  children: [
                    Image(
                      image: AssetImage('assets/border_side.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: FadeTransition(
                        opacity: controller.animation,
                        child: Image.asset('assets/QR-Code.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            Center(
              child: SlideTransition(
                position: controller.offsetAnimation,
                child: Container(
                  height: 5,
                  width: 400,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
