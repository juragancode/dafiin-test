import 'package:flutter/material.dart';
import 'package:flutter_application_40/controller/my_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final myC = Get.put(MyController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Field"),
        actions: [
          IconButton(
            onPressed: ()=> myC.reset(),
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                "Terjadi: ${myC.count}",
                style: TextStyle(fontSize: 25),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            TextField(
              onChanged: (_) => myC.change(),
              decoration: InputDecoration(border: OutlineInputBorder()),
            )
          ],
        )),
      ),
    );
  }
}
