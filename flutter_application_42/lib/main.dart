import 'package:flutter/material.dart';
import 'package:flutter_application_42/page/detail.dart';
import 'package:flutter_application_42/page/homepage.dart';
import 'package:flutter_application_42/page/productpage.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(),
        ),
        GetPage(
          name: '/product',
          page: () => ProductPage(),
        ),
        GetPage(
          name: '/product/:id?',
          page: () => DetailPage(),
        ),
      ],
    );
  }
}
