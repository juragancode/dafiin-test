import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  List<Tab> myTab = [
    Tab(
      text: "Like",
      icon: Icon(Icons.thumb_up),
    ),
    Tab(
      text: "Comment",
      icon: Icon(Icons.comment),
    ),
    Tab(
      text: "Share",
      icon: Icon(Icons.share),
    ),
    Tab(
      text: "Follow",
      icon: Icon(Icons.follow_the_signs),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: myTab.length,
        child: Scaffold(
          backgroundColor: Colors.greenAccent[400],
          appBar: AppBar(
            shadowColor: Colors.black.withBlue(100),
            elevation: 25,
            leading: Image(
              width: 20,
              height: 20,
              image: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_E-hDaBdNmPA4sj5wbPG98L1xbisJefIlew&usqp=CAU"),
              fit: BoxFit.contain,
            ),
            backgroundColor: Colors.greenAccent[400],
            centerTitle: true,
            title: Text(
              "New Love Media",
              style: TextStyle(color: Colors.black.withBlue(90)),
            ),
            bottom: TabBar(
                labelColor: Colors.black.withBlue(90),
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.amber[900],
                    border:
                        Border.all(color: Colors.black.withBlue(70), width: 3)),
                tabs: myTab),
          ),
          body: TabBarView(children: [
            Center(
              child: Text("Liked",
                  style: TextStyle(color: Colors.black.withBlue(90))),
            ),
            Center(
              child: Text("Comment",
                  style: TextStyle(color: Colors.black.withBlue(90))),
            ),
            Center(
              child: Text("Shared",
                  style: TextStyle(color: Colors.black.withBlue(90))),
            ),
            Center(
              child: Text("Follower",
                  style: TextStyle(color: Colors.black.withBlue(90))),
            ),
          ]),
        ),
      ),
    );
  }
}
