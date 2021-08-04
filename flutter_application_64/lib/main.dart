import 'package:flutter/material.dart';
import 'package:flutter_application_64/mainpage.dart';
import 'package:flutter_application_64/on_off.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage2(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isOn =  false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(isOn ? "ON" : "OFF", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: () {
                setState(() {
                  isOn = !isOn;
                });
              },
              child: OnOffWidget(isOn)),
          ],
        ),
      ),
    );
  }
}
