import 'package:flutter/material.dart';

import 'page2.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Ini Page 1",
          style: TextStyle(fontSize: 30),
        ),
      ),
      appBar: AppBar(
        title: Text("Page 1"),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightGreenAccent[400],
          splashColor: Colors.lightBlueAccent[700],
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Page2();
            }));
          },
          child: Icon(
            Icons.keyboard_arrow_right,
            size: 50,
            color: Colors.black54,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
