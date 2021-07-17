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

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flexible & Expanded"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height:250,
                    decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
