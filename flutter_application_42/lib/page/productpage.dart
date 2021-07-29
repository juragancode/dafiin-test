import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Product"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Get.toNamed('/product/1?name=Jaket&ukuran=L'),
              child: Text("Product 1"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => Get.toNamed(
                '/product/2?name=Sepatu&ukuran=42',
              ),
              child: Text("Product 2"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => Get.toNamed('/product/3?name=Kaos Kaki&ukuran=10'),
              child: Text("Product 3"),
            ),
          ],
        ),
      ),
    );
  }
}
