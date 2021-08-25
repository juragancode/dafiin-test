import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:esemes/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../controllers/room_chats_controller.dart';

// ignore: must_be_immutable
class RoomChatsView extends GetView<RoomChatsController> {
  final authC = Get.find<AuthController>();
  final String chat_id = (Get.arguments as Map<String, dynamic>)["chat_id"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          leadingWidth: 100,
          leading: InkWell(
            onTap: () => Get.back(),
            borderRadius: BorderRadius.circular(100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 5,
                ),
                Icon(Icons.arrow_back),
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: StreamBuilder<DocumentSnapshot<Object?>>(
                    stream: controller.streamFriendData(
                        (Get.arguments as Map<String, dynamic>)["friendEmail"]),
                    builder: (context, snapFriendUser) {
                      if (snapFriendUser.connectionState ==
                          ConnectionState.active) {
                        var dataFriend =
                            snapFriendUser.data!.data() as Map<String, dynamic>;

                        if (dataFriend["photoUrl"] == "noimage") {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              "assets/logo/noimage.png",
                              fit: BoxFit.cover,
                            ),
                          );
                        } else {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              dataFriend["photoUrl"],
                              fit: BoxFit.cover,
                            ),
                          );
                        }
                      }
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          "assets/logo/noimage.png",
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          title: StreamBuilder<DocumentSnapshot<Object?>>(
            stream: controller.streamFriendData(
                (Get.arguments as Map<String, dynamic>)["friendEmail"]),
            builder: (context, snapFriendUser) {
              if (snapFriendUser.connectionState == ConnectionState.active) {
                var dataFriend =
                    snapFriendUser.data!.data() as Map<String, dynamic>;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dataFriend["name"],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      dataFriend["status"],
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                );
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Loading...',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Loading...',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              );
            },
          ),
          centerTitle: false,
        ),
        body: WillPopScope(
          onWillPop: () {
            if (controller.isShowEmoji.isTrue) {
              controller.isShowEmoji.value = false;
            } else {
              Navigator.pop(context);
            }
            return Future.value(false);
          },
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: controller.streamChats(chat_id),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        var alldata = snapshot.data!.docs;
                        Timer(
                          Duration.zero,
                          () => controller.scrollC.jumpTo(
                              controller.scrollC.position.maxScrollExtent),
                        );
                        return ListView.builder(
                            controller: controller.scrollC,
                            itemCount: alldata.length,
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: Container(
                                        height: 40,
                                        width: 120,
                                        decoration: BoxDecoration(
                                          color: Get.isDarkMode
                                              ? Color(0xFF141E61)
                                              : Colors.cyan,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "${alldata[index]["groupTime"]}",
                                            style: GoogleFonts.habibi(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Chats(
                                      msg: "${alldata[index]["msg"]}",
                                      isSender: alldata[index]["pengirim"] ==
                                              authC.user.value.email!
                                          ? true
                                          : false,
                                      time: "${alldata[index]["time"]}",
                                    ),
                                  ],
                                );
                              } else {
                                if (alldata[index]["groupTime"] ==
                                    alldata[index - 1]["groupTime"]) {
                                  return Chats(
                                    msg: "${alldata[index]["msg"]}",
                                    isSender: alldata[index]["pengirim"] ==
                                            authC.user.value.email!
                                        ? true
                                        : false,
                                    time: "${alldata[index]["time"]}",
                                  );
                                } else {
                                  return Column(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        child: Container(
                                          height: 40,
                                          width: 120,
                                          decoration: BoxDecoration(
                                            color: Get.isDarkMode
                                                ? Color(0xFF141E61)
                                                : Colors.cyan,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "${alldata[index]["groupTime"]}",
                                              style: GoogleFonts.habibi(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Chats(
                                        msg: "${alldata[index]["msg"]}",
                                        isSender: alldata[index]["pengirim"] ==
                                                authC.user.value.email!
                                            ? true
                                            : false,
                                        time: "${alldata[index]["time"]}",
                                      ),
                                    ],
                                  );
                                }
                              }
                            });
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    bottom: controller.isShowEmoji.isTrue
                        ? 5
                        : context.mediaQueryPadding.bottom),
                decoration: BoxDecoration(shape: BoxShape.circle),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: Get.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextField(
                        autocorrect: false,
                        controller: controller.chatC,
                        focusNode: controller.focusNode,
                        onEditingComplete: () => controller.newChat(
                          authC.user.value.email!,
                          Get.arguments as Map<String, dynamic>,
                          controller.chatC.text,
                        ),
                        keyboardType: TextInputType.multiline,
                        minLines: 1,
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: 'Masukan Pesan',
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.attachment_outlined,
                              color: Colors.black54,
                            ),
                          ),
                          prefixIcon: IconButton(
                            onPressed: () {
                              controller.focusNode.unfocus();
                              controller.isShowEmoji.toggle();
                            },
                            icon: Icon(
                              Icons.emoji_emotions_outlined,
                              color: Colors.black54,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.cyan),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.cyan),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.cyan,
                      child: InkWell(
                        splashColor: Colors.cyanAccent,
                        focusColor: Colors.cyanAccent.shade700,
                        borderRadius: BorderRadius.circular(30),
                        onTap: () => controller.newChat(
                          authC.user.value.email!,
                          Get.arguments as Map<String, dynamic>,
                          controller.chatC.text,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Obx(() => (controller.isShowEmoji.isTrue)
                  ? Container(
                      height: Get.width * 0.7,
                      child: EmojiPicker(
                        onEmojiSelected: (category, emoji) {
                          controller.addEmojiToChat(emoji);
                        },
                        onBackspacePressed: () {
                          controller.deleteEmoji();
                        },
                        config: Config(
                            backspaceColor: Color(0xFF00BCD4),
                            columns: 7,
                            emojiSizeMax: 32.0,
                            verticalSpacing: 0,
                            horizontalSpacing: 0,
                            initCategory: Category.RECENT,
                            bgColor: Color(0xFFF2F2F2),
                            indicatorColor: Color(0xFF00BCD4),
                            iconColor: Color(0xFF00BCD4),
                            iconColorSelected: Colors.cyan.shade900,
                            progressIndicatorColor: Color(0xFF00BCD4),
                            showRecentsTab: true,
                            recentsLimit: 28,
                            noRecentsText: "No Recents",
                            noRecentsStyle: const TextStyle(
                                fontSize: 20, color: Colors.black26),
                            categoryIcons: const CategoryIcons(),
                            buttonMode: ButtonMode.MATERIAL),
                      ),
                    )
                  : SizedBox()),
            ],
          ),
        ));
  }
}

class Chats extends StatelessWidget {
  const Chats({
    Key? key,
    required this.isSender,
    required this.msg,
    required this.time,
  }) : super(key: key);
  final bool isSender;
  final String msg;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
              decoration: BoxDecoration(
                  color:
                      Get.isDarkMode ? Color(0xFF141E61) : Colors.cyan.shade200,
                  borderRadius: isSender
                      ? BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        )
                      : BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        )),
              padding: EdgeInsets.all(15),
              child: Text(
                "$msg",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                maxLines: 5,
              )),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              DateFormat.jm().format(DateTime.parse(time)),
            ),
          ),
        ],
      ),
    );
  }
}
