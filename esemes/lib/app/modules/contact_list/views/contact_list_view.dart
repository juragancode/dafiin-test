import 'package:esemes/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/contact_list_controller.dart';

class ContactListView extends GetView<ContactListController> {
  final List<Widget> friends = List.generate(
    20,
    (i) => ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.black26,
        child: Image.asset(
          "assets/logo/noimage.png",
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        "Orang ke ${i + 1}",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        "orang${i + 1}@gmail.com",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
      trailing: GestureDetector(
        onTap: () => Get.toNamed(Routes.ROOM_CHATS),
        child: Chip(
          label: Text("Message"),
        ),
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Get.height * 0.2),
        child: AppBar(
          backgroundColor: Colors.cyan,
          title: Text('Search'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back),
          ),
          flexibleSpace: Padding(
            padding: EdgeInsets.fromLTRB(30, 50, 30, 30),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TextField(
                controller: controller.searchC,
                cursorColor: Colors.cyan,
                cursorWidth: 3,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(30)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(30)),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  hintText: 'Search your friend here..',
                  suffixIcon: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(30),
                    child: Icon(
                      Icons.search,
                      color: Colors.cyan,
                      size: 28,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: friends.length == 0
          ? Center(
              child: Container(
                height: Get.width * 0.7,
                width: Get.width * 0.7,
                child: Lottie.asset("assets/lottie/empty.json"),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: friends.length,
              itemBuilder: (context, i) => friends[i]),
    );
  }
}
