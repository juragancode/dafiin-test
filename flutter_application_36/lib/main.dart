import 'package:flutter/material.dart';
import 'package:flutter_application_36/pages/counter_page.dart';
import 'package:flutter_application_36/pages/other_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterPage(),
      routes: {
        CounterPage.routeName: (ctx) => CounterPage(),
        OtherPage.routeName: (ctx) => OtherPage(),
      },
    );
  }
}
