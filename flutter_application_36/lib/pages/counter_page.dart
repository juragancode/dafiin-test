import 'package:flutter/material.dart';
import 'package:flutter_application_36/widget/widget_counter.dart';

class CounterPage extends StatefulWidget {
  static const routeName = "/counter_page";

  CounterPage() {
    print("========================");
    print("Constructor CounterPage ");
  }

  @override
  _CounterPageState createState() {
    print("Create State CounterPage");
    return _CounterPageState();
  }
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;


  @override
  Widget build(BuildContext context) {
    print("Build STF");
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Page"),
      ),
      body: WidgetCounter(counter: counter),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

