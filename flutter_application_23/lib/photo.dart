import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_23/gallery.dart';


class PhotoPage extends StatelessWidget {
  static const nameRoute = '/photo' ;

final List<Container> myList = List.generate(1002, (index) {
    return Container(
      decoration: BoxDecoration( image: DecorationImage(image: NetworkImage("https://cdn.iconscout.com/icon/free/png-512/github-154-675675.png"), fit: BoxFit.contain),
          color: Color.fromARGB(10 + Random().nextInt(256), 50 + Random().nextInt(256), 50 +
              Random().nextInt(256), 50 + Random().nextInt(256)),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white, width: 5)),
    );
  });
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(
            15 + Random().nextInt(256),
            50 + Random().nextInt(256),
            50 + Random().nextInt(256),
            50 + Random().nextInt(256)),
        title: Text(
          "Photos",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child:  GridView.count(
          crossAxisCount: 3,
          children: myList,
          padding: EdgeInsets.all(10),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
      floatingActionButton: FloatingActionButton( child: Icon(Icons.arrow_back,),
        onPressed: () {
          Navigator.of(context).pop(MaterialPageRoute(builder: (builder) {
            return GalleryPage();
          }));
        },
      ), 
    );
  }
}
