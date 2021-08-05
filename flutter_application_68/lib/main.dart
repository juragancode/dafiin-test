import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.greenAccent.withOpacity(0.8),
            expandedHeight: 125,
            flexibleSpace: FlexibleSpaceBar(
              background: FlutterLogo(),
              title: Text(
                "Sliver Grid",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 25,
                ),
              ),
              centerTitle: true,
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate((ctx, i) {
              return Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://picsum.photos/id/${i + 500}/1000"),
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "${i + 1}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            "Card",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(
                        240 + Random().nextInt(256),
                        200 + Random().nextInt(256),
                        200 + Random().nextInt(256),
                        200 + Random().nextInt(256),
                      ),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black87, width: 3)),
                ),
              );
            }, childCount: 30),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 240,
            ),
          )
        ],
      ),
    );
  }
}
