import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tralever_module/custem_class/constant/app_colors.dart';
import 'package:tralever_module/custem_class/constant/app_icons.dart';
import 'package:tralever_module/ui/screen/chats/controller/chat_screen_controller.dart';
import 'package:tralever_module/ui/screen/notification/controller/Notification_controller.dart';

import '../../../../custem_class/constant/app_functions.dart';
import '../../../../custem_class/constant/app_settings.dart';
import '../../../../custem_class/utils/globle.dart';
import '../../notification/view/notification_screen.dart';
import '../controller/base_screen_controller.dart';

class BaseScreen extends StatefulWidget {
  static const String routeName = "/BaseScreen";

  const BaseScreen({Key? key}) : super(key: key);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  BaseScreenController baseScreenController = Get.find<BaseScreenController>();
  NotificationScreenController notificationScreenController =
  Get.find<NotificationScreenController>();
  DateTime? currentBackPressTime;


  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      flutterToast("Press again to exit");
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  void initState() {
    baseScreenController.update();
    notificationScreenController.update();
    baseScreenController.selectedTab = 0;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: GetBuilder(
            builder: (BaseScreenController baseScreenController) {
              return baseScreenController.selectedTab == 0
                  ? appbarText(text: "Travel Plans")
                  : baseScreenController.selectedTab == 1
                  ? appbarText(text: "Chats")
                  : baseScreenController.selectedTab == 2
                  ? appbarText(text: "Profile")
                  : appbarText(text: "Settings");
            },
          ),
          actions: [
            GetBuilder(
              builder: (BaseScreenController baseScreenController) {
                if (baseScreenController.selectedTab == 0) {
                  return GetBuilder(
                    builder: (NotificationScreenController
                    notificationScreenController) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 12),
                        child: Stack(
                          //alignment: Alignment.topRight,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(NotificationScreen.routeName);
                              },
                              child: Image.asset(
                                AppIcons.notificationIcon,
                                scale: 3.5,
                              ),
                            ),
                            baseScreenController.notiUnreadCount
                                ? const Positioned(
                              top: 2,
                              right: 5,
                              child: Center(
                                child: Icon(
                                  Icons.circle,
                                  color: AppColors.appBlueColor,
                                  size: 10,
                                ),
                              ),
                            )
                                : const SizedBox()
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return const SizedBox();
                }
              },
            )
          ],
        ),
        body: GetBuilder(
          builder: (BaseScreenController controller) => IndexedStack(
            index: controller.selectedTab,
            children: navigationScreensWithHome,
          ),
        ),
        bottomNavigationBar: bottomBar(context),
      ),
    );
  }

  BottomAppBar bottomBar(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      elevation: 100,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.5,
            ),
          ],
        ),
        child: GetBuilder(
          builder: (BaseScreenController controller) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: navigationTabList
                .asMap()
                .map(
                  (key, value) => MapEntry(
                key,
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.find<BaseScreenController>().selectedTab = key;
                    },
                    child: Container(
                      color: controller.selectedTab == key
                          ? AppColors.appBlueColor
                          : Colors.white,
                      height: 55,
                      width: MediaQuery.of(context).size.width / 4,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 5),
                            Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.topRight,
                              children: [
                                SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: Image.asset(
                                    value.icon,
                                    height: 20,
                                    width: 20,
                                    color: controller.selectedTab == key
                                        ? Colors.white
                                        : Colors.grey.shade700,
                                  ),
                                ),
                                GetBuilder(
                                  builder: (ChatScreenController chatScreencontroller) =>
                                  (value.name == "Chats" &&
                                      chatScreencontroller.unseenChats > 0)
                                      ? Positioned(
                                    left: 15,
                                    bottom: 15,
                                    // bottom: 15,
                                    child: Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          color:
                                          AppColors.appBlueColor),
                                      child: Center(
                                        child: Text(
                                          chatScreencontroller.unseenChats.toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 8),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  )
                                      : const SizedBox(),
                                )
                              ],
                            ),
                            Text(
                              value.name.tr,
                              maxLines: 1,
                              style: TextStyle(
                                  fontFamily: kAppFont,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: controller.selectedTab == key
                                      ? Colors.white
                                      : Colors.grey.shade700),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
                .values
                .toList(),
          ),
        ),
      ),
    );
  }

  checkNotificationUnreadCount() {
    int index = notificationScreenController.travellerDetailsNotificationList
        .indexWhere((element) => element.seen == true);
    if (index != -1) {
      print(
          "SELECTED NOTI ${notificationScreenController.travellerDetailsNotificationList[index!].toString()}");
      notificationScreenController
          .travellerNotificationListModel.unseenNotifications = true;
    } else {
      notificationScreenController
          .travellerNotificationListModel.unseenNotifications = false;
    }
  }
}

appbarText({required String text}) {
  return Text(
    text,
    style: const TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  );
}
