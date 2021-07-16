import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController myController = TextEditingController();

  String hasil = "HASIL INPUT";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue.shade200,
        appBar: AppBar(
          title: Text("Text Field Fitur"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: myController,
                  onChanged: (value) {
                    print("ONCHANGE");
                   
                  },
                  onSubmitted:  (value) {
                    print(value);
                     setState(() {
                      hasil = value;
                    });
                  },
                ),
                Text(hasil)
              ],
            ),
            
          ),
        ),
      ),
    );
  }
}
