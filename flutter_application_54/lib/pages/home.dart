import 'package:flutter/material.dart';
import 'package:flutter_application_54/controller/auth.dart';
import 'package:flutter_application_54/controller/controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final auth = Get.find<AuthC>();
  final login = Get.find<LoginC>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME PAGE"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()=> auth.logout(login.remeberme.value), child: Icon(Icons.logout),),
    );
  }
}
