import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.indigo[100],
          appBar: AppBar(
            backgroundColor: Colors.cyanAccent,
            toolbarHeight: 100,
            leading: Container(
              child: Image(
                  image: NetworkImage(
                      "https://unism.ac.id/wp-content/uploads/2019/11/Facebook-Icon-PNG-715x715.png")),
            ),
            centerTitle: true,
            title: Text(
              "Facebook Lite",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic),
            ),
            actions: [
              SizedBox(
                  width: 40,
                  child: FloatingActionButton(
                      onPressed: () {}, child: Icon(Icons.settings))),
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(150),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {}, child: Icon(Icons.thumb_up)),
                    ElevatedButton(
                        onPressed: () {}, child: Icon(Icons.comment)),
                    ElevatedButton(onPressed: () {}, child: Icon(Icons.share))
                  ],
                ),
              ),
            ),
          ),
          body: Center(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Tak ada yang mampu menghentikanku", style: TextStyle(fontSize: 20, color: Colors.redAccent[700] ),),
                        Text("Mencintaimu adalah Pemerograman", style: TextStyle(fontSize: 20, color: Colors.pinkAccent[700])),
                        Text("Tak ada yang mampu menghentikanku", style: TextStyle(fontSize: 20,color: Colors.deepPurple[700])),
                        Text("Biarkan ini sudahlah", style: TextStyle(fontSize: 20,color: Colors.pink))
                      ],
                    ),
                    margin: EdgeInsets.fromLTRB(10, 50, 10, 50),
                    color: Colors.lightBlue[200],
                    width: 400,
                    height: 400,
                  )))),
    );
  }
}
