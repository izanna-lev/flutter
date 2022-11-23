import 'dart:convert';

import '../../custem_class/utils/globle.dart';
import '../../models/chats/chat_list_model.dart';
import '../api_handler.dart';
import '../api_routes.dart';

class ChatScreenRepo {
  static Future<ChatModel?> chatScreenRepo({
    required int page,
  }) async {
    var responseBody = await API.apiHandler(
      url: APIRoutes.travellerChatList,
      showLoader: false,
      requestType: RequestType.Post,
      header: {
        'Authorization': userController.rowndSignInModel!.data.accessToken
      },
      body: jsonEncode({
        "page": page,
      }),
    );
    if (responseBody != null) {
      return ChatModel.fromJson(responseBody);
    }
  }
}
