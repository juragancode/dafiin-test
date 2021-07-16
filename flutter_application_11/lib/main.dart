import 'package:flutter/material.dart';
import 'package:flutter_application_11/chat_room.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("List Tile"),
        ),
        body: ListView(
          children: [
            ListTile(
                contentPadding: EdgeInsets.all(5),
                title: Text("Dafin Overclock"),
                subtitle: Text("Sudah makankah?"),
                leading: CircleAvatar(
                  backgroundColor: Colors.greenAccent,
                ),
                trailing: Text("19.00"),
                tileColor: Colors.black12,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return RoomChat() ;
                    }
                  ));
                }),
            Divider(),
            ListTile(
                contentPadding: EdgeInsets.all(5),
                title: Text("Dafin Overclock"),
                subtitle: Text("Sudah makankah?"),
                leading: CircleAvatar(),
                trailing: Text("19.00")),
            Divider(),
            ListTile(
              contentPadding: EdgeInsets.all(5),
              title: Text("Dafin Overclock"),
              subtitle: Text("Sudah makankah?"),
              leading: CircleAvatar(),
              trailing: Text("19.00"),
            ),
            Divider(),
            ListTile(
              contentPadding: EdgeInsets.all(5),
              title: Text("Dafin Overclock"),
              subtitle: Text("Sudah makankah?"),
              leading: CircleAvatar(),
              trailing: Text("19.00"),
            ),
            Divider(),
            ListTile(
              contentPadding: EdgeInsets.all(5),
              title: Text("Dafin Overclock"),
              subtitle: Text("Sudah makankah?"),
              leading: CircleAvatar(),
              trailing: Text("19.00"),
            ),
            Divider(),
            ListTile(
              contentPadding: EdgeInsets.all(5),
              title: Text("Dafin Overclock"),
              subtitle: Text("Sudah makankah?"),
              leading: CircleAvatar(),
              trailing: Text("19.00"),
            ),
          ],
        ),
      ),
    );
  }
}
