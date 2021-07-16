import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_application_23/gallery.dart';

class HomePage extends StatelessWidget {
static const nameRoute = '/homepage' ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(
            15 + Random().nextInt(256),
            50 + Random().nextInt(256),
            50 + Random().nextInt(256),
            50 + Random().nextInt(256)),
        title: Text(
          "Route Demo",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Text(
          "Home Page",
          style: TextStyle(fontSize: 50),
        ),
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.arrow_forward),
        onPressed: () {
          Navigator.of(context).pushNamed(GalleryPage.nameRoute);
        },
      ),
    );
  }
}
