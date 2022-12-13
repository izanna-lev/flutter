import 'dart:convert';
import 'dart:io';

import 'package:tralever_module/custem_class/constant/app_functions.dart';
import 'package:tralever_module/custem_class/utils/globle.dart';
import 'package:tralever_module/custem_class/utils/local_storage.dart';
import 'package:tralever_module/models/chats/chat_list_model.dart';

import '../../models/chats/get_channel_model.dart';
import '../../models/login/successModel.dart';
import '../api_handler.dart';
import '../api_routes.dart';

class ChatRepo {
  static Future<GetChannelModel?> getChannel({
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
      return GetChannelModel.fromJson(responseBody);
    } else {
      return null;
    }
  }

  static Future<MessageDataResponse?> getAllChatList({
    required int page,
    required String channelId,
  }) async {
    var responseBody = await API.apiHandler(
        url: APIRoutes.travellerMessageList,
        requestType: RequestType.Post,
        showLoader: false,
        header: {
          'Authorization': userController.rowndSignInModel!.data.accessToken,
          "Content-Type": 'application/json',
        },
        body: jsonEncode({
          "page": page,
          "channelId": channelId,
        }));
    if (responseBody != null) {
      MessageListResponse messageListResponse =
          MessageListResponse.fromJson(responseBody);
      if (messageListResponse.code == 100) {
        return messageListResponse.data;
      }
    } else {
      return null;
    }
  }

  static Future<SuccessResponse?> reportUser({
    required String specialistRef,
    required String reason,
  }) async {
    var responseBody = await API.apiHandler(
        url: APIRoutes.reportAdd,
        requestType: RequestType.Post,
        showLoader: true,
        header: {
          "Content-Type": 'application/json',
          'Authorization': userController.rowndSignInModel!.data.accessToken,
        },
        body: jsonEncode({
          "specialistRef": specialistRef,
          "reason": reason,
        }));
    if (responseBody != null) {
      SuccessResponse successResponse = SuccessResponse.fromJson(responseBody);
      if (successResponse.code == 100) {
        return successResponse;
      } else {
        flutterToast(successResponse.message);
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<SuccessResponse?> blockUser({
    required String specialistRef,
    required String itineraryRef,
  }) async {
    var responseBody = await API.apiHandler(
        url: APIRoutes.travellerActions,
        requestType: RequestType.Post,
        showLoader: true,
        header: {
          'Authorization': userController.rowndSignInModel!.data.accessToken,
          "Content-Type": 'application/json'
        },
        body: jsonEncode({
          "specialistRef": specialistRef,
          "itineraryRef": itineraryRef,
        }));
    if (responseBody != null) {
      SuccessResponse successResponse = SuccessResponse.fromJson(responseBody);
      if (successResponse.code == 100) {
        return successResponse;
      } else {
        flutterToast(successResponse.message);
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<SuccessResponse?> getMessageUnreadCount() async {
    if (LocalStorage.isUserSignIn()) {
      return null;
    }
    var responseBody = await API.apiHandler(
        url: APIRoutes.travellerUnread,
        requestType: RequestType.Post,
        showLoader: true,
        header: {
          'Authorization': userController.rowndSignInModel!.data.accessToken,
          "Content-Type": 'application/json'
        },
        body: jsonEncode({}));
    if (responseBody != null) {
      SuccessResponse successResponse = SuccessResponse.fromJson(responseBody);
      if (successResponse.code == 100) {
        return successResponse;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<SuccessModel?> travellerChatImage(
      {File? picture, String? token}) async {
    Map<String, dynamic>? responseBody = await API.multiPartAPIHandler(
        token: userController.rowndSignInModel!.data.accessToken,
        url: APIRoutes.travellerChatImage,
        field: {"data": jsonEncode({})},
        fileImage: picture,
        multiPartImageKeyName: "image",
        encoding: Encoding.getByName("utf-8"));
    return responseBody == null ? null : SuccessModel.fromJson(responseBody);
  }
}
