import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text("Center"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.snackbar("Alarm", "Peringatan waktunya sudah tiba",
                titleText: Text(
                  "Alarm",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                messageText: Text(
                  "Peringatan waktunya sudah tiba",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                backgroundColor: Colors.blue,
                backgroundGradient:
                    LinearGradient(colors: [Colors.purple, Colors.red]),
                duration: Duration(seconds: 2),
                animationDuration: Duration(milliseconds: 300),
                borderWidth: 3,
                borderColor: Colors.green,
                icon: Icon(
                  Icons.alarm,
                  color: Colors.white,
                  size: 30,
                ));
          },
          child: Icon(Icons.access_time),
        ),
      ),
    );
  }
}
