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
  bool click = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Cross Fade"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.cyan,
                border: Border.all(color: Colors.purple, width: 4),
                borderRadius: BorderRadius.circular(80),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            AnimatedCrossFade(
                firstChild:  Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.cyan,
                border: Border.all(color: Colors.purple, width: 4),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
                secondChild: Container(
              width: 100,
              height: 400,
              decoration: BoxDecoration(
                color: Colors.purple,
                border: Border.all(color: Colors.cyan, width: 4),
                borderRadius: BorderRadius.circular(80),
              ),
            ),
            firstCurve: Curves.elasticOut,
            secondCurve: Curves.bounceInOut,
                crossFadeState: click ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                duration: Duration(seconds: 2),
                ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.cyan,
                border: Border.all(color: Colors.purple, width: 4),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          click = !click;
        });
      }),
    );
  }
}
