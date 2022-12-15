import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pagination_view/pagination_view.dart';
import 'package:tralever_module/custem_class/constant/app_images.dart';
import 'package:tralever_module/models/notifications_model/traveller_notification_model.dart';
import 'package:tralever_module/services/over&loding.dart';
import 'package:tralever_module/ui/screen/chats/controller/chat_screen_controller.dart';

import '../../../../custem_class/constant/app_colors.dart';
import '../../../../custem_class/constant/app_icons.dart';
import '../../../../custem_class/constant/app_settings.dart';
import '../../../../custem_class/utils/globle.dart';
import '../../../../services/api_routes.dart';
import '../../Home_screen/itinerary_details/itinerary_detailes_screen.dart';
import '../../base_screen/controller/base_screen_controller.dart';
import '../../chats/view/message_screen.dart';
import '../controller/Notification_controller.dart';

class NotificationScreen extends StatefulWidget {
  static const String routeName = "/NotificationScreen";

  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  NotificationScreenController notificationScreenController =
      Get.find<NotificationScreenController>();
  ChatScreenController chatScreenController = Get.find<ChatScreenController>();
  BaseScreenController baseScreenController = Get.find<BaseScreenController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: checkNotificationUnreadCount(),
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                checkNotificationUnreadCount();
                Get.back();
                // refreshKey();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            title: const Text(
              "Notifications",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          body: PaginationView(
            key: notificationScreenController.notificationKey,
            scrollDirection: Axis.vertical,
            physics: const AlwaysScrollableScrollPhysics(),
            pullToRefresh: true,
            bottomLoader: const AppLoader(),
            itemBuilder: (BuildContext context,
                TravellerDetailsNotificationList
                    travellerDetailsNotificationList,
                int index) {
              // print(
              //     'NOTIFICATION_TEXT==>${travellerDetailsNotificationList.text.length}');
              // return NotificationView(
              //     travellerDetailsNotificationList:
              //         travellerDetailsNotificationList);
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: GestureDetector(
                  onTap: () {
                    // notificationScreenController.index = index;

                    travellerDetailsNotificationList.seen = true;

                    setState(() {
                      notificationScreenController
                          .travellerNotificationSeen(
                              notificationRef:
                                  travellerDetailsNotificationList.id)
                          .then((value) => notificationRedirection(
                              travellerDetailsNotificationList));
                      int index = notificationScreenController
                          .travellerDetailsNotificationList
                          .indexWhere((element) => element.seen == false);
                      baseScreenController.notiUnreadCount = (index != -1);
                      // .then((value) =>
                      //     travellerDetailsNotificationList.seen = true);
                      print(
                          ' widget.travellerDetailsNotificationList.sourceRef===>${travellerDetailsNotificationList.sourceRef}');

                      // notificationScreenController.update();
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.transparent,
                        child: Row(
                          children: [
                            Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.topRight,
                                children: [
                                  Container(
                                    height: 41,
                                    width: 41,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: travellerDetailsNotificationList
                                                    .type ==
                                                1
                                            ? DecorationImage(
                                                image: AssetImage(AppIcons
                                                    .adminNotificationIcon))
                                            : travellerDetailsNotificationList
                                                    .image.isNotEmpty
                                                ? DecorationImage(
                                                    image: NetworkImage(
                                                        imageUrl +
                                                            travellerDetailsNotificationList
                                                                .image
                                                        // "https://images.allthingsnature.org/moss-on-stones-around-a-waterfall.jpg",
                                                        ),
                                                    fit: BoxFit.cover,
                                                  )
                                                : DecorationImage(
                                                    image: AssetImage(AppImages
                                                        .loginBackgroundImage),
                                                    fit: BoxFit.cover)),
                                  ),
                                  travellerDetailsNotificationList.seen == false
                                      ? Container(
                                          height: 10,
                                          width: 10,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: AppColors.appBlueColor,
                                            // color: const Color(0xffC90E0E),
                                          ),
                                        )
                                      : SizedBox()
                                ]),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(travellerDetailsNotificationList.text,
                                      // "Smit Dhola",
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          Text(
                            displayNotificationTimeFromTimestamp(
                                travellerDetailsNotificationList.createdOn),
                            // "2 May 2021, 2:30 PM",
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              );
            },
            pageFetch: notificationScreenController.travellerNotificationList,
            onEmpty: const Center(
              child: Text("Data not found"),
            ),
            onError: (error) {
              return Center(
                child: Text(error),
              );
            },
            initialLoader: GetPlatform.isAndroid
                ? const Center(
                    child: AppLoader(),
                  )
                : const Center(
                    child: CupertinoActivityIndicator(),
                  ),
          )
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          //   child: ListView.builder(
          //     itemCount: 15,
          //     itemBuilder: (BuildContext context, int index) {
          //       return GestureDetector(
          //         onTap: () {},
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.start,
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Container(
          //               color: Colors.transparent,
          //               child: Row(
          //                 children: [
          //                   Stack(
          //                       clipBehavior: Clip.none,
          //                       alignment: Alignment.topRight,
          //                       children: [
          //                         Container(
          //                           height: 41,
          //                           width: 41,
          //                           decoration: BoxDecoration(
          //                             borderRadius: BorderRadius.circular(20),
          //                             image: const DecorationImage(
          //                               image: NetworkImage(
          //                                 "https://images.allthingsnature.org/moss-on-stones-around-a-waterfall.jpg",
          //                               ),
          //                               fit: BoxFit.cover,
          //                             ),
          //                           ),
          //                         ),
          //                         // notificationScreenController
          //                         //             .notificationListModel[index]
          //                         //             .seen ==
          //                         //         true
          //                         //     ? const SizedBox()
          //                         //     :
          //                         Container(
          //                           height: 10,
          //                           width: 10,
          //                           decoration: BoxDecoration(
          //                             borderRadius: BorderRadius.circular(10),
          //                             color: AppColors.appBlueColor,
          //                             // color: const Color(0xffC90E0E),
          //                           ),
          //                         ),
          //                       ]),
          //                   const SizedBox(width: 10),
          //                   Expanded(
          //                     child: Column(
          //                       crossAxisAlignment: CrossAxisAlignment.start,
          //                       children: const [
          //                         Text("Smit Dhola",
          //                             maxLines: 3,
          //                             overflow: TextOverflow.ellipsis,
          //                             style: TextStyle(
          //                                 fontSize: 14,
          //                                 fontWeight: FontWeight.w500)),
          //                       ],
          //                     ),
          //                   )
          //                 ],
          //               ),
          //             ),
          //             Row(
          //               children: const [
          //                 Spacer(),
          //                 Text(
          //                   "2 May 2021, 2:30 PM",
          //                   style: TextStyle(
          //                     color: Colors.grey,
          //                     fontSize: 12,
          //                     fontWeight: FontWeight.w500,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             const SizedBox(height: 10),
          //           ],
          //         ),
          //       );
          //     },
          //   ),
          // ),
          ),
    );
  }

  notificationRedirection(
      TravellerDetailsNotificationList travellerDetailsNotificationList) {
    travellerDetailsNotificationList.type == 1
        ? travellerDetailsNotificationList.type = 1
        : travellerDetailsNotificationList.type == 2
            ? Get.toNamed(MessageScreen.routeName, arguments: {
                "channelRef": travellerDetailsNotificationList.sourceRef,
              })
            : travellerDetailsNotificationList.type == 3
                ? Get.toNamed(ItineraryDetailScreen.routeName,
                    arguments: travellerDetailsNotificationList.sourceRef)
                : travellerDetailsNotificationList.type == 4
                    ? Get.toNamed(ItineraryDetailScreen.routeName,
                        arguments: travellerDetailsNotificationList.sourceRef)
                    : travellerDetailsNotificationList.type == 5
                        ? Get.toNamed(ItineraryDetailScreen.routeName,
                            arguments:
                                travellerDetailsNotificationList.sourceRef)
                        : travellerDetailsNotificationList.type == 6
                            ? Get.toNamed(ItineraryDetailScreen.routeName,
                                arguments:
                                    travellerDetailsNotificationList.sourceRef)
                            : const SizedBox();
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
