import 'package:flutter/material.dart';
import 'package:flutter_application_22/Pages/page1.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Ini Page 2",
          style: TextStyle(fontSize: 30),
        ),
      ),
      appBar: AppBar(
        title: Text("Page 2"),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amberAccent[400],
          splashColor: Colors.lightBlueAccent[700],
          onPressed: () {
            Navigator.of(context).pop(MaterialPageRoute(builder: (context) {
              return Page1();
            }));
          },
          child: Icon(
            Icons.keyboard_arrow_left, size: 50, color: Colors.black54  
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
