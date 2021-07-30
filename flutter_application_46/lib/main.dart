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
          title: Text("Home Page"),
          actions: [
            IconButton(
              onPressed: () => Get.to(() => CountPage()),
              icon: Icon(Icons.skip_next),
            )
          ],
        ),
        body: Center(
          child: Text("Home Page", style: TextStyle(fontSize: 30)),
        ));
  }
}

class MyController extends GetxController {
  var count = 0.obs;

  var textC = TextEditingController();

  void add() => count++;
}

class CountPage extends StatelessWidget {
  final c = Get.put(MyController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Get.to(() => TextPage()),
            icon: Icon(Icons.skip_next),
          )
        ],
        title: Text("Count Page"),
      ),
      body: Center(
        child: Obx(
          () => Text(
            "${c.count}",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => c.add(),
        child: Icon(Icons.add),
      ),
    );
  }
}

class TextPage extends StatelessWidget {
  final MyController c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: TextField(
            decoration: InputDecoration(border: OutlineInputBorder()),
            controller: c.textC,
          ),
        ),
      ),
    );
  }
}
