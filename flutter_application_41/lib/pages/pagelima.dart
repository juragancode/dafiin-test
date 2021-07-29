import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageLima extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Lima"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("<<< Previous Page")),
          ],
        ),
      ),
    );
  }
}
