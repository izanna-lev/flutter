import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tralever_module/models/chats/chat_list_model.dart';

import '../../../../models/home/itinerary_details_model.dart';
import '../../../../services/chats_repo/chatRepo.dart';

class MessageScreenController extends GetxController {
  final TextEditingController messageText = TextEditingController();

  List<Message> _messageList = [];
  List<Message> get messageList => _messageList;
  set messageList(List<Message> value) {
    _messageList = value;
    update();
  }

  Itinerary _itinerary = Itinerary.fromJson({});
  Itinerary get itinerary => _itinerary;
  set itinerary(Itinerary value) {
    _itinerary = value;
    update();
  }

  Future<void> getMessageList({
    required String channelId,
    required int page,
  }) async {
    MessageDataResponse? response =
        await ChatRepo.getAllChatList(page: page, channelId: channelId);
    if (response != null) {
      messageList = response.messages;
      itinerary = response.itinerary;
      return;
    }
  }
}
