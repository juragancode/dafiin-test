import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_23/home.dart';
import 'package:flutter_application_23/photo.dart';

class GalleryPage extends StatelessWidget {
  static const nameRoute = '/gallery' ;
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
          "Gallery Page",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Gallery Page", style: TextStyle(fontSize: 50)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pop(MaterialPageRoute(builder: (builder) {
                        return HomePage();
                      }));
                    },
                    child: Text(
                      "<<Back",
                      style: TextStyle(fontSize: 18),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(PhotoPage.nameRoute);
                    },
                    child: Text(
                      "Next>>",
                      style: TextStyle(fontSize: 18),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
