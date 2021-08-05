import 'dart:ui';

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
            pinned: true,
            expandedHeight: 150,
            backgroundColor: Colors.greenAccent,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "List Menu",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
              background: FlutterLogo(),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: ClassDelegate(
                minExtent: 100, maxExtent: 150, title: "Menu Makanan"),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (ctx, i) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Center(
                    child: Text(
                      "Menu Makanan- ${i + 1}",
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              );
            },
            childCount: 15,
          )),
          SliverPersistentHeader(
            pinned: true,
            delegate: ClassDelegate(
                minExtent: 100, maxExtent: 150, title: "Menu Minuman"),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (ctx, i) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Center(
                    child: Text(
                      "Menu Minuman- ${i + 1}",
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              );
            },
            childCount: 20,
          )),
        ],
      ),
    );
  }
}

class ClassDelegate extends SliverPersistentHeaderDelegate {
  ClassDelegate({
    required this.minExtent,
    required this.maxExtent,
    required this.title,
  });

  final double minExtent;
  final double maxExtent;
  final String title;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/tomato-png.png',
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.transparent,
              Colors.redAccent.shade700,
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Text(
                "$title",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )),
      ],
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
