import 'package:flutter/material.dart';
import 'gallery.dart';
import 'photo.dart';

import 'home.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      home: HomePage(),
      initialRoute: HomePage.nameRoute,
      routes:  {
        HomePage.nameRoute : (context) => HomePage(),
        GalleryPage.nameRoute : (context) => GalleryPage(),
        PhotoPage.nameRoute : (context) => PhotoPage()
      },
    );
  }
}