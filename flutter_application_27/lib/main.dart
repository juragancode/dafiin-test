import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
          brightness: Brightness.dark,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primarySwatch: Colors.green,
          accentColor: Colors.lightGreenAccent[400],
          textTheme: TextTheme(
              bodyText2: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 35)),
          appBarTheme: AppBarTheme(
              textTheme: TextTheme(
                  headline6:
                      TextStyle(fontSize: 30, fontStyle: FontStyle.italic)),
              centerTitle: true,
              color: Colors.redAccent[400])),
    );
  }
}
