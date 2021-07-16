import 'dart:ffi';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final Faker faker = Faker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dismissible"),
      ),
      body: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) {
            return Dismissible(
              onDismissed: (direction) {
                print("DISMISS");
              },
              confirmDismiss: (direction) {
                return showDialog(context: context, builder: (context) {
                  return AlertDialog(
                    title: Text("Confirm"),
                    content: Text("Are You Sure to Delete This?"),
                    actions: [
                      TextButton(onPressed: () {
                        Navigator.of(context).pop(true);
                      }, child: Text("Yes")),
                      TextButton(onPressed: () {
                        Navigator.of(context).pop(false);
                      }, child: Text("No")),
                    ],
                  );
                });
              },
              direction: DismissDirection.endToStart,
              background: Container(color: Colors.red, child: Icon(Icons.delete, size: 25,),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 10),),
              key: Key(index.toString()),
              child: ListTile(
                leading: CircleAvatar(
                  child: Center(child: Text("${index+1}"),),
                ),
                title: Text(faker.person.name()),
                subtitle: Text(faker.lorem.sentence()),
              ),
            );
          }),
    );
  }
}
