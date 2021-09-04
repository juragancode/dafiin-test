import 'package:flutter/material.dart';
import 'package:food_app_ordering/composition_root.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  CompositionRoot.configure();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Space',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Color.fromARGB(255, 59, 105, 251),
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CompositionRoot.composeHomeUi(),
    );
  }
}
