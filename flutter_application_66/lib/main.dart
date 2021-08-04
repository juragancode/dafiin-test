import 'dart:math';

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
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 120,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text("Sliver List"),
              background: Image.network(
                "https://picsum.photos/id/${1 + Random().nextInt(500)}/1000",
                fit: BoxFit.fill,
              ),
            ),
          ),
          // SliverFixedExtentList(
          //     delegate: SliverChildBuilderDelegate(
          //       (ctx, i) {
          //         return Container(
          //           child: Stack(
          //             children: [
          //               Padding(
          //                 padding: const EdgeInsets.all(10),
          //                 child: Align(
          //                     alignment: Alignment.centerLeft,
          //                     child: CircleAvatar(
          //                       radius: 30,
          //                       backgroundColor: Color.fromARGB(
          //                         255,
          //                         50 + Random().nextInt(255),
          //                         50 + Random().nextInt(255),
          //                         50 + Random().nextInt(255),
          //                       ),
          //                     )),
          //               ),
          //               Align(
          //                 alignment: Alignment.center,
          //                 child: Text(
          //                   "Data Ke ${i + 1}",
          //                   style: TextStyle(fontSize: 25),
          //                 ),
          //               ),
          //             ],
          //           ),
          //           color: Color.fromARGB(
          //             150 + Random().nextInt(255),
          //             50 + Random().nextInt(255),
          //             50 + Random().nextInt(255),
          //             50 + Random().nextInt(255),
          //           ),
          //         );
          //       },
          //       childCount: 50,
          //     ),
          //     itemExtent: 120),
          SliverPrototypeExtentList(
              delegate: SliverChildBuilderDelegate(
                (ctx, i) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          "https://picsum.photos/id/${1 + Random().nextInt(500)}/1000",
                        ),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Color.fromARGB(
                                  255,
                                  50 + Random().nextInt(255),
                                  50 + Random().nextInt(255),
                                  50 + Random().nextInt(255),
                                ),
                              )),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Data Ke ${i + 1}",
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                childCount: 20,
              ),
              prototypeItem: SizedBox(
                height: 120,
              ))
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     (ctx, index) {
          //       return ListTile(
          //         leading: CircleAvatar(),
          //         title: Text("Data ke - ${index + 1}"),
          //       );
          //     },
          //     childCount: 20,
          //   ),
          // ),
        ],
      ),
    );
  }
}
