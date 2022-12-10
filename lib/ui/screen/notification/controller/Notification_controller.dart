import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pagination_view/pagination_view.dart';
import 'package:tralever_module/models/notifications_model/traveller_notification_model.dart';
import 'package:tralever_module/services/notification_repo/notifications_repo.dart';

import '../../../../models/notifications_model/notifications_model.dart';
import '../../../../models/notifications_model/traveller_notification_seen.dart';
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

  bool? _unseenNotifications;
  bool? get unseenNotifications => _unseenNotifications;
  set unseenNotifications(bool? value) {
    _unseenNotifications = value;
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

  TravellerNotificationListModel _travellerNotificationListModel =
      TravellerNotificationListModel.fromJson({});
  TravellerNotificationListModel get travellerNotificationListModel =>
      _travellerNotificationListModel;
  set travellerNotificationListModel(TravellerNotificationListModel value) {
    _travellerNotificationListModel = value;
    update();
  }

  TravellerNotificationSeenDetailsModel? _travellerNotificationSeenDetailsModel;
  TravellerNotificationSeenDetailsModel?
      get travellerNotificationSeenDetailsModel =>
          _travellerNotificationSeenDetailsModel;

  set travellerNotificationSeenDetailsModel(
      TravellerNotificationSeenDetailsModel? value) {
    _travellerNotificationSeenDetailsModel = value;
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

  Future<TravellerNotificationSeenDetailsModel?> travellerNotificationSeen(
      {required String notificationRef}) async {
    TravellerNotificationSeenModel? travellerNotificationSeenModel =
        await NotificationRepo.travellerNotificationDSeen(
            notificationRef: notificationRef);
    if (travellerNotificationSeenModel != null) {
      travellerNotificationSeenDetailsModel =
          travellerNotificationSeenModel.data;
    }
    return travellerNotificationSeenDetailsModel;
  }
}
