import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:tralever_module/custem_class/constant/app_colors.dart';
import 'package:tralever_module/models/chats/chat_list_model.dart';
import 'package:tralever_module/services/chats_repo/chatRepo.dart';
import 'package:tralever_module/ui/screen/chats/controller/message_screen_controller.dart';
import 'package:tralever_module/ui/screen/chats/view/post_details_bottom_view.dart';
import 'package:tralever_module/ui/screen/chats/view/report_screen.dart';
import 'package:tralever_module/ui/screen/chats/view/soket_managet.dart';
import '../../../../custem_class/constant/app_functions.dart';
import '../../../../custem_class/utils/globle.dart';
import '../../../shared/bottomsheet.dart';
import '../controller/chat_screen_controller.dart';

class MessageScreen extends StatefulWidget {
  static const String routeName = "/MessageScreen";

  MessageScreen({Key? key}) : super(key: key);
  String channelRef = Get.arguments["channelRef"] ?? "";
  String otherUserRef = Get.arguments["specialistRef"] ?? "";
  String otherUsername = Get.arguments["specialistName"] ?? "";

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final MessageScreenController messageScreenController =
      Get.put(MessageScreenController());
  final ChatScreenController chatScreenController =
      Get.put(ChatScreenController());

  @override
  void initState() {
    messageScreenController.getMessageList(
        channelId: widget.channelRef, page: 1);
    SocketManager.channelRef = widget.channelRef;
    SocketManager.getMessagesListener();
    super.initState();
  }

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
            title: GetBuilder(builder: (MessageScreenController controller) {
              return Text(
                widget.otherUsername == ""
                    ? controller.itinerary.otherUserName
                    : widget.otherUsername,
                style: const TextStyle(
                  color: Colors.black,
                ),
              );
            }),
            actions: [
              IconButton(
                  onPressed: () {
                    showMoreOption();
                  },
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.black,
                  ))
            ],
          ),
          body: GetBuilder(
            builder: (MessageScreenController controller) {
              return widget.channelRef == "" && controller.messageList.isEmpty
                  ? GetPlatform.isAndroid
                      ? const Center(
                          child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ))
                      : const Center(child: CupertinoActivityIndicator())
                  : Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            /// controller: scrollController,
                            reverse: true,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: controller.messageList.length,
                            padding: const EdgeInsets.only(
                                bottom: 10, left: 13, right: 13),
                            itemBuilder: (context, index) {
                              return messageBoxView(
                                message: controller.messageList[index],
                              );
                            },
                          ),
                        ),
                        SafeArea(
                          child: PostDetailsBottomView(
                            comment: controller.messageText,
                            send: () {
                              if (controller.messageText.text
                                  .trim()
                                  .isNotEmpty) {
                                Map message = {
                                  "message": controller.messageText.text.trim(),
                                  "channelRef": widget.channelRef,
                                  "id": userController
                                      .rowndSignInModel!.data.traveller.id,
                                  "messageType": 1,
                                  "type": 2
                                };
                                SocketManager.sendMessage(message);
                                controller.messageText.text = "";
                              }
                            },
                            attachFile: () {
                              appImagePicker.openBottomSheet();
                            },
                            hintText: 'Type Here',
                          ),
                        )
                      ],
                    );
            },
          )),
    );
  }

  messageBoxView({required Message message}) {
    if (message.userRef == userController.rowndSignInModel!.data.traveller.id) {
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
                  DateTimeFormatExtension.getUTCDateFromString(
                      message.createdOn)),
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
                  DateTimeFormatExtension.getUTCDateFromString(
                      message.createdOn)),
              style: const TextStyle(color: Color(0xff7C8392), fontSize: 11),
            ),
          ),
          // getHeightSizedBox(h: 4),
          const SizedBox(height: 4)
        ],
      );
    }
  }

  showMoreOption() async {
    disposeKeyboard();
    openBottomSheet(
        title1: "Report Specialist",
        title2: "Block User",
        onTap1: () {
          Get.back();
          Get.toNamed(ReportScreen.routeName, arguments: widget.otherUserRef);
        },
        onTap2: () async {
          Get.back();
          SuccessResponse? response = await ChatRepo.blockUser(
              specialistRef: widget.otherUserRef,
              itineraryRef: messageScreenController.itinerary.id);
          if (response != null) {
            Get.back();
          }
        });
  }
}
