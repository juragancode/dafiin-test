import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Bottom Sheets"),
        ),
        body: Center(
          child: Text(
            "Bottom Sheets",
            style: TextStyle(fontSize: 25),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.bottomSheet(Container(
              padding: EdgeInsets.all(20),
              color: Colors.cyan,
              child: Center(
                child: ListView(
                  children: [
                    TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(onPressed: () {}, child: Text("Save"))
                  ],
                ),
              ),
            ));
          },
          child: Icon(Icons.message),
        ),
      ),
    );
  }
}
