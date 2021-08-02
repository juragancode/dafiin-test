import 'package:flutter/material.dart';
import 'package:flutter_application_53/bindings/binding.dart';
import 'package:flutter_application_53/home.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      initialBinding: BindingMy(),
    );
  }
}
