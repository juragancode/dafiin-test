import 'package:flutter/material.dart';
import 'package:flutter_application_41/routes/routename.dart';
import 'package:get/get.dart';

class PageSatu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Satu"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(RouteName.page_2);
                },
                child: Text("Next Page >>>")),
          ],
        ),
      ),
    );
  }
}
