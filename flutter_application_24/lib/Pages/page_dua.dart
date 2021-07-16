import 'package:flutter/material.dart';

import '../main.dart';
import 'page_satu.dart';
import 'page_tiga.dart';

class PageDua extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        elevation: 15,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: 100,
              color: Colors.red,
              alignment: Alignment.bottomLeft,
              child: Text(
                "Menu",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PageSatu()));
              },
              leading: Icon(
                Icons.home,
                size: 35,
              ),
              title: Text("Home",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PageDua()));
              },
              leading: Icon(
                Icons.person,
                size: 35,
              ),
              title: Text("Profile",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PageTiga()));
              },
              leading: Icon(
                Icons.settings,
                size: 35,
              ),
              title: Text("Setting",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent[400],
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
          child: Text(
        "Some Text Here",
        style: TextStyle(fontSize: 30),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(MaterialPageRoute(builder: (context) {
            return MyApp();
          }));
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
