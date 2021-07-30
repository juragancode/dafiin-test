import 'package:flutter/material.dart';
import 'package:flutter_application_50/trans.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(),
      translations: MyTranslation(),
      locale: Locale('en'),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'.trArgs(['Hajri'])),
        actions: [
          IconButton(
              onPressed: () {
                Get.updateLocale(Locale('id'));
              },
              icon: Icon(Icons.change_circle)),
        ],
      ),
      body: Center(
        child: Text('body'.tr),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
        },
        child: Icon(Icons.change_circle),
      ),
    );
  }
}
