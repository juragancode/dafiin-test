import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Typhography"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Contoh 1 (Tanpa apapun)",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Contoh 2 (Small Caps)",
              style: TextStyle(
                  fontSize: 20, fontFeatures: [FontFeature.enable('smcp')]),
            ),
            Text(
              "Contoh 2/3 (Small Caps & Frac)",
              style: TextStyle(fontSize: 20, fontFeatures: [
                FontFeature.enable('smcp'),
                FontFeature.enable('frac')
              ]),
            ),
            Text(
              "Contoh Cardo 19 (Tanpa Apapun))",
              style: TextStyle(fontSize: 20, fontFamily: "Roboto"),
            ),
            Text(
              "Contoh Cardo 19 (OldSttyle))",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w400, fontStyle: FontStyle.italic,
                  fontFeatures: [FontFeature.oldstyleFigures()]),
            ),
            Text(
              "Contoh Gabriela",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Milonga"),
            ),
            Text(
              "Contoh Gabriela",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Yomogi", fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
