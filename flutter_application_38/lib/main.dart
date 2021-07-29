import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/orang_controller.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  final oc = Get.put(OrangController());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Obx(
            () => Text(
              "Nama Saya ${oc.orang.value.nama}",
              style: TextStyle(fontSize: 35),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          oc.changeUpperCase();
        }),
      ),
    );
  }
}
