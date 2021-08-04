import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/widget_controller.dart';

class WidgetView extends GetView<WidgetController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WidgetView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'WidgetView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
