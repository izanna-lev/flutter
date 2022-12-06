import 'dart:convert';

import 'package:tralever_module/custem_class/utils/globle.dart';
import 'package:tralever_module/models/notifications_model/traveller_notification_model.dart';

import '../../models/notifications_model/notifications_model.dart';
import '../../models/notifications_model/traveller_notification_seen.dart';
import '../api_handler.dart';
import '../api_routes.dart';

class NotificationRepo {
  static Future<NotificationModel?> notificationRepo({
    required int page,
    required String userFilter,
  }) async {
    var responseBody = await API.apiHandler(
      header: {'Content-Type': 'application/json'},
      url: APIRoutes.notificationUserSelectList,
      showLoader: false,
      requestType: RequestType.Post,
      body: jsonEncode({
        "page": page,
        "userFilter": userFilter,
      }),
    );
    if (responseBody != null) {
      return NotificationModel.fromJson(responseBody);
    }
  }

  static Future<TravellerNotificationListModel?> travellerNotificationList(
      {required int page}) async {
    var responseBody = await API.apiHandler(
        header: {
          'Authorization': userController.rowndSignInModel!.data.accessToken
        },
        url: APIRoutes.travellerNotificationList,
        showLoader: false,
        requestType: RequestType.Post,
        body: jsonEncode({"page": page}));
    if (responseBody != null) {
      return TravellerNotificationListModel.fromJson(responseBody);
    }
  }

  static Future<TravellerNotificationSeenModel?> travellerNotificationDSeen(
      {required String notificationRef}) async {
    var responseBody = await API.apiHandler(
      header: {
        'Authorization': userController.rowndSignInModel!.data.accessToken,
        "Content-Type": "application/json"
      },
      url: APIRoutes.travellerNotificationSeen,
      showLoader: false,
      requestType: RequestType.Post,
      body: json.encode(
        {
          "notificationRef": notificationRef,
        },
      ),
    );
    if (responseBody != null) {
      return TravellerNotificationSeenModel.fromJson(responseBody);
    }
    return null;
  }
}
