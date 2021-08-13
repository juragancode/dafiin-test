import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<Widget> mylist = List.generate(40, (index) {
    return Container(
      child: Center(
        child: Text("Panel",
            style: GoogleFonts.pacifico(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )),
      ),
      decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.black),
          color: Color.fromARGB(
              200 + Random().nextInt(256),
              150 + Random().nextInt(256),
              150 + Random().nextInt(256),
              150 + Random().nextInt(256)),
          borderRadius: BorderRadius.circular(40)),
    );
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text("Dashboard",
              style: GoogleFonts.pacifico(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              )),
        ),
      ),
      body: GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 2 / 2),
        children: mylist,
      ),
    );
  }
}
