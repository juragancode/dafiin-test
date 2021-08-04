import 'package:flutter/material.dart';
import 'package:flutter_application_64/on_off_controller.dart';

class MainPage2 extends StatefulWidget {
  @override
  _MainPage2State createState() => _MainPage2State();
}

class _MainPage2State extends State<MainPage2> {
  OnOffController controller = OnOffController(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              controller.isOn ? 'ON' : 'OFF',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            OnOffWidget2(
              controller,
              onStateChange: () {
                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }
}
