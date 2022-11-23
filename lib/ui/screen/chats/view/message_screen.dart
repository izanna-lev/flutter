import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:tralever_module/custem_class/constant/app_colors.dart';
import 'package:tralever_module/models/chats/chat_list_model.dart';
import 'package:tralever_module/ui/screen/chats/view/post_details_bottom_view.dart';

import '../../../../custem_class/constant/app_functions.dart';
import '../../../../custem_class/utils/globle.dart';
import '../controller/chat_screen_controller.dart';

class MessageScreen extends StatefulWidget {
  static const String routeName = "/MessageScreen";
  // final String businessRef;
  // final String channelRef;
  // final String userName;
  // final AllChatData? allChatData;

  MessageScreen({
    Key? key,
    // required this.businessRef,
    // required this.channelRef,
    // required this.userName,
    // this.allChatData
  }) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final ChatScreenController chatScreenController =
      Get.put(ChatScreenController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        disposeKeyboard();
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            centerTitle: true,
            title: Text(
              userController.userModel?.user.name ?? "Lisa parker",
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          body: GetBuilder(
            builder: (ChatScreenController controller) {
              return controller.channelRef == "" &&
                      controller.getMessages.isEmpty
                  ? GetPlatform.isAndroid
                      ? const Center(
                          child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ))
                      : const Center(child: CupertinoActivityIndicator())
                  : Stack(
                      children: [
                        ListView.builder(
                          /// controller: scrollController,
                          reverse: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.getMessages.length,
                          padding: const EdgeInsets.only(
                              bottom: 90, left: 13, right: 13),
                          itemBuilder: (context, index) {
                            return messageBoxView(
                              controller.getMessages[index],
                            );
                          },
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            left: 0,
                            child: SafeArea(
                              child: PostDetailsBottomView(
                                comment: chatScreenController.messageText,
                                send: () {
                                  if (chatScreenController.messageText.text
                                      .trim()
                                      .isNotEmpty) {
                                    chatScreenController.sendMessages();
                                  }
                                },
                                hintText: 'textfieldmsg2',
                              ),
                            ))
                      ],
                    );
            },
          )),
    );
  }

  messageBoxView(Message message) {
    if (message.id == userController.userModel!.user.id) {
      // Right (my message)

      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.appBlueColor,
                borderRadius: BorderRadius.circular(22)),
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.only(left: 50),
            child: Text(message.message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                )),
          ),
          const SizedBox(height: 7),
          // getHeightSizedBox(h: 7),
          Padding(
            padding: const EdgeInsets.only(right: 7),
            child: Text(
              DateTimeFormatExtension.displayMSGTimeFromTimestamp(
                  message.createdOn.toLocal()),
              style: const TextStyle(color: Color(0xff7C8392), fontSize: 11),
            ),
          ),
          const SizedBox(height: 4),
          // getHeightSizedBox(h: 4),
        ],
      );
    } else {
      // Left (defence message)

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: const Color(0xffF3F3F3),
                borderRadius: BorderRadius.circular(22)),
            margin: const EdgeInsets.only(right: 50),
            padding: const EdgeInsets.all(15),

            child: Text(message.message,
                style: const TextStyle(
                  fontSize: 14,
                )),
            // margin: const EdgeInsets.only(left: 10.0),
          ),
          // getHeightSizedBox(h: 7),
          const SizedBox(height: 7),
          Padding(
            padding: const EdgeInsets.only(right: 7),
            child: Text(
              DateTimeFormatExtension.displayMSGTimeFromTimestamp(
                  message.createdOn.toLocal()),
              style: const TextStyle(color: Color(0xff7C8392), fontSize: 11),
            ),
          ),
          // getHeightSizedBox(h: 4),
          const SizedBox(height: 4),
        ],
      );
    }
  }
}
