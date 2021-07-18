import 'package:flutter/material.dart';
import 'package:flutter_application_36/pages/counter_page.dart';

class OtherPage extends StatelessWidget {
  static const routeName = "/other_page";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Other Page"),
      ), body: Center(child: OutlinedButton(onPressed: () {
            Navigator.pushReplacementNamed(context, CounterPage.routeName);
          }, child: Text("Go To Counter Page"))),
    );
  }
}