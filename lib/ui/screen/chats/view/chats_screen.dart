import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tralever_module/custem_class/constant/app_settings.dart';
import 'package:tralever_module/services/api_routes.dart';
import 'package:tralever_module/ui/screen/base_screen/controller/base_screen_controller.dart';
import 'package:tralever_module/ui/screen/chats/controller/chat_screen_controller.dart';

import '../../../../custem_class/constant/app_colors.dart';
import '../../../../custem_class/utils/globle.dart';
import 'message_screen.dart';

class ChatsScreen extends StatefulWidget {
  static const String routeName = "/ChatsScreen";

  const ChatsScreen({Key? key}) : super(key: key);

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  BaseScreenController baseScreenController = Get.find<BaseScreenController>();
  ChatScreenController chatScreenController = Get.find<ChatScreenController>();

  @override
  void initState() {
    chatScreenController.userChatListData(0);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: GetBuilder(
          builder: (ChatScreenController chatScreenController) {
            return ListView.builder(
              itemCount: chatScreenController.chatData.length,
              // itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(MessageScreen.routeName, arguments: {
                      "channelRef":
                          chatScreenController.chatData[index].channelRef,
                      "specialistRef":
                          chatScreenController.chatData[index].specialistRef,
                      "specialistName":
                          chatScreenController.chatData[index].specialistName
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.transparent,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.topRight,
                                children: [
                                  Container(
                                    height: 41,
                                    width: 41,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          imageUrl +
                                              chatScreenController
                                                  .chatData[index].image,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),

                                  /// blue dot
                                  chatScreenController
                                              .chatData[index].unseenMessages ==
                                          true
                                      ? const SizedBox()
                                      : Container(
                                          height: 10,
                                          width: 10,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: AppColors.appBlueColor,
                                            // color: const Color(0xffC90E0E),
                                          ),
                                        ),
                                ]),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    chatListDate(
                                      chatScreenController
                                          .chatData[index].fromDate
                                          .toString(),
                                    ),
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    chatScreenController
                                        .chatData[index].location
                                        .toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              chatListTime(chatScreenController
                                  .chatData[index].toDate
                                  .toString()),
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                );
              },
            );
            //   PaginationView(
            //   key: chatController.chatListKey,
            //   scrollDirection: Axis.vertical,
            //   physics: const AlwaysScrollableScrollPhysics(),
            //   pullToRefresh: true,
            //   bottomLoader: const AppLoader(),
            //   itemBuilder: (BuildContext context, ChatListModel chatListModel,
            //       int index) {
            //     return ListView.builder(
            //       itemCount: chatScreenController.chatData.length,
            //       itemBuilder: (BuildContext context, int index) {
            //         return GestureDetector(
            //           onTap: () {
            //             Get.toNamed(ChatRoomScreen.routeName);
            //           },
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.start,
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Container(
            //                 color: Colors.transparent,
            //                 child: Row(
            //                   crossAxisAlignment: CrossAxisAlignment.end,
            //                   children: [
            //                     Stack(
            //                         clipBehavior: Clip.none,
            //                         alignment: Alignment.topRight,
            //                         children: [
            //                           Container(
            //                             height: 41,
            //                             width: 41,
            //                             decoration: BoxDecoration(
            //                               borderRadius:
            //                                   BorderRadius.circular(20),
            //                               image: DecorationImage(
            //                                 image: NetworkImage(
            //                                   imageUrl +
            //                                       chatScreenController
            //                                           .chatData[index].image,
            //                                 ),
            //                                 fit: BoxFit.cover,
            //                               ),
            //                             ),
            //                           ),
            //
            //                           /// blue dot
            //                           chatScreenController.chatData[index]
            //                                       .unseenMessages ==
            //                                   true
            //                               ? const SizedBox()
            //                               : Container(
            //                                   height: 10,
            //                                   width: 10,
            //                                   decoration: BoxDecoration(
            //                                     borderRadius:
            //                                         BorderRadius.circular(10),
            //                                     color: AppColors.appBlueColor,
            //                                     // color: const Color(0xffC90E0E),
            //                                   ),
            //                                 ),
            //                         ]),
            //                     const SizedBox(width: 10),
            //                     Expanded(
            //                       child: Column(
            //                         crossAxisAlignment:
            //                             CrossAxisAlignment.start,
            //                         children: [
            //                           Text(
            //                             chatListDate(
            //                               chatScreenController
            //                                   .chatData[index].fromDate
            //                                   .toString(),
            //                             ),
            //                             style: const TextStyle(
            //                               fontSize: 15,
            //                               fontWeight: FontWeight.w500,
            //                             ),
            //                           ),
            //                           Text(
            //                             chatScreenController
            //                                 .chatData[index].location
            //                                 .toString(),
            //                             maxLines: 1,
            //                             overflow: TextOverflow.ellipsis,
            //                             style: const TextStyle(
            //                               fontSize: 13,
            //                             ),
            //                           ),
            //                         ],
            //                       ),
            //                     ),
            //                     Text(
            //                       chatListTime(chatScreenController
            //                           .chatData[index].toDate
            //                           .toString()),
            //                       style: const TextStyle(
            //                         color: Colors.grey,
            //                         fontSize: 12,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               const SizedBox(height: 20),
            //             ],
            //           ),
            //         );
            //       },
            //     );
            //   },
            //   pageFetch: chatController.userChatListData,
            //   onEmpty: Center(
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         IconButton(
            //           onPressed: () {
            //             chatController.chatListKey.currentState!.refresh();
            //           },
            //           icon: const Icon(
            //             Icons.refresh,
            //             color: Colors.white,
            //           ),
            //         ),
            //         const Text("No data found"),
            //       ],
            //     ),
            //   ),
            //   onError: (error) {
            //     return const Center(
            //       child: Text("No comments here yet."),
            //     );
            //   },
            //   initialLoader: GetPlatform.isAndroid
            //       ? const Center(
            //           child: AppLoader(),
            //         )
            //       : const Center(
            //           child: CupertinoActivityIndicator(),
            //         ),
            // );
          },
        ),
      ),
    );
  }

  appbarText({required String text}) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
