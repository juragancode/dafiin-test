import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Fitted Box"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  width: 400,
                  decoration: BoxDecoration(
                      color: Colors.teal,
                      border: Border.all(color: Colors.limeAccent, width: 10),
                      borderRadius: BorderRadius.circular(20)),
                  child: FittedBox(
                      alignment: Alignment.center,
                      child: Image(
                          image: NetworkImage(
                              "https://img.freepik.com/free-vector/colorful-palm-silhouettes-background_23-2148541792.jpg?size=626&ext=jpg"))),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.teal,
                      border: Border.all(color: Colors.limeAccent, width: 10),
                      borderRadius: BorderRadius.circular(20)),
                  height: 300,
                  width: 400,
                  child: FittedBox(
                      alignment: Alignment.center,
                      child: Text(
                        "Hello World",
                        style: TextStyle(fontSize: 30),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
