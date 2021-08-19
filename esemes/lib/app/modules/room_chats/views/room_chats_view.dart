import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:esemes/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/room_chats_controller.dart';

// ignore: must_be_immutable
class RoomChatsView extends GetView<RoomChatsController> {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          leadingWidth: Get.width * 0.22,
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
                  child: Image.asset("assets/logo/noimage.png"),
                ),
              ],
            ),
          ),
          title: InkWell(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Liu Shen Yi',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Text(
                  'Software Engineer',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
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
                  child: ListView(
                    children: [
                      Chats(
                        isSender: true,
                      ),
                      Chats(
                        isSender: false,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    bottom: controller.isShowEmoji.isTrue
                        ? 5
                        : context.mediaQueryPadding.bottom),
                decoration: BoxDecoration(shape: BoxShape.circle),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                width: Get.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller.chatC,
                        focusNode: controller.focusNode,
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
                      height: 300,
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
  }) : super(key: key);
  final bool isSender;

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
                  color: Colors.cyan.shade200,
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
                "Hallo, selamat siang pak. Bagaimana kabarnya?",
                maxLines: 5,
              )),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "${DateFormat.jm().format(DateTime.now())}",
            ),
          ),
        ],
      ),
    );
  }
}
