import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool click = false;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions: [
            ElevatedButton(
                onPressed: () => Get.to(() => EyeconPage()),
                child: Icon(Icons.next_plan)),
          ],
        ),
        body: Center(
          child: SizedBox(
            height: 400,
            width: 400,
            child: Stack(
              children: [
                AnimatedContainer(
                  curve: Curves.easeInOutSine,
                  duration: Duration(seconds: 2),
                  decoration: BoxDecoration(
                      color: click ? Colors.pink.shade200 : Colors.greenAccent,
                      border: Border.all(
                          width: 4, color: click ? Colors.pink : Colors.green),
                      borderRadius: BorderRadius.circular(20)),
                ),
                AnimatedPositioned(
                  duration: Duration(seconds: 2),
                  curve: Curves.fastOutSlowIn,
                  top: click ? 250 : 10,
                  left: click ? 250 : 10,
                  child: AnimatedContainer(
                    duration: Duration(seconds: 2),
                    curve: Curves.easeInOutCirc,
                    decoration: BoxDecoration(
                        color: click ? Colors.green : Colors.lightBlue,
                        border: Border.all(
                            width: 4,
                            color: click ? Colors.cyan : Colors.purple),
                        borderRadius: BorderRadius.circular(click ? 40 : 20)),
                    height: click ? 180 : 80,
                    width: click ? 180 : 80,
                  ),
                ),
                AnimatedPositioned(
                  duration: Duration(seconds: 2),
                  curve: Curves.fastOutSlowIn,
                  bottom: click ? 250 : 10,
                  right: click ? 250 : 10,
                  child: AnimatedContainer(
                    duration: Duration(seconds: 2),
                    curve: Curves.easeInOutCirc,
                    decoration: BoxDecoration(
                        color: click ? Colors.green : Colors.yellow,
                        border: Border.all(
                            width: 4,
                            color: click ? Colors.purple : Colors.cyan),
                        borderRadius: BorderRadius.circular(click ? 40 : 20)),
                    height: click ? 180 : 80,
                    width: click ? 180 : 80,
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          setState(() {
            click = !click;
          });
        }),
      ),
    );
  }
}

class EyeconPage extends StatefulWidget {
  @override
  _EyeconPageState createState() => _EyeconPageState();
}

class _EyeconPageState extends State<EyeconPage> {
  bool click = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SizedBox(
            height: 400 ,
            width: 400 ,
            child: Stack(
              children: [
                AnimatedContainer(
                  curve: Curves.easeInOutSine,
                  duration: Duration(seconds: 2),
                  decoration: BoxDecoration(
                      color: click ? Colors.pink.shade200 : Colors.greenAccent,
                      border: Border.all(
                          width: 4, color: click ? Colors.pink : Colors.green),
                      borderRadius: BorderRadius.circular(20)),
                ),
                Center(
                  child: AnimatedContainer(
                    duration: Duration(seconds: 3),
                    curve: Curves.fastOutSlowIn,
                    decoration: BoxDecoration(
                        color: click ? Colors.green : Colors.lightBlue,
                        border: Border.all(
                            width: 4,
                            color: click ? Colors.cyan : Colors.purple),
                        borderRadius: BorderRadius.vertical(
                          top: click
                              ? Radius.elliptical(300, 150)
                              : Radius.elliptical(100, 50),
                          bottom: click
                              ? Radius.elliptical(300, 150)
                              : Radius.elliptical(100, 50),
                        )),
                    height: click ? 150 : 50,
                    width: click ? 300 : 100,
                    child: AnimatedAlign(alignment: Alignment.center,
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 800),
                      child: Icon(
                        Icons.remove_red_eye_outlined,
                        size: click ? 75 : 25,
                        color: click ? Colors.red : Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          click = !click;
        });
      }),
    );
  }
}
