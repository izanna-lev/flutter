import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pagination_view/pagination_view.dart';
import 'package:tralever_module/services/chats_repo/chat_repo.dart';

import '../../../../custem_class/utils/globle.dart';
import '../../../../models/chats/chat_list_model.dart';
import '../../../../models/login/successModel.dart';
import '../../../../services/api_routes.dart';
import '../../../../services/chats_repo/chatRepo.dart';
import '../../../shared/image_picker_controller.dart';

class ChatScreenController extends GetxController {
  int start = resourceAPIPaginationStart;
  GlobalKey<PaginationViewState> chatListKey = GlobalKey<PaginationViewState>();
  ImagePickerController imagePickerController =
      Get.find<ImagePickerController>();
  List<ChatListModel> _chatData = [];

  List<ChatListModel> get chatData => _chatData;

  set chatData(List<ChatListModel> value) {
    _chatData = value;
    update();
  }

  Future<List<ChatListModel>> userChatListData(int offset) async {
    if (offset == 0) start = resourceAPIPaginationStart;
    if (start == 0) return [];
    ChatModel? chatModel = await ChatScreenRepo.chatScreenRepo(
      page: start,
    );
    if (chatModel != null) {
      chatData = chatModel.data;
      if (chatModel.size < chatModel.limit) {
        start = 0;
      } else {
        start += 1;
      }
      return chatData;
    }

    return [];
  }

  travellerChatImage() async {
    SuccessModel? successModel = await ChatRepo.travellerChatImage(
        picture: imagePickerController.image.isEmpty
            ? null
            : File(imagePickerController.image));
    if (successModel != null) {
      return successModel;
    }
  }

// String businessRef = "";
// String channelRef = "";
// List<Message> getMessages = [];
// final TextEditingController messageText = TextEditingController();
// Future sendMessages() async {
//   String msg = messageText.text.trim();
//   messageText.clear();
//   debugPrint("sendMessages");
//   SocketManager.socket!.emit('message', {
//     "channelRef": channelRef,
//     "message": msg,
//     "id": userController.userModel!.user.id
//   });
// }
}
