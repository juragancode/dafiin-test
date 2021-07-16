import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Date Format"),
        ),
        body: Center(
          child: ClipRRect( borderRadius: BorderRadius.circular(200),
            child: Container(margin: EdgeInsets.all(20), height: 200, width: 200,
            color: Colors.pink.withOpacity(0.2),
              child: Center(
                child: Text(
                  DateFormat.yMMMMEEEEd().add_Hms().format(DateTime.now()),
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.pinkAccent[200],
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
