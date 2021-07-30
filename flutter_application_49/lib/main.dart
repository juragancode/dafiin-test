import 'package:flutter/material.dart';
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
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME PAGE"),
      ),
      body: Center(
        child: Text("Halaman Utama"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Get.to(
          () => CountPage(),
          binding: BindingsBuilder(
            () {
              Get.put(CountC());
            },
          ),
        );
      }),
    );
  }
}

class CountPage extends StatelessWidget {
  final countC = Get.find<CountC>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Count Page"),
      ),
      body: Center(
        child: Obx(() => Text(
              "${countC.count}",
              style: TextStyle(fontSize: 30),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countC.add();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class CountC extends GetxController {
  var count = 0.obs;
  void add() => count++;
}
