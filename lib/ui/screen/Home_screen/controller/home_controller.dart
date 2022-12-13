import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pagination_view/pagination_view.dart';
import 'package:tralever_module/services/home_repo/home_screen_repo.dart';

import '../../../../models/home/travels_plans_model.dart';
import '../../../../services/api_routes.dart';
import '../../notification/controller/Notification_controller.dart';

class HomeController extends GetxController {
  NotificationScreenController notificationScreenController =
      Get.find<NotificationScreenController>();

  int start = resourceAPIPaginationStart;
  GlobalKey<PaginationViewState> pendingKey = GlobalKey<PaginationViewState>();
  GlobalKey<PaginationViewState> currentKey = GlobalKey<PaginationViewState>();
  GlobalKey<PaginationViewState> pastKey = GlobalKey<PaginationViewState>();

  List<TravelPlansListModel> _travelPlansData = [];
  List<TravelPlansListModel> get travelPlansData => _travelPlansData;
  set travelPlansData(List<TravelPlansListModel> value) {
    _travelPlansData = value;
    update();
  }

  /// Current data
  Future<List<TravelPlansListModel>> currentData(int offset) async {
    if (offset == 0) start = resourceAPIPaginationStart;
    if (start == 0) return [];
    print("API CALL FOR HOME 2");
    TravelPlansModel? travelPlansModel = await HomeScreenRepo.homeScreenRepo(
      page: start,
      listType: 1,
      // itineraryStatus: 1,
    );
    if (travelPlansModel != null) {
      travelPlansData = travelPlansModel.data;
      if (travelPlansModel.size < travelPlansModel.limit) {
        start = 0;
      } else {
        start += 1;
      }
      return travelPlansData;
    }

    return [];
  }

  /// Pending data

  Future<List<TravelPlansListModel>> pendingData(int offset) async {
    if (offset == 0) start = resourceAPIPaginationStart;
    if (start == 0) return [];
    print("API CALL FOR HOME 1");

    TravelPlansModel? travelPlansModel = await HomeScreenRepo.homeScreenRepo(
      page: start,
      listType: 2,
      // itineraryStatus: 2,
    );
    if (travelPlansModel != null) {
      travelPlansData = travelPlansModel.data;
      if (travelPlansModel.size < travelPlansModel.limit) {
        start = 0;
      } else {
        start += 1;
      }
      return travelPlansData;
    }
    return [];
  }

  /// Past data

  Future<List<TravelPlansListModel>> pastData(int offset) async {
    if (offset == 0) start = resourceAPIPaginationStart;
    if (start == 0) return [];
    print("API CALL FOR HOME 3");
    TravelPlansModel? travelPlansModel = await HomeScreenRepo.homeScreenRepo(
      page: start,
      listType: 3,
      // itineraryStatus: 3,
    );
    if (travelPlansModel != null) {
      travelPlansData = travelPlansModel.data;
      if (travelPlansModel.size < travelPlansModel.limit) {
        start = 0;
      } else {
        start += 1;
      }
      return travelPlansData;
    }

    return [];
  }

  @override
  void onInit() {
    // TODO: implement onInit
    notificationScreenController.travellerNotificationList(0);
    super.onInit();
  }
}
