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
      home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Get.to(TextPage()),
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(
        child: Text("Home Page"),
      ),

    );
  }
}


class TextPage extends StatelessWidget { 
  final textC = Get.put(TextController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Text Page"),),
      body: TextField(
        controller: textC.myC,
      ),
    );
  }
}

class TextController extends GetxController{
  final myC = TextEditingController();
}