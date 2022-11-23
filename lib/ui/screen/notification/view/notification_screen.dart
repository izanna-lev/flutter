import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pagination_view/pagination_view.dart';
import 'package:tralever_module/models/notifications_model/traveller_notification_model.dart';
import 'package:tralever_module/services/over&loding.dart';
import 'package:tralever_module/ui/screen/notification/view/notification_view.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.back();
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
              TravellerDetailsNotificationList travellerDetailsNotificationList,
              int index) {
            return NotificationView(
                travellerDetailsNotificationList:
                    travellerDetailsNotificationList);
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
        );
  }
}
