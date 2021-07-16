import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double myPadding = 5;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Animated Padding"),
        ),
        body: Column(
          children: [
            Flexible(
                flex: 1,
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: AnimatedPadding(
                        duration: Duration(seconds: 1),
                        padding: EdgeInsets.all(myPadding),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              myPadding = 30;
                            });
                          },
                          child: Container(
                            color: Colors.redAccent[400],
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: AnimatedPadding(
                        duration: Duration(seconds: 1),
                        padding: EdgeInsets.all(myPadding),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              myPadding = 10;
                            });
                          },
                          child: Container(
                            color: Colors.greenAccent,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            Flexible(
                flex: 1,
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: AnimatedPadding(
                        duration: Duration(seconds: 1),
                        padding: EdgeInsets.all(myPadding),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              myPadding = 15;
                            });
                          },
                          child: Container(
                            color: Colors.blueAccent[400],
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: AnimatedPadding(
                        duration: Duration(seconds: 1),
                        padding: EdgeInsets.all(myPadding),
                        child: GestureDetector(
                          onDoubleTap: () {
                            setState(() {
                              myPadding = 20;
                            });
                          },
                          child: Container(
                            color: Colors.yellowAccent,
                          ),
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
