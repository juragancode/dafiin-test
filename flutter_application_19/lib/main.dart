import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TextStyle myStyle = TextStyle(
      color: Colors.lightBlueAccent[700],
      fontSize: 30,
      fontWeight: FontWeight.w600);

  final List<Container> myList = List.generate(1002, (index) {
    return Container(
      decoration: BoxDecoration( image: DecorationImage(image: NetworkImage("https://cdn.iconscout.com/icon/free/png-512/github-154-675675.png"), fit: BoxFit.contain),
          color: Color.fromARGB(10 + Random().nextInt(256), 10 + Random().nextInt(256), 10 +
              Random().nextInt(256), 10 + Random().nextInt(256)),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white, width: 5)),
    );
  });

  @override
  Widget build(BuildContext context) {  
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 10 + Random().nextInt(256), 10 +
              Random().nextInt(256), 10 + Random().nextInt(256)),
        appBar: AppBar( shadowColor: Colors.white,
          elevation: 20,
          foregroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Grid View",
            style: myStyle,
          ),
          backgroundColor: Colors.greenAccent[400],
        ),
        body: GridView.count(
          crossAxisCount: 3,
          children: myList,
          padding: EdgeInsets.all(10),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
