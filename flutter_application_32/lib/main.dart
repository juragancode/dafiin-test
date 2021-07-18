import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cupertino "),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Platform.isIOS ? CupertinoAlertDialog(
                          title: Text("Delete Item"),
                          content: Text("Are you sure?"),
                          actions: [
                            TextButton(onPressed: () {}, child: Text("Yes")),
                            TextButton(onPressed: () {}, child: Text("No"))
                          ],
                        ) : AlertDialog(
                          title: Text("Delete Item"),
                          content: Text("Are you sure?"),
                          actions: [
                            TextButton(onPressed: () {}, child: Text("Yes")),
                            TextButton(onPressed: () {}, child: Text("No"))
                          ],
                        );
                      });
                },
                child: Text("Alert Dialog")),ElevatedButton(
            onPressed: () {
            Platform.isAndroid ? showDatePicker(
              context: context, initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2100) 
            ) : showCupertinoModalPopup(context: context, builder: (context) {
              return Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.white,
                child: CupertinoDatePicker(onDateTimeChanged: (datetime) {
                  print(datetime);
                }, initialDateTime: DateTime.now(),),
              );
            });
            },
            child: Text("Date Picker")),
          ],
        ), 
            
      ),
    );
  }
}
