import 'package:get/get.dart';
import '../../../../models/notifications_model/notifications_model.dart';
import '../../../../services/api_routes.dart';

class NotificationScreenController extends GetxController {
  int start = resourceAPIPaginationStart;
  List<NotificationList> _notificationListData = [];

  List<NotificationList> get notificationListData => _notificationListData;

  set notificationListData(List<NotificationList> value) {
    _notificationListData = value;
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
}
