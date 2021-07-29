import 'package:flutter/material.dart';
import 'package:flutter_application_41/routes/routename.dart';
import 'package:get/get.dart';

class PageTiga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Tiga"),
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
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(RouteName.page_4);
                },
                child: Text("Next Page >>>"))
          ],
        ),
      ),
    );
  }
}
