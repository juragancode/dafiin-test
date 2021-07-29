import 'package:flutter/material.dart';
import 'package:flutter_application_41/pages/pagesatu.dart';
import 'package:flutter_application_41/routes/pages.dart';

import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: PageSatu(),
      getPages: AppPage.pages,
    );
  }
}
