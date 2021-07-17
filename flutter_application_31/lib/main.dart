import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final widthApp = MediaQuery.of(context).size.width;
    final heightApp = MediaQuery.of(context).size.height;
    final paddingTop = MediaQuery.of(context).padding.top;
    final myAppBar = AppBar(
      title: Text("Layout Builder"),
      centerTitle: true,
    );
    final bodyHeight = heightApp - myAppBar.preferredSize.height - paddingTop;
    return Scaffold(
      appBar: myAppBar,
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          width: widthApp,
          height: bodyHeight,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 5),
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyContainer(widthApp),
              MyContainer(widthApp),
              MyContainer(widthApp)
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MyContainer extends StatelessWidget {
  double widthApp;
  MyContainer(this.widthApp);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: widthApp * 0.3,
        height: constraints.maxHeight * 0.6,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 5),
            color: Colors.teal,
            borderRadius: BorderRadius.circular(20)),
      );
    });
  }
}
