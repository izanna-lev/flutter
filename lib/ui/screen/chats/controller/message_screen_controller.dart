import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pagination_view/pagination_view.dart';
import 'package:tralever_module/models/chats/chat_list_model.dart';
import 'package:tralever_module/ui/screen/chats/view/soket_managet.dart';

import '../../../../models/login/successModel.dart';
import '../../../../services/api_routes.dart';
import '../../../../services/chats_repo/chatRepo.dart';
import '../../../shared/image_picker_controller.dart';

class MessageScreenController extends GetxController {
  final TextEditingController messageText = TextEditingController();
  ImagePickerController imagePickerController =
      Get.find<ImagePickerController>();
  GlobalKey<PaginationViewState> messageListKey =
      GlobalKey<PaginationViewState>();

  int start = resourceAPIPaginationStart;

  List<Message> _messageList = [];
  List<Message> get messageList => _messageList;
  set messageList(List<Message> value) {
    _messageList = value;
    update();
  }

  ItineraryMessageModel _itinerary = ItineraryMessageModel.fromJson({});
  ItineraryMessageModel get itinerary => _itinerary;
  set itinerary(ItineraryMessageModel value) {
    _itinerary = value;
    update();
  }

  // ItineraryDetailsListModel _itineraryDetailsListModel =
  //     ItineraryDetailsListModel.fromJson({});
  //
  // ItineraryDetailsListModel get itineraryDetailsListModel =>
  //     _itineraryDetailsListModel;
  //
  // set itineraryDetailsListModel(ItineraryDetailsListModel value) {
  //   _itineraryDetailsListModel = value;
  //   update();
  // }

  Future<List<Message>> getMessageList(int offset) async {
    if (offset == 0) start = resourceAPIPaginationStart;
    if (start == 0) return [];
    MessageDataResponse? response = await ChatRepo.getAllChatList(
        page: start, channelId: SocketManager.channelRef);
    if (response != null) {
      if (start == 0) {
        messageList = [];
      }
      messageList = response.messages;
      itinerary = response.itinerary;
      if (response.messages.length < 30) {
        start = 0;
      } else {
        start += 1;
      }
      return messageList;
    }
    return [];
  }

  Future<SuccessModel?> uploadTravellerChatImage(File image) async {
    if (image != null) {
      SuccessModel? successModel =
          await ChatRepo.travellerChatImage(picture: image);
      if (successModel != null) {
        return successModel;
      }
    }
    return null;
  }
}
