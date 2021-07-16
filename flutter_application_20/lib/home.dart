import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String data = "Belum ada input";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text(
            data,
            style: TextStyle(fontSize: 35),
          ),
        ),
        appBar: AppBar(
          title: Text("Dialog"),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("Telah diklik");
            showDialog(
                context: (context),
                builder: (context) {
                  return AlertDialog(
                    title: Text("Confirm"),
                    content: Text("Are you sure to delete this items"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            setState(() {
                             data = "False"; 
                            });
                            Navigator.of(context).pop(false);
                          },
                          child: Text("Yes")),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              data = "True";
                            });
                            Navigator.of(context).pop(true);
                          },
                          child: Text("No"))
                    ],
                  );
                });
          },
          child: Icon(
            Icons.delete,
          ),
        ));
  }
}
