import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool statusSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch(activeColor: Colors.lightGreenAccent[400],
            activeTrackColor: Colors.greenAccent,
            inactiveThumbColor: Colors.red,
            activeThumbImage: AssetImage("images/true (2).png"),
            inactiveThumbImage:AssetImage("images/false.png") ,
                value: statusSwitch,
                onChanged: (value) {
                  setState(() {
                    statusSwitch = !statusSwitch;
                  });
                }),
            Text((statusSwitch == true) ? "Swith On" : "Swith Off")
          ],
        ),
      ),
    );
  }
}
