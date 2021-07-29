import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product ID ${Get.parameters['id']}"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Product Name ${Get.parameters['name']}"),
            Text("Product Ukuran ${Get.parameters['ukuran']}")
          ],
        ),
      ),
    );
  }
}
