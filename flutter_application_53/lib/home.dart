import 'package:flutter/material.dart';
import 'package:flutter_application_53/controller/MyC.dart';
import 'package:get/get.dart';

class HomePage extends GetView<ControllerC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
      ),
      body: Center(
        child: controller.obx(
            (state) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("id: ${state!["id"]}"),
                    Text("nama: ${state["first_name"] + state["last_name"]}"),
                    Text("email: ${state["email"]}"),
                    Image.network("${state['avatar']}")
                  ],
                ),
            onLoading: Text("Loading..."),
            onEmpty: Text("Belum ada Data"),
            onError: (error) => Text(error.toString())),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.getData(),
        child: Icon(Icons.add),
      ),
    );
  }
}
