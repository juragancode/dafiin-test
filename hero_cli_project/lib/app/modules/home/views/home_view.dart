import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hero_cli_project/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HomeView'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: GridView.builder(
            itemCount: 21,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Hero(
                  tag: '${index + 500}',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                        "https://picsum.photos/id/${index + 500}/1000"),
                  ),
                ),
                onTap: () => Get.toNamed(
                  Routes.DETAIL,
                  arguments: index + 500,
                ),
              );
            },
          ),
        ));
  }
}
