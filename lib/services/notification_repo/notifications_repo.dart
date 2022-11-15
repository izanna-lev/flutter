import 'dart:convert';

import '../../models/notifications_model/notifications_model.dart';
import '../api_handler.dart';
import '../api_routes.dart';

class NotificationRepo {
  static Future<NotificationModel?> notificationRepo({
    required int page,
    required String userFilter,
  }) async {
    var responseBody = await API.apiHandler(
      header: {'Content-Type': 'application/json'},
      url: APIRoutes.notificationList,
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
}
