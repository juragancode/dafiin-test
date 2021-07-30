import 'package:flutter/material.dart';
import 'package:flutter_application_48/pages/shop.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home Page"),
            OutlinedButton(onPressed: () => Get.to(() => ShopPage()), child: Icon(Icons.arrow_forward_sharp))
          ],
        ),
      ),
    );
  }
}
