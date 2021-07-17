import 'dart:math';

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

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final myAppBar = AppBar(
      title: Text("Media Query"),
    );
    final bodyHeight = mediaQueryHeight -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
        appBar: myAppBar,
        body: Center(
            child: (isLandscape)
                ? Column(
                    children: [
                      Container(
                        height: bodyHeight * 0.5,
                        width: mediaQueryWidth,
                        color: Colors.teal,
                      ),
                      Container(
                        color: Colors.black,
                        height: bodyHeight * 0.5,
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    crossAxisCount: 2),
                            itemCount: 100,
                            itemBuilder: (context, index) {
                              return GridTile(
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(
                                          90 + Random().nextInt(256),
                                          110 + Random().nextInt(256),
                                          110 + Random().nextInt(256),
                                          110 + Random().nextInt(256)),
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                              );
                            }),
                      )
                    ],
                  )
                : Column(children: [
                    Container(
                      height: bodyHeight * 0.4,
                      width: mediaQueryWidth,
                      color: Colors.teal,
                    ),
                    Container(
                      color: Colors.green,
                      height: bodyHeight * 0.6,
                      child: ListView.builder(
                          itemCount: 100,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: CircleAvatar(),
                              title: Text("Hallo All"),
                            );
                          }),
                    )
                  ])));
  }
}
