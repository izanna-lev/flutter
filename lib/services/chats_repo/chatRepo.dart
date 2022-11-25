import 'dart:convert';

import '../../custem_class/utils/globle.dart';
import '../../models/chats/chat_list_model.dart';
import '../api_handler.dart';
import '../api_routes.dart';

class ChatRepo {
  static Future getChannel({
    required String itineraryRef,
  }) async {
    var responseBody = await API.apiHandler(
        url: APIRoutes.travellerGetChannel,
        showLoader: false,
        header: {
          'Content-Type': 'application/json',
          'Authorization': userController.rowndSignInModel!.data.accessToken
        },
        body: jsonEncode({"itineraryRef": itineraryRef}));
    if (responseBody != null) {
      return responseBody;
    } else {
      return null;
    }
  }

  // static Future<MessageModel?> getAllMessages(
  //     {required String channelRef, required int page}) async {
  //   var responseBody = await API.apiHandler(
  //       url: APIRoutes.getMessages,
  //       showLoader: false,
  //       header: {
  //         'Content-Type': 'application/json',
  //         'Authorization': userController.rowndSignInModel!.data.accessToken
  //       },
  //       body: jsonEncode({"channelRef": channelRef, "page": page}));
  //   if (responseBody != null)
  //     return MessageModel.fromJson(responseBody);
  //   else
  //     return null;
  // }
  static Future<ChatListModel?> getAllChatLIst({
    required int page,
    required String channelId,
  }) async {
    var responseBody = await API.apiHandler(
        url: APIRoutes.travellerMessageList,
        showLoader: false,
        header: {
          'Authorization': userController.rowndSignInModel!.data.accessToken
        },
        body: jsonEncode({
          "page": page,
          "channelId": channelId,
        }));
    if (responseBody != null) {
      return ChatListModel.fromJson(responseBody);
    } else {
      return null;
    }
  }
}
