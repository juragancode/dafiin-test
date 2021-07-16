import 'package:flutter/material.dart';
import 'package:flutter_application_13/costum_progress_bar.dart';
import 'package:provider/provider.dart';
import 'dart:async';

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
          title: Text("Custom Progress Bar"),
        ),
        body: Center(
          child: ChangeNotifierProvider<TimeState>(
            create: (_) => TimeState(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Consumer<TimeState>(
                  builder: (context, timeState, _) => CustomProgressBar(
                    width: 200,
                    value: timeState.time,
                    totalValue: 15,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Consumer<TimeState>(
                  builder: (context, timeState, _) => ElevatedButton(
                      onPressed: () {
                        Timer.periodic(Duration(seconds: 1), (timer) {
                          timeState.time -= 1;
                          if (timeState.time == 0) timer.cancel();
                        });
                      },
                      child: Text(
                        "Start",
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
