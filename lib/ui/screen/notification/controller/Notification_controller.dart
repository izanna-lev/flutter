import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pagination_view/pagination_view.dart';
import 'package:tralever_module/models/notifications_model/traveller_notification_model.dart';
import 'package:tralever_module/services/notification_repo/notifications_repo.dart';

import '../../../../models/notifications_model/notifications_model.dart';
import '../../../../services/api_routes.dart';

class NotificationScreenController extends GetxController {
  GlobalKey<PaginationViewState> notificationKey =
      GlobalKey<PaginationViewState>();
  // int start = resourceAPIPaginationStart;
  int start = travellerNotificationAPIPaginationStart;

  List<NotificationList> _notificationListData = [];
  List<NotificationList> get notificationListData => _notificationListData;
  set notificationListData(List<NotificationList> value) {
    _notificationListData = value;
    update();
  }

  List<TravellerDetailsNotificationList> _travellerDetailsNotificationList = [];
  List<TravellerDetailsNotificationList> get travellerDetailsNotificationList =>
      _travellerDetailsNotificationList;
  set travellerDetailsNotificationList(
      List<TravellerDetailsNotificationList> value) {
    _travellerDetailsNotificationList = value;
    update();
  }

  /// notificationList Api.
  /// error Size  And Limit parameter is not come from back-end.
  ///  Repo and Model is Completed.

  // Future<List<NotificationList>> pendingData(int offset) async {
  //   if (offset == 0) start = resourceAPIPaginationStart;
  //   if (start == 0) return [];
  //   NotificationModel? notificationModel =
  //       await NotificationRepo.notificationRepo(
  //     page: start,
  //     userFilter: 1.toString(),
  //   );
  //   if (notificationModel != null) {
  //     notificationListData = notificationModel.data;
  //     if (notificationModel.size < notificationModel.limit) {
  //       start = 0;
  //     } else {
  //       start += 1;
  //     }
  //     return notificationListData;
  //   }
  //
  //   return [];
  // }

  Future<List<TravellerDetailsNotificationList>> travellerNotificationList(
      int offset) async {
    if (offset == 0) start = travellerNotificationAPIPaginationStart;
    if (start == 0) return [];
    TravellerNotificationListModel? travellerNotificationListModel =
        await NotificationRepo.travellerNotificationList(page: start);
    if (travellerNotificationListModel != null) {
      travellerDetailsNotificationList = travellerNotificationListModel.data;
      if (travellerNotificationListModel.size <
          travellerNotificationListModel.limit) {
        start = 0;
      } else {
        start += 1;
      }
      return travellerDetailsNotificationList;
    }
    return [];
  }

  notificationDateAndTime(DateTime timestamp) {
    var v = DateTime.now().difference(timestamp);
    if (v.inHours < 24) {
      return "${"today".tr} ${timeFormat(timestamp)}";
    } else {
      var outputFormat = DateFormat('dd-MMM-yyyy');
      var outputDate = outputFormat.format(timestamp);
      return outputDate;
    }
  }

  timeFormat(DateTime timestamp) {
    var outputFormat = DateFormat('h:mm a');
    var outputDate = outputFormat.format(timestamp);
    return outputDate;
  }
}
