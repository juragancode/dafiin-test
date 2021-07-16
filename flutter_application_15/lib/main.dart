import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Map<String, dynamic>> myList = [
    {
      "Name": "Reins",
      "Age": 25,
      "favColor": [
        "Black",
        "Red",
        "Amber",
        "Green",
        "Cyan",
        "Blue",
        "Yellow",
        "Purple"
      ]
    },
    {
      "Name": "Azura",
      "Age": 22,
      "favColor": ["Black", "Green", "Cyan"]
    },
    {
      "Name": "Feony",
      "Age": 19,
      "favColor": ["White", "Pink", "Blue"]
    },
    {
      "Name": "Reins",
      "Age": 25,
      "favColor": [
        "Black",
        "Red",
        "Amber",
        "Green",
        "Cyan",
        "Blue",
        "Yellow",
        "Purple"
      ]
    },
    {
      "Name": "Azura",
      "Age": 22,
      "favColor": ["Black", "Green", "Cyan"]
    },
    {
      "Name": "Feony",
      "Age": 19,
      "favColor": ["White", "Pink", "Blue"]
    },
    {
      "Name": "Reins",
      "Age": 25,
      "favColor": [
        "Black",
        "Red",
        "Amber",
        "Green",
        "Cyan",
        "Blue",
        "Yellow",
        "Purple"
      ]
    },
    {
      "Name": "Azura",
      "Age": 22,
      "favColor": ["Black", "Green", "Cyan"]
    },
    {
      "Name": "Feony",
      "Age": 19,
      "favColor": ["White", "Pink", "Blue"]
    },
    {
      "Name": "Reins",
      "Age": 25,
      "favColor": [
        "Black",
        "Red",
        "Amber",
        "Green",
        "Cyan",
        "Blue",
        "Yellow",
        "Purple"
      ]
    },
    {
      "Name": "Azura",
      "Age": 22,
      "favColor": ["Black", "Green", "Cyan"]
    },
    {
      "Name": "Feony",
      "Age": 19,
      "favColor": ["White", "Pink", "Blue"]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text("ID Apps"),
        ),
        body: ListView(
          children: myList.map((data) {
            print(data["favColor"]);
            List myFavColor = data["favColor"];
            return Card(
              margin: EdgeInsets.all(20),
              color: Colors.black.withOpacity(0.1),
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar( backgroundColor: Colors.purpleAccent[400],),
                        SizedBox(width: 20,),
                        Column( crossAxisAlignment: CrossAxisAlignment.start ,
                          children: [
                            Text("Name: ${data['Name']}"),
                            Text("Age: ${data['Age']}"),
                          ],
                        )
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: myFavColor.map((color) {
                          return Container(
                            padding: EdgeInsets.all(10),
                            color: Colors.cyanAccent,
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 6),
                            child: Text(
                              color,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
