import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pagination_view/pagination_view.dart';
import 'package:tralever_module/services/chats_repo/chat_repo.dart';

import '../../../../models/chats/chat_list_model.dart';
import '../../../../services/api_routes.dart';

class ChatController extends GetxController {
  int start = resourceAPIPaginationStart;
  GlobalKey<PaginationViewState> chatListKey = GlobalKey<PaginationViewState>();
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
}
