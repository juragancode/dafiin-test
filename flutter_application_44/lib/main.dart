import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.green;
    }
    return Colors.purple;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text(
            "GetX Dialog",
            style: TextStyle(fontSize: 30),
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          Get.defaultDialog(
            title: "Peringatan!",
            titlePadding: EdgeInsets.all(15),
            titleStyle: TextStyle(fontSize: 25),
            middleText: "Are You Ready?",
            middleTextStyle: TextStyle(fontSize: 30),
            backgroundColor: Colors.teal[100],
            textCancel: "Cancel",
            cancelTextColor: Colors.red,
            onCancel: () {},
            textConfirm: "Confirm",
            confirmTextColor: Colors.green,
            onConfirm: () {},
            radius: 100
          );
        }),
      ),
    );
  }
}
