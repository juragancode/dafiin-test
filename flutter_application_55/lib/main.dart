import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool click = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Flutter"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              click = !click;
            });
          },
          child: AnimatedContainer(
            duration: Duration(seconds: 2),
            height: click ? 400 : 200,
            width: click ? 400 : 200,
            decoration: BoxDecoration(
                color: click ? Colors.pink : Colors.cyan,
                border: Border.all(
                    color: click ? Colors.blue : Colors.deepPurple,
                    width: click ? 6 : 4),
                borderRadius: click
                    ? BorderRadius.circular(200)
                    : BorderRadius.circular(100)),
            curve: Curves.fastOutSlowIn,
            child: AnimatedAlign( alignment: Alignment.center,
            duration: Duration(seconds: 2),
              child: GestureDetector( onTap: () {
                setState(() {
                  click = !click;
                });
              },
                child: Icon(
                  Icons.remove_red_eye,
                  size: click ? 200 : 40,
                  color: click ? Colors.cyan : Colors.pink,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
